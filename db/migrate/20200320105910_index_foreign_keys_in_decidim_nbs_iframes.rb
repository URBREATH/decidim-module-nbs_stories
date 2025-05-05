# frozen_string_literal: true

class IndexForeignKeysInDecidimNbsIframes < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_nbs_iframes, :decidim_user_group_id
  end
end
