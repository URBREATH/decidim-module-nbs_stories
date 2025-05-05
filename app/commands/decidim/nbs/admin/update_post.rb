# frozen_string_literal: true

module Decidim
  module Nbs
    module Admin
      # This command is executed when the user changes a Post from the admin
      # panel.
      class UpdatePost < Decidim::Commands::UpdateResource
        fetch_form_attributes :title, :body, :author, :iframe_src, :iframe_width, :iframe_height

        private

        def attributes
          super.merge(
            published_at: form.published_at,
            iframe_src: form.iframe_src,
            iframe_width: form.iframe_width,
            iframe_height: form.iframe_height
          ).reject do |attribute, value|
            value.blank? && attribute == :published_at
          end
        end
      end
    end
  end
end
