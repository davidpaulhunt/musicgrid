class Swipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :album
  belongs_to :preference
end
