class Raffle < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  SECONDS_DIFF = 10

  after_create do
    if self.win && self.user
      self.user.update_column :wins_count, (user.wins_count+1)*2
    end
  end

end
