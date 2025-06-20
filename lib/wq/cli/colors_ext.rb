module CommandKit
  module Colors
    module ANSI
      # ANSI code for italics text
      ITALICS = "\e[3m"

      # ANSI code to disable italics
      RESET_ITALICS = "\e[23m"

      module_function

      #
      # Italicizes the text.
      #
      # @param [String, nil] string
      #   An optional string.
      #
      # @return [String, ITALICS]
      #   The italicized string or just {ITALICS} if no arguments were given.
      #
      # @see ITALICS
      #
      # @api public
      #
      def italics(string=nil)
        if string then "#{ITALICS}#{string}#{RESET_ITALICS}"
        else           ITALICS
        end
      end
    end

    module PlainText
      module_function

      def italics(string=nil)
        string || ""
      end
    end
  end
end
