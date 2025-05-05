# frozen_string_literal: true

Decidim.register_component(:nbs) do |component|
  component.engine = Decidim::Nbs::Engine
  component.admin_engine = Decidim::Nbs::AdminEngine
  component.icon = "media/images/decidim_nbs.svg"
  component.icon_key = "pen-nib-line"
  component.permissions_class_name = "Decidim::Nbs::Permissions"

  component.query_type = "Decidim::Nbs::NbsType"

  component.on(:before_destroy) do |instance|
    raise StandardError, "Cannot remove this component" if Decidim::Nbs::Post.where(component: instance).any?
  end

  component.register_stat :posts_count, primary: true, priority: Decidim::StatsRegistry::MEDIUM_PRIORITY do |components, _start_at, _end_at|
    Decidim::Nbs::Post.where(component: components).count
  end

  component.actions = %w(create update destroy)

  component.settings(:global) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
    settings.attribute :comments_enabled, type: :boolean, default: true
    settings.attribute :comments_max_length, type: :integer, required: true
  end

  component.settings(:step) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
    settings.attribute :comments_blocked, type: :boolean, default: false
    settings.attribute :endorsements_enabled, type: :boolean, default: true
    settings.attribute :endorsements_blocked, type: :boolean
  end

  component.register_resource(:blogpost) do |resource|
    resource.model_class_name = "Decidim::Nbs::Post"
    resource.card = "decidim/nbs/post"
    resource.actions = %w(endorse comment)
    resource.searchable = true
  end

  component.seeds do |participatory_space|
    require "decidim/nbs/seeds"

    Decidim::Nbs::Seeds.new(participatory_space:).call
  end
end
