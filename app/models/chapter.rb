class Chapter < ActiveRecord::Base
  has_many :headings
  has_many :codes
  has_many :quotations
  has_many :urls
end
