class PDFConverterCustomTitlePage < (Asciidoctor::Converter.for 'pdf')
  register_for 'pdf'

  def ink_title_page doc
    stroke_axis

    bounding_box([400, 750], width: 100, height: 35) do
      transparent(1) { stroke_bounds }
      font_size 8
      indent(5) do
        text ' hogehoge: P.1-100', style: :bold
        text ' foobar: P.101-200', style: :bold
        text ' fugafuga: P.201-300', style: :bold
      end
    end

    move_cursor_to page_height * 0.75

    theme_font :title_page do
      doctitle = doc.doctitle partition: true
      theme_font :title_page_title do
        ink_prose doctitle.main, align: :center, color: theme.base_font_color, line_height: 1, margin: 0
      end
      if (subtitle = doctitle.subtitle)
        theme_font :title_page_subtitle do
          move_down 10
          ink_prose subtitle, align: :center, margin: 0
          move_down 10
        end
      end

      # move_cursor_to page_height * 0.5

      convert ::Asciidoctor::Block.new doc, :image,
        content_model: :empty,
        attributes: { 'target' => 'lena.jpg', 'pdfwidth' => '1.5in', 'align' => 'center' },
        pinned: true
    end

    bounding_box([100, 200], width: 300, height: 150) do
      transparent(1) { stroke_bounds }
      font_size 10
      text 'Warning', style: :bold, align: :center
      indent(10) do
        text 'I am very much in the midst of this development. At the same time, everything was appreciated by the guesthouse these days only because of its bondage, and it had to keep discovering things, and it had never acknowledged them to begin with. It was impossible not to know everything to the farmers. Oita Omori-san failed the exam and moved on to the lecture a little more. The prize means something of a trick, and at that time it went up to them or the individual principal, and left Omori-san at the junior high school if he did not give his opinion as if he were to develop and be able to develop your own will, or else the use would be unknown.'
      end
    end
  end
end