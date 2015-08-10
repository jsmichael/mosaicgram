CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIWSFCQMQCTD7FZOQ',       # required
    aws_secret_access_key: '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',  #required
    region:                'ap-northeast-1'                   # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'icesummer'                          # required
end