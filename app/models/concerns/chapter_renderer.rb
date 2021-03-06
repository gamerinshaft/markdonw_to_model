class ChapterRenderer < Redcarpet::Render::HTML
  attr_accessor :chapter

  def block_code(code, language)
    -raise
  end

  def block_quote(quote)
    chapter.quotations.build content: quote, order: node_count
    succ_node_count
    nil
  end

  def block_html(raw_html)
    -raise

  end

  def footnotes(content)
    -raise

  end

  def footnote_def(content, number)
    -raise

  end

  def header(text, header_level)
    if header_level == 1
      chapter.name = text
    else
      chapter.headings.build content: text, level: header_level, order: node_count
      succ_node_count
    end
    nil
  end

  def hrule()
    -raise

  end

  def list(contents, list_type)
    -raise

  end

  def list_item(text, list_type)
    -raise

  end

  def paragraph(text)
    return text
  end

  def table(header, body)
    -raise

  end

  def table_row(content)
    -raise

  end

  def table_cell(content, alignment)
    -raise

  end

  def autolink(link, link_type)
    -raise

  end

  def codespan(code)
    chapter.codes.build content: code, order: node_count
    succ_node_count
    nil
  end

  def double_emphasis(text)
    -raise

  end

  def emphasis(text)
    -raise

  end

  def image(link, title, alt_text)
    -raise

  end

  def linebreak()
    -raise

  end

  def link(link, title, content)
    chapter.urls.build link: link, title: title, content: content, order: node_count
    succ_node_count
    nil
  end

  def raw_html(raw_html)
    -raise

  end

  def triple_emphasis(text)
    -raise

  end

  def strikethrough(text)
    -raise

  end

  def superscript(text)
    -raise

  end

  def underline(text)
    -raise

  end

  def highlight(text)
    -raise

  end

  def quote(text)
    -raise
  end

  def footnote_ref(number)
    -raise

  end

  def entity(text)
    -raise
  end

  # def normal_text(text)
  #   -raise
  # end

  # def doc_header()
  #   -raise
  # end

  # def doc_footer()
  #   -raise
  # end

  def node_count
    @node_count ||= 0
  end

  def succ_node_count
    node_count
    @node_count += 1
  end
end