class Area < ActiveRecord::Base
     belongs_to :user
     has_many :placeholders
     has_many :resumes, through: :placeholders
     has_many :area_attributes, :dependent => :destroy
     accepts_nested_attributes_for :area_attributes, :reject_if => proc { |a| a[:name].blank? }

end
