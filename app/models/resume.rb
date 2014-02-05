class Resume < ActiveRecord::Base
     belongs_to :user
     has_many :placeholders, :dependent => :destroy
     has_many :areas, through: :placeholders
end
