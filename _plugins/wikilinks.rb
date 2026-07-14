# frozen_string_literal: true

# Convert Obsidian-style [[Page#Section|label]] wikilinks to Markdown links for Jekyll.
# Source files stay Obsidian-compatible; the site renders clickable cross-references.

module Burners
  module Wikilinks
    WIKILINK = /\[\[([^\]|#]+)(?:#([^\]|]+))?(?:\|([^\]]+))?\]\]/.freeze

    PAGE_SLUGS = {
      'Burners Adventure Game' => 'burners-adventure-game',
      'Burners Principles' => 'burners-principles',
      'Burners Referee Guide' => 'burners-referee-guide',
      'Burners Sorcerie' => 'burners-sorcerie',
      'Burners Invocations' => 'burners-invocations',
      'Burners Company' => 'burners-company',
      'Burners Ancestry' => 'burners-ancestry',
      'Burners Equipment' => 'burners-equipment',
      'Burners Arms and Armor' => 'burners-arms-and-armor',
      'Burners OSE Conversions' => 'burners-ose-conversions',
      'Burners Examples of Play' => 'burners-examples-of-play',
      'Burners Burn Undead' => 'burners-burn-undead',
      'We Burn Undead' => 'burners-burn-undead'
    }.freeze

    module_function

    def page_slug(title)
      PAGE_SLUGS[title.strip] || title.strip.downcase.gsub(/\s+/, '-')
    end

    # Match kramdown auto_id / auto_id_stripping (punctuation removed, spaces → hyphens).
    def anchor_slug(heading)
      id = heading.to_s.downcase
      id = id.gsub(/<[^>]*>/, '')
      id = id.gsub(/[^a-z0-9\-\_ ]+/, '')
      id.gsub(/[ \-\_]+/, '-').gsub(/^-+|-+$/, '')
    end

    def convert(content, baseurl)
      content.gsub(WIKILINK) do
        page = Regexp.last_match(1).strip
        section = Regexp.last_match(2)&.strip
        label = Regexp.last_match(3)&.strip

        slug = page_slug(page)
        href = "#{baseurl}/#{slug}.html"
        href += "##{anchor_slug(section)}" if section

        link_text = label || section || page
        "[#{link_text}](#{href})"
      end
    end
  end
end

Jekyll::Hooks.register :pages, :pre_render do |page|
  next unless page.extname == '.md'

  baseurl = page.site.config['baseurl'].to_s.chomp('/')
  page.content = Burners::Wikilinks.convert(page.content, baseurl)
end
