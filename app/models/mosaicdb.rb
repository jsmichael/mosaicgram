class Mosaicdb < ActiveRecord::Base
    
    has_many :images
    has_many :replies
    
end
