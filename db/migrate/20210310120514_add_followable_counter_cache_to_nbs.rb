# frozen_string_literal: true

class AddFollowableCounterCacheToNbs < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_nbs_iframes, :follows_count, :integer, null: false, default: 0, index: true

    reversible do |dir|
      dir.up do
        Decidim::Nbs::Post.reset_column_information
        Decidim::Nbs::Post.find_each do |record|
          record.class.reset_counters(record.id, :follows)
        end
      end
    end
  end
end
