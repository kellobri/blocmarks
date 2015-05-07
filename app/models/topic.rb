class Topic < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, uniqueness: true

  def should_generate_new_friendly_id?
  	new_record?
  end
  
end
