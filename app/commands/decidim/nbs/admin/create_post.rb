# frozen_string_literal: true

module Decidim
  module Nbs
    module Admin
      # This command is executed when the user creates a Post from the admin
      # panel.
      class CreatePost < Decidim::Commands::CreateResource
        fetch_form_attributes :title, :body, :published_at, :author, :component,
                      :iframe_src, :iframe_width, :iframe_height


        private

        def resource_class = Decidim::Nbs::Post

        def extra_params = { visibility: "all" }

        def run_after_hooks
          Decidim::EventsManager.publish(
            event: "decidim.events.nbs.post_created",
            event_class: Decidim::Nbs::CreatePostEvent,
            resource:,
            followers: resource.participatory_space.followers
          )
        end

        def build_resource
          super.tap do |post|
            post.iframe_src = form.iframe_src
            post.iframe_width = form.iframe_width
            post.iframe_height = form.iframe_height
          end
        end
        
      end
    end
  end
end
