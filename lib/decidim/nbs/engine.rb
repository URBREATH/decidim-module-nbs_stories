# frozen_string_literal: true

require "rails"
require "active_support/all"

require "decidim/core"

module Decidim
  module Nbs
    # This is the engine that runs on the public interface of `decidim-nbs`.
    # It mostly handles rendering the created nbs associated to a participatory
    # process.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Nbs

      routes do
        resources :posts, only: [:index, :show]
        scope "/posts" do
          root to: "posts#index"
        end
        get "/", to: redirect("posts", status: 301)
      end

      initializer "decidim_nbs.register_icons" do
        Decidim.icons.register(name: "Decidim::Nbs::Post", icon: "pen-nib-line", description: "nbs post", category: "activity", engine: :core)
      end

      initializer "decidim_nbs.add_cells_view_paths" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::Nbs::Engine.root}/app/cells")
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::Nbs::Engine.root}/app/views") # for partials
      end

      initializer "decidim_nbs.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end

      initializer "decidim_nbs.authorization_transfer" do
        config.to_prepare do
          Decidim::AuthorizationTransfer.register(:nbs) do |transfer|
            transfer.move_records(Decidim::Nbs::Post, :decidim_author_id)
          end
        end
      end
    end
  end
end
