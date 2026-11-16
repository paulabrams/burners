--[==[
booklet.lua: pandoc filter that shapes one Burners book into booklet pages.

Run by build.sh. The book's markdown is not changed; this only decides how it
is laid out:

  * The opening block (# TITLE, the italic taglines, the version line) comes
    off the top and feeds the cover and title page.
  * A "---" rule followed by a ## heading starts a chapter on a new page with a
    full-width title. Every other heading stays in the two-column flow.
  * [[Burners Sorcerie]] and [[Burners Equipment#Count these]] become italic
    book references that link to the website.
  * Paragraphs written entirely in italics (examples, epigraphs) are set off
    with a rule down the side.
  * Bullet lists whose every item opens with a bold term are set as run-in
    definitions instead of bullets.
  * Tables of short entries (price lists) get the hand-lettered ledger face.
    Tables of five or more columns run the full page width.
  * Art from the recipe is dropped in at the headings it names, or above a
    paragraph that opens with the bold lead-in it names.

The recipe is booklet/<book>.json, next to this file. All of it is optional:

  {
    "title": "Burners",                 cover title (default: the # heading)
    "subtitle": "an Adventure Game",
    "author": "Paul Abrams",
    "cover": "/images/...",             default: the page's hero image
    "title_art": "/images/...",         small piece on the title page
    "contents_art": "/images/...",      banner on the contents page
    "back_cover": "some-file.md",       markdown for the back cover
    "art": [
      { "at": "Wounds", "image": "/images/...", "place": "after" }
    ]
  }

"at" is the text of a heading, or the bold words that open a paragraph
("In the dirt"), for art in the middle of a long section. When the same words
turn up twice (Combat is in the Glossary and in Part Two), add "under" with the
## heading it sits below, or the nearest heading above it:

      { "at": "Combat", "under": "Part Two: Playing", "image": "/images/..." }
      { "at": "In the dirt", "under": "Combat", "image": "/images/..." }

"place" is one of:

  after    in the column, right under the heading (the default); for a bold
           lead-in, right above its paragraph
  before   in the column, right above the heading
  banner   full page width, above the heading (under it for a chapter title)
  end      full page width, at the end of the chapter the heading is in

"width" (any CSS length or percentage) is optional on each piece. An "end"
piece too tall for the room left under the text moves to a page of its own;
give it a smaller width to pull it back.
Image paths are written the way the hero: front matter writes them, from the
repo root. Artist credits on the title page come from the folder names of the
images used (albert-robida-pd becomes Albert Robida).
]==]

local stringify = pandoc.utils.stringify

local HERE = (PANDOC_SCRIPT_FILE or ""):match("^(.*)[/\\][^/\\]*$") or "."
local ROOT = HERE .. "/.."

-- Must match FORMAT in build.sh.
local MARKDOWN = "commonmark_x+wikilinks_title_after_pipe-tex_math_dollars"

local NOTES_LINES = 25

local function warn(msg)
  io.stderr:write("booklet: " .. msg .. "\n")
end

local function esc(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

local function read_file(path)
  local f = io.open(path, "r")
  if not f then return nil end
  local s = f:read("a")
  f:close()
  return s
end

-- Heading text reduced to something a recipe can match: case, spacing and
-- curly quotes don't count.
local function key(s)
  s = s:gsub("[\u{2018}\u{2019}]", "'"):gsub("[\u{201C}\u{201D}]", '"')
  s = s:lower():gsub("%s+", " ")
  return (s:gsub("^ ", ""):gsub(" $", ""))
end

-- Same rule the site uses for heading anchors (kramdown auto_id_stripping,
-- mirrored in _plugins/wikilinks.rb).
local function anchor_slug(heading)
  local id = heading:lower():gsub("[^a-z0-9%-_ ]+", "")
  id = id:gsub("[ %-_]+", "-")
  return (id:gsub("^%-+", ""):gsub("%-+$", ""))
end

local function site_url()
  local cfg = "\n" .. (read_file(ROOT .. "/_config.yml") or "")
  local url = cfg:match('\nurl:%s*"?([^"\n]+)"?')
  local base = cfg:match('\nbaseurl:%s*"?([^"\n]*)"?') or ""
  if not url then return nil end
  return (url:gsub("/+$", "")) .. base
end

-- Images ---------------------------------------------------------------------

local credits, credited = {}, {}

-- "/images/albert-robida-pd/x.jpg" -> "images/albert-robida-pd/x.jpg", checked
-- against the repo, with the artist noted for the title page.
local function image_url(path)
  local rel = path:gsub("^/+", "")
  if not read_file(ROOT .. "/" .. rel) then
    warn("image not found, left out: " .. path)
    return nil
  end
  local folder = rel:match("([^/]+)/[^/]+$")
  if folder and folder:match("%-pd$") then
    local artist = folder:gsub("%-pd$", ""):gsub("%-", " ")
    artist = artist:gsub("(%a)(%a*)", function(a, b) return a:upper() .. b end)
    if not credited[artist] then
      credited[artist] = true
      table.insert(credits, artist)
    end
  end
  return (rel:gsub(" ", "%%20"))
end

local function figure(art, class)
  local src = image_url(art.image)
  if not src then return nil end
  local style = art.width and (' style="width:' .. esc(art.width) .. '"') or ""
  return pandoc.RawBlock("html", string.format(
    '<figure class="art %s"><img src="%s" alt=""%s></figure>', class, esc(src), style))
end

-- Recipe ---------------------------------------------------------------------

local function load_recipe()
  local input = PANDOC_STATE.input_files[1] or ""
  local book = input:match("([^/\\]+)%.md$")
  if not book then return {} end
  local path = HERE .. "/" .. book .. ".json"
  local text = read_file(path)
  if not text then return {} end
  local ok, recipe = pcall(pandoc.json.decode, text, false)
  if not ok or type(recipe) ~= "table" then
    error("booklet: cannot read recipe " .. path .. ": " .. tostring(recipe))
  end
  return recipe
end

-- Inline pass ----------------------------------------------------------------

local function inline_pass(site)
  return {
    Link = function(link)
      if not link.classes:includes("wikilink") then return nil end
      local target = link.target
      local page, section = target:match("^([^#]*)#(.*)$")
      page = page or target
      local label = stringify(link.content)
      local text = label
      if label == target then
        text = section and (page .. ": " .. section) or page
      end
      local slug = page:lower():gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", "-")
      if not site or not read_file(ROOT .. "/markdown/" .. slug .. ".md") then
        warn("no book for [[" .. target .. "]], set as plain text")
        return pandoc.Emph({ pandoc.Str(text) })
      end
      local href = site .. "/" .. slug .. ".html"
      if section then href = href .. "#" .. anchor_slug(section) end
      return pandoc.Link({ pandoc.Str(text) }, href, "", pandoc.Attr("", { "bookref" }))
    end,
    Image = function(img)
      if img.src:match("^/") then
        img.src = image_url(img.src) or img.src
        return img
      end
    end,
  }
end

-- Opening block --------------------------------------------------------------

-- Take "# TITLE", the all-italic lines under it, a version line and the rule
-- that closes them off the top of the book.
local function take_opening(blocks)
  local opening = { taglines = {} }
  local i = 1
  if blocks[1] and blocks[1].t == "Header" and blocks[1].level == 1 then
    opening.title = stringify(blocks[1])
    i = 2
    while blocks[i] do
      local b = blocks[i]
      if b.t == "Para" and #b.content == 1 and b.content[1].t == "Emph" then
        table.insert(opening.taglines, pandoc.MetaInlines(b.content[1].content))
      elseif b.t == "Para" and stringify(b):match("^v%d[%d%.]*$") then
        opening.version = stringify(b)
      elseif b.t == "HorizontalRule" then
        i = i + 1
        break
      else
        break
      end
      i = i + 1
    end
  end
  local rest = {}
  for j = i, #blocks do rest[#rest + 1] = blocks[j] end
  return opening, rest
end

-- Tables ---------------------------------------------------------------------

local LEDGER_MAX = 36   -- longest cell, in characters, a ledger table may hold
local WIDE_COLUMNS = 5
local LONG_ROWS = 12    -- a table with more rows than this may run on into the next column
local NARROW_MAX = 6    -- a column whose cells are all this short is kept tight

-- Marks a table of short entries as a ledger, a long one as free to break, and
-- its columns of numbers as narrow, so the words get the room; says whether it
-- needs the full page width.
local function shape_table(tbl)
  local longest, rows = 0, 0
  local widest = {}   -- per column, the longest body cell
  for _, body in ipairs(tbl.bodies) do
    for _, row in ipairs(body.body) do
      rows = rows + 1
      for c, cell in ipairs(row.cells) do
        local n = #stringify(cell.contents)
        longest = math.max(longest, n)
        widest[c] = math.max(widest[c] or 0, n)
      end
    end
  end
  if longest <= LEDGER_MAX then tbl.attr.classes:insert("ledger") end
  if rows > LONG_ROWS then tbl.attr.classes:insert("long") end

  local narrow, some_wide = {}, false
  for c, n in ipairs(widest) do
    narrow[c] = n <= NARROW_MAX
    some_wide = some_wide or not narrow[c]
  end
  if some_wide then
    local function mark(row_list)
      for _, row in ipairs(row_list) do
        for c, cell in ipairs(row.cells) do
          if narrow[c] then cell.attr.classes:insert("narrow") end
        end
      end
    end
    mark(tbl.head.rows)
    for _, body in ipairs(tbl.bodies) do mark(body.body) end
  end
  return tbl, #tbl.colspecs >= WIDE_COLUMNS
end

-- Lists ----------------------------------------------------------------------

local function is_terms_list(list)
  if #list.content == 0 then return false end
  for _, item in ipairs(list.content) do
    local first = item[1]
    if not (first and (first.t == "Plain" or first.t == "Para")
        and first.content[1] and first.content[1].t == "Strong") then
      return false
    end
  end
  return true
end

-- Contents -------------------------------------------------------------------

local function contents_html(entries)
  local out = { '<ul class="toc">' }
  local open_item, open_sub = false, false
  for _, e in ipairs(entries) do
    local link = string.format('<a href="#%s">%s</a>', esc(e.id), esc(e.text))
    if e.level == 2 then
      if open_sub then out[#out + 1] = "</ul>"; open_sub = false end
      if open_item then out[#out + 1] = "</li>" end
      out[#out + 1] = "<li>" .. link
      open_item = true
    elseif open_item then
      if not open_sub then out[#out + 1] = "<ul>"; open_sub = true end
      out[#out + 1] = "<li>" .. link .. "</li>"
    end
  end
  if open_sub then out[#out + 1] = "</ul>" end
  if open_item then out[#out + 1] = "</li>" end
  out[#out + 1] = "</ul>"
  return table.concat(out, "\n")
end

-- The book -------------------------------------------------------------------

function Pandoc(doc)
  local recipe = load_recipe()
  local site = site_url()
  doc = doc:walk(inline_pass(site))

  local opening, blocks = take_opening(doc.blocks)

  -- Art, looked up by the heading it hangs on.
  local art_at = {}
  for _, art in ipairs(recipe.art or {}) do
    if art.at and art.image then
      local k = key(art.at)
      art_at[k] = art_at[k] or {}
      table.insert(art_at[k], art)
    end
  end

  local chapters, chapter = {}, nil
  local toc = {}
  local seen_ids = {}

  local function new_chapter(header)
    chapter = { header = header, banner = {}, segments = {}, tail = {} }
    chapters[#chapters + 1] = chapter
  end
  local function need_chapter()
    if not chapter then new_chapter(nil) end
  end
  -- A chapter body is a run of two-column stretches with full-width pieces
  -- between them.
  local function put(block)
    if not block then return end
    need_chapter()
    local last = chapter.segments[#chapter.segments]
    if not last or last.full then
      last = { blocks = {} }
      chapter.segments[#chapter.segments + 1] = last
    end
    last.blocks[#last.blocks + 1] = block
  end
  local function put_full(block)
    if not block then return end
    need_chapter()
    chapter.segments[#chapter.segments + 1] = { full = block }
  end

  -- Each piece of art goes in once, at the first heading that fits it.
  local section = ""   -- the ## heading we are under
  local nearest = ""   -- the last heading above, of any size
  local function art_for(text)
    local found = {}
    for _, art in ipairs(art_at[key(text)] or {}) do
      local under = art.under and key(art.under)
      if not art.used and (not under or under == section or under == nearest) then
        art.used = true
        found[#found + 1] = art
      end
    end
    return found
  end

  local chapter_next = false
  for i, b in ipairs(blocks) do
    if b.t == "HorizontalRule" then
      local nxt = blocks[i + 1]
      if nxt and nxt.t == "Header" and nxt.level == 2 then
        chapter_next = true
      elseif nxt then
        put(b)
      end

    elseif b.t == "Header" then
      local text = stringify(b)
      if b.identifier == "" then b.identifier = anchor_slug(text) end
      if seen_ids[b.identifier] then
        warn("two headings share the id #" .. b.identifier .. ": " .. text)
      end
      seen_ids[b.identifier] = true
      if b.level == 2 or b.level == 3 then
        toc[#toc + 1] = { level = b.level, id = b.identifier, text = text }
      end

      if b.level == 2 then section = key(text) end
      local arts = art_for(text)
      nearest = key(text)

      if b.level == 2 and (chapter_next or not chapter) then
        new_chapter(b)
        chapter_next = false
        for _, art in ipairs(arts) do
          if art.place == "end" then
            table.insert(chapter.tail, figure(art, "wide end"))
          elseif art.place == "banner" or art.place == "before" then
            table.insert(chapter.banner, figure(art, "wide"))
          else
            put(figure(art, "inline"))
          end
        end
      else
        need_chapter()
        for _, art in ipairs(arts) do
          if art.place == "before" then put(figure(art, "inline")) end
          if art.place == "banner" then put_full(figure(art, "wide")) end
        end
        put(b)
        for _, art in ipairs(arts) do
          if art.place == "end" then
            table.insert(chapter.tail, figure(art, "wide end"))
          elseif art.place ~= "before" and art.place ~= "banner" then
            put(figure(art, "inline"))
          end
        end
      end

    elseif b.t == "Table" then
      local tbl, wide = shape_table(b)
      if wide then
        put_full(pandoc.Div({ tbl }, pandoc.Attr("", { "wide" })))
      else
        put(tbl)
      end

    elseif b.t == "Para" and #b.content == 1 and b.content[1].t == "Emph" then
      put(pandoc.Div({ b }, pandoc.Attr("", { "aside" })))

    elseif b.t == "Para" and b.content[1] and b.content[1].t == "Strong" then
      -- A bold lead-in ("In the dirt.") can carry art too.
      local lead = stringify(b.content[1]):gsub("[%.:]+$", "")
      for _, art in ipairs(art_for(lead)) do put(figure(art, "inline")) end
      put(b)

    elseif b.t == "BulletList" and is_terms_list(b) then
      put(pandoc.Div({ b }, pandoc.Attr("", { "terms" })))

    else
      put(b)
    end
  end

  for _, list in pairs(art_at) do
    for _, art in ipairs(list) do
      if not art.used then
        local where = art.under and (' under "' .. art.under .. '"') or ""
        warn('no heading or bold lead-in named "' .. art.at .. '"' .. where .. ", art left out: " .. art.image)
      end
    end
  end

  -- Assemble the pages.
  local out = {}
  for _, ch in ipairs(chapters) do
    local parts = {}
    if ch.header then parts[#parts + 1] = ch.header end
    for _, fig in ipairs(ch.banner) do parts[#parts + 1] = fig end
    for _, seg in ipairs(ch.segments) do
      if seg.full then
        parts[#parts + 1] = seg.full
      elseif #seg.blocks > 0 then
        parts[#parts + 1] = pandoc.Div(seg.blocks, pandoc.Attr("", { "cols" }))
      end
    end
    for _, fig in ipairs(ch.tail) do parts[#parts + 1] = fig end
    out[#out + 1] = pandoc.Div(parts, pandoc.Attr("", { "chapter" }))
  end

  -- Notes pages bring the count to a multiple of four (build.sh works out how
  -- many), so the back cover lands on the outside of the folded booklet.
  local pad = tonumber(doc.meta["booklet-pad"] and stringify(doc.meta["booklet-pad"])) or 0
  local notes = '<div class="notes"><h2>Notes</h2><div class="lines">'
    .. string.rep("<div></div>", NOTES_LINES) .. "</div></div>"
  for _ = 1, pad do out[#out + 1] = pandoc.RawBlock("html", notes) end

  local title = recipe.title or opening.title or stringify(doc.meta.title or "Burners")

  local back
  if recipe.back_cover then
    local text = read_file(HERE .. "/" .. recipe.back_cover)
    if text then
      back = pandoc.read(text, MARKDOWN):walk(inline_pass(site)).blocks
    else
      warn("back cover file not found: " .. recipe.back_cover)
    end
  end
  if not back then
    back = { pandoc.Header(2, title) }
    if site then back[#back + 1] = pandoc.Para({ pandoc.Str((site:gsub("^https?://", ""))) }) end
  end
  out[#out + 1] = pandoc.Div(back, pandoc.Attr("", { "back-cover" }))

  -- What the template needs for the cover, title page and contents.
  local meta = doc.meta
  local function set(name, value)
    if value and value ~= "" then meta[name] = value end
  end
  local hero = meta.hero and stringify(meta.hero)
  local cover = recipe.cover or hero
  local date = meta["booklet-date"] and stringify(meta["booklet-date"]) or ""

  set("bk-title", title)
  set("bk-subtitle", recipe.subtitle)
  set("bk-version", opening.version)
  set("bk-date", date)
  set("bk-author", recipe.author)
  set("bk-year", date:match("(%d%d%d%d)%s*$"))
  set("bk-site", site and (site:gsub("^https?://", "")))
  set("bk-cover", cover and image_url(cover))
  set("bk-title-art", recipe.title_art and image_url(recipe.title_art))
  set("bk-contents-art", recipe.contents_art and image_url(recipe.contents_art))
  if #opening.taglines > 0 then meta["bk-taglines"] = pandoc.MetaList(opening.taglines) end
  if #toc > 0 then
    meta["bk-toc"] = pandoc.MetaBlocks({ pandoc.RawBlock("html", contents_html(toc)) })
  end
  set("bk-credits", table.concat(credits, ", "))

  local pagetitle = title
  if recipe.subtitle then pagetitle = pagetitle .. ", " .. recipe.subtitle end
  if opening.version then pagetitle = pagetitle .. " " .. opening.version end
  meta.pagetitle = pagetitle

  return pandoc.Pandoc(out, meta)
end
