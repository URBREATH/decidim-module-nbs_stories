# frozen_string_literal: true

module Decidim
  module Nbs
    # This cell renders the card for an instance of a Post
    # the default size is the List Card (:l)
    class PostCell < Decidim::ViewModel
      def show
        cell card_size, model, options
      end

      private

      def card_size
        case @options[:size]
        when :s
          "decidim/nbs/post_s"
        when :g
          "decidim/nbs/post_g"
        else
          "decidim/nbs/post_l"
        end
      end
    end
  end
end
