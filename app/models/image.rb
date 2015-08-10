class Image < ActiveRecord::Base

    belongs_to :mosaicdb

    mount_uploader :image, S3uploaderUploader
    
end