# frozen_string_literal: true

class AddEndorsementsCounterCacheToNbs < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_nbs_iframes, :endorsements_count, :integer, null: false, default: 0
  end
end
