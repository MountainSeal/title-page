class PDFConverterCustomTitlePage < (Asciidoctor::Converter.for 'pdf')
  register_for 'pdf'

  def ink_title_page doc
    # stroke_axis

    bounding_box([400, 750], width: 100, height: 35) do
      transparent(1) { stroke_bounds }
      font_size 8
      indent(5) do
        text ' ほげほげ: P.1-100', style: :bold
        text ' ふがふが: P.101-200', style: :bold
        text ' ぺけぺけ: P.201-300', style: :bold
      end
    end

    move_cursor_to page_height * 0.75

    theme_font :title_page do
      doctitle = doc.doctitle partition: true

      theme_font :title_page_title do
        ink_prose doctitle.main, align: :center, color: theme.base_font_color, line_height: 1, margin: 0
      end

      print doc.attr 'revnumber'

      theme_font :title_page_subtitle do
        move_down 10
        ink_prose (doc.attr 'revdate'), align: :center, margin: 0
        ink_prose (doc.attr 'revnumber'), align: :center, margin: 0
        move_down 10
      end

      # move_cursor_to page_height * 0.5

      # convert ::Asciidoctor::Block.new doc, :image,
      #   content_model: :empty,
      #   attributes: { 'target' => 'lena.jpg', 'pdfwidth' => '1.5in', 'align' => 'center' },
      #   pinned: true
    end

    bounding_box([100, 200], width: 300, height: 150) do
      transparent(1) { stroke_bounds }
      font_size 10
      text '注意', style: :bold, align: :center
      move_down 10
      indent(0) do
        text 'それは九月どうもどんな学習人というものの上が加えるたな。実にほかより干渉らはちゃんとその区別なありだけにしているですをも力説受けるですですば、一応には云っなべきたます。主意に知らなかろのは同時に朝をさきほどでないなけれ。'
      end
    end
  end
end