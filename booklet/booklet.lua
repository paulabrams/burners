--[==[
booklet.lua: pandoc filter that shapes Burners books into booklet pages.

Run by build.sh. The markdown is not changed; this only decides how it is laid
out:

  * The opening block (# TITLE, the italic taglines, the version line) comes
    off the top of the first book and feeds the cover and title page.
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
  * A paragraph that is a list in all but name, one "Name — *gloss*" to a
    line (the spell lists), keeps its lines.
  * A working tag such as #needs-playtest is set small and grey.
  * A fenced block of more than a few lines (a quick-reference card) runs the
    full page width, since its lines are set as typed and will not fit a
    column. A short one stays in the column and wraps.
  * Art is dropped in at the headings it names, or above a paragraph that
    opens with the bold lead-in it names.

A booklet can bind several books. The first is laid out as above. Each book
after it starts on a new page under its own # title; its ## headings stay in
the columns, and the "---" rules it puts in front of headings (dividers on the
website) are left out. A reference to a book that is in the booklet becomes a
page reference ("Burners Sorcerie, p. 52") instead of a link to the website,
and the contents page lists every book with its ## headings.

The recipe is booklet/<name>.json, next to this file. All of it is optional:

  {
    "title": "Burners",                 cover title (default: the # heading)
    "subtitle": "an Adventure Game",
    "author": "Paul Abrams",
    "books": ["burners-adventure-game", "burners-equipment"],
                                        the books to bind, in order (default:
                                        the one book the recipe is named after)
    "cover": "/images/...",             default: the first book's hero image
    "title_art": "/images/...",         small piece on the title page
    "contents_art": "/images/...",      banner on the contents page
    "back_cover": "some-file.md",       markdown for the back cover
    "art": [
      { "at": "Wounds", "image": "/images/...", "place": "after" }
    ]
  }

Art that belongs to a book goes in booklet/art/<book>.json (the list alone,
without the braces around it), so every booklet that holds the book gets it.
"art" in the recipe is for that one booklet: it is read for the first book, or
for the book named by "book" on the piece, and a piece with the same "at" as
one of the book's own takes its place (to give it a different width, say).

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

A later book in a booklet opens with its hero image in the column under the
title, unless that image is already somewhere in the booklet or the book's art
names a piece for its title.
]==]

local stringify = pandoc.utils.stringify

local HERE = (PANDOC_SCRIPT_FILE or ""):match("^(.*)[/\\][^/\\]*$") or "."
local ROOT = HERE .. "/.."

-- Must match FORMAT in build.sh.
local MARKDOWN = "commonmark_x+wikilinks_title_after_pipe-tex_math_dollars"

local NOTES_LINES = 25
local CARD_LINES = 4   -- a fenced block longer than this runs the full page width

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

local function read_json(path)
  local text = read_file(path)
  if not text then return nil end
  local ok, data = pcall(pandoc.json.decode, text, false)
  if not ok or type(data) ~= "table" then
    error("booklet: cannot read " .. path .. ": " .. tostring(data))
  end
  return data
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

-- "Burners Sorcerie" -> "burners-sorcerie", the book's file name.
local function book_slug(page)
  return (page:lower():gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", "-"))
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
local shown = {}   -- images already somewhere in the booklet

local function image_rel(path)
  return (path:gsub("^/+", ""))
end

-- "/images/albert-robida-pd/x.jpg" -> "images/albert-robida-pd/x.jpg", checked
-- against the repo, with the artist noted for the title page.
local function image_url(path)
  local rel = image_rel(path)
  if not read_file(ROOT .. "/" .. rel) then
    warn("image not found, left out: " .. path)
    return nil
  end
  shown[rel] = true
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

-- Inline pass ----------------------------------------------------------------

-- `inside` holds the books bound into this booklet when there are several
-- (empty for a single book); `slug` is the book being read.
local function inline_pass(site, inside, slug)
  return {
    Link = function(link)
      if not link.classes:includes("wikilink") then
        -- [Scrolls](#scrolls): a heading in the same book.
        if inside[slug] and link.target:match("^#") then
          link.target = "#" .. slug .. "--" .. link.target:sub(2)
          link.classes:insert("pageref")
          return link
        end
        return nil
      end
      -- A link wrapped over two lines in the markdown arrives with the break in it.
      local target = link.target:gsub("%s+", " ")
      local page, section = target:match("^([^#]*)#(.*)$")
      page = page or target
      local label = stringify(link.content):gsub("%s+", " ")
      local text = label
      if label == target then
        text = section and (page .. ": " .. section) or page
      end
      local to = book_slug(page)
      if inside[to] then
        local href = "#" .. to
        if section then href = href .. "--" .. anchor_slug(section) end
        return pandoc.Link({ pandoc.Str(text) }, href, "", pandoc.Attr("", { "bookref", "pageref" }))
      end
      if not site or not read_file(ROOT .. "/markdown/" .. to .. ".md") then
        warn("no book for [[" .. target .. "]], set as plain text")
        return pandoc.Emph({ pandoc.Str(text) })
      end
      local href = site .. "/" .. to .. ".html"
      if section then href = href .. "#" .. anchor_slug(section) end
      return pandoc.Link({ pandoc.Str(text) }, href, "", pandoc.Attr("", { "bookref" }))
    end,
    Str = function(str)
      if str.text:match("^#%a[%w%-]*$") then
        return pandoc.Span({ str }, pandoc.Attr("", { "tag" }))
      end
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

-- True when every line of the paragraph reads "Name — *gloss*" (a tag may
-- follow): a list written without bullets, as the spell lists are.
local function is_catalog(para)
  local lines, line = {}, {}
  for _, el in ipairs(para.content) do
    if el.t == "SoftBreak" then
      lines[#lines + 1] = line
      line = {}
    else
      line[#line + 1] = el
    end
  end
  lines[#lines + 1] = line
  if #lines < 2 then return false end
  for _, l in ipairs(lines) do
    local dash, last = false, nil
    for _, el in ipairs(l) do
      if el.t == "Str" and el.text == "—" then dash = true end
      if el.t ~= "Space" and el.t ~= "Span" then last = el end
    end
    if not (dash and last and last.t == "Emph") then return false end
  end
  return true
end

-- Contents -------------------------------------------------------------------

-- Entries marked `top` are the bold lines; the rest hang under the one above.
local function contents_html(entries)
  local out = { '<ul class="toc">' }
  local open_item, open_sub = false, false
  for _, e in ipairs(entries) do
    local link = string.format('<a href="#%s">%s</a>', esc(e.id), esc(e.text))
    if e.top then
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

-- The booklet ----------------------------------------------------------------

function Pandoc(doc)
  local input = (PANDOC_STATE.input_files[1] or ""):match("([^/\\]+)%.md$")
  local name = doc.meta["booklet-name"] and stringify(doc.meta["booklet-name"]) or input
  local recipe = name and read_json(HERE .. "/" .. name .. ".json") or {}
  local site = site_url()

  local slugs = recipe.books or { input or name }
  local multi = #slugs > 1
  local inside = {}
  if multi then
    for _, slug in ipairs(slugs) do inside[slug] = true end
  end
  if input and slugs[1] ~= input then
    warn("the first book is " .. slugs[1] .. " but pandoc was given " .. input)
  end

  -- The cover pieces first, so no book repeats them.
  local hero = doc.meta.hero and stringify(doc.meta.hero)
  local cover = recipe.cover or hero
  local cover_url = cover and image_url(cover)
  local title_art_url = recipe.title_art and image_url(recipe.title_art)
  local contents_art_url = recipe.contents_art and image_url(recipe.contents_art)

  local back
  if recipe.back_cover then
    local text = read_file(HERE .. "/" .. recipe.back_cover)
    if text then
      back = pandoc.read(text, MARKDOWN):walk(inline_pass(site, {}, "")).blocks
    else
      warn("back cover file not found: " .. recipe.back_cover)
    end
  end

  local chapters, chapter = {}, nil
  local toc = {}
  local seen_ids = {}
  local all_art = {}

  -- The art for one book, looked up by the heading it hangs on: the book's own
  -- list, then the recipe's pieces for it.
  local function art_of(slug)
    local list = {}
    for _, art in ipairs(read_json(HERE .. "/art/" .. slug .. ".json") or {}) do
      if art.at and art.image then list[#list + 1] = art end
    end
    for _, art in ipairs(recipe.art or {}) do
      if art.at and art.image and (art.book or slugs[1]) == slug then
        local swapped = false
        for i, own in ipairs(list) do
          if key(own.at) == key(art.at) and key(own.under or "") == key(art.under or "") then
            list[i] = art
            swapped = true
          end
        end
        if not swapped then list[#list + 1] = art end
      end
    end
    local at = {}
    for _, art in ipairs(list) do
      local k = key(art.at)
      at[k] = at[k] or {}
      table.insert(at[k], art)
      all_art[#all_art + 1] = art
    end
    return at
  end

  -- A heading id nothing else in the booklet has. The site numbers repeats the
  -- same way (kramdown: sorcerie, sorcerie-1).
  local function claim(id)
    if seen_ids[id] then
      local n = 1
      while seen_ids[id .. "-" .. n] do n = n + 1 end
      id = id .. "-" .. n
    end
    seen_ids[id] = true
    return id
  end

  local function lay_out(blocks, book)
    chapter = nil

    local function new_chapter(header)
      chapter = { header = header, banner = {}, segments = {}, tail = {}, book = book }
      chapters[#chapters + 1] = chapter
      if not book.started then
        book.started = true
        chapter.first = true
        if multi then
          seen_ids[book.slug] = true
          toc[#toc + 1] = { top = true, id = book.slug, text = book.title }
        end
      end
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
    local art_at = art_of(book.slug)
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
        if not nxt then
          -- a rule that closes the book: nothing to divide
        elseif nxt.t == "Header" and not book.lead then
          -- a divider on the website; the heading does the job in print
        elseif nxt.t == "Header" and nxt.level == 2 then
          chapter_next = true
        else
          put(b)
        end

      elseif b.t == "Header" then
        local text = stringify(b)
        local opens_book = b.level == 1 and not book.lead
        if opens_book then
          book.title = text
          b.identifier = ""   -- the page it opens carries the book's id
        elseif multi then
          b.identifier = claim(book.slug .. "--" .. anchor_slug(text))
        else
          if b.identifier == "" then b.identifier = anchor_slug(text) end
          if seen_ids[b.identifier] then
            warn("two headings share the id #" .. b.identifier .. ": " .. text)
          end
          seen_ids[b.identifier] = true
        end

        if b.level == 2 then section = key(text) end
        local arts = art_for(text)
        nearest = key(text)
        if opens_book and #arts == 0 and book.hero and not shown[image_rel(book.hero)] then
          arts = { { image = book.hero } }
        end

        if opens_book or (book.lead and b.level == 2 and (chapter_next or not chapter)) then
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

        if not opens_book then
          if multi and b.level == 2 then
            toc[#toc + 1] = { id = b.identifier, text = text }
          elseif not multi and (b.level == 2 or b.level == 3) then
            toc[#toc + 1] = { top = b.level == 2, id = b.identifier, text = text }
          end
        end

      elseif b.t == "Table" then
        local tbl, wide = shape_table(b)
        if wide then
          put_full(pandoc.Div({ tbl }, pandoc.Attr("", { "wide" })))
        else
          put(tbl)
        end

      elseif b.t == "CodeBlock" then
        local _, breaks = b.text:gsub("\n", "\n")
        if breaks + 1 > CARD_LINES then put_full(b) else put(b) end

      elseif b.t == "Para" and #b.content == 1 and b.content[1].t == "Emph" then
        put(pandoc.Div({ b }, pandoc.Attr("", { "aside" })))

      elseif b.t == "Para" and is_catalog(b) then
        for n, el in ipairs(b.content) do
          if el.t == "SoftBreak" then b.content[n] = pandoc.LineBreak() end
        end
        put(pandoc.Div({ b }, pandoc.Attr("", { "catalog" })))

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
  end

  -- The first book gives the cover its title; the rest follow it.
  local opening
  for n, slug in ipairs(slugs) do
    local book = { slug = slug, lead = n == 1 }
    if book.lead then
      local rest
      opening, rest = take_opening(doc:walk(inline_pass(site, inside, slug)).blocks)
      book.title = doc.meta.title and stringify(doc.meta.title) or opening.title or slug
      lay_out(rest, book)
    else
      local text = read_file(ROOT .. "/markdown/" .. slug .. ".md")
      if text then
        local part = pandoc.read(text, MARKDOWN)
        book.title = part.meta.title and stringify(part.meta.title) or slug
        book.hero = part.meta.hero and stringify(part.meta.hero)
        lay_out(part:walk(inline_pass(site, inside, slug)).blocks, book)
      else
        warn("no such book, left out: markdown/" .. slug .. ".md")
      end
    end
  end

  for _, art in ipairs(all_art) do
    if not art.used then
      local where = art.under and (' under "' .. art.under .. '"') or ""
      warn('no heading or bold lead-in named "' .. art.at .. '"' .. where .. ", art left out: " .. art.image)
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
    local id, classes, attrs = "", { "chapter" }, {}
    if multi then
      if ch.first then
        id = ch.book.slug
        classes[#classes + 1] = "opens-book"
      end
      attrs = { { "data-book", ch.book.title } }
    end
    out[#out + 1] = pandoc.Div(parts, pandoc.Attr(id, classes, attrs))
  end

  -- A page reference to a heading that is not there points at its book instead.
  if multi then
    local mended = pandoc.Pandoc(out):walk({
      Link = function(link)
        if not link.classes:includes("pageref") then return nil end
        local id = link.target:sub(2)
        if seen_ids[id] then return nil end
        local book = id:match("^(.-)%-%-")
        warn("no heading for the reference to #" .. id .. " (" .. stringify(link.content) .. ")")
        if book and seen_ids[book] and link.classes:includes("bookref") then
          link.target = "#" .. book
          return link
        end
        return link.content
      end,
    })
    out = {}
    for _, b in ipairs(mended.blocks) do out[#out + 1] = b end
  end

  -- Notes pages bring the count to a multiple of four (build.sh works out how
  -- many), so the back cover lands on the outside of the folded booklet.
  local pad = tonumber(doc.meta["booklet-pad"] and stringify(doc.meta["booklet-pad"])) or 0
  local notes = '<div class="notes"><h2>Notes</h2><div class="lines">'
    .. string.rep("<div></div>", NOTES_LINES) .. "</div></div>"
  for _ = 1, pad do out[#out + 1] = pandoc.RawBlock("html", notes) end

  local title = recipe.title or opening.title or stringify(doc.meta.title or "Burners")

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
  local date = meta["booklet-date"] and stringify(meta["booklet-date"]) or ""

  set("bk-title", title)
  set("bk-subtitle", recipe.subtitle)
  set("bk-version", opening.version)
  set("bk-date", date)
  set("bk-author", recipe.author)
  set("bk-year", date:match("(%d%d%d%d)%s*$"))
  set("bk-site", site and (site:gsub("^https?://", "")))
  set("bk-cover", cover_url)
  set("bk-title-art", title_art_url)
  set("bk-contents-art", contents_art_url)
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
