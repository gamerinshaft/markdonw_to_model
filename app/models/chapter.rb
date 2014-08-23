class Chapter < ActiveRecord::Base
  has_many :hedings
  has_many :codes
  has_many :quotations
  has_many :urls
end
