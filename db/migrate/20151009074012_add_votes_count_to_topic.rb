class AddVotesCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :votes_count, :integer, default: 0

    Topic.pluck(:id).each do |i|
      Topic.reset_counters(i, :votes)
    end
  end

end
