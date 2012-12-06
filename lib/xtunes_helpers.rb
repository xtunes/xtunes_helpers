require 'test_engine'
module XtunesHelpers
  def self.setup
    yield self
    require_all!
  end

  mattr_accessor :authority_keys
  @@authority_keys = [:username]

  mattr_accessor :orm
  @@orm = :active_record

  protected
  def self.require_all!
    require 'xtunes/authentication/controllers/helpers'
    require 'xtunes/authentication/model'
    require 'xtunes/authentication/models/active_record' if orm == :active_record
    require 'xtunes/authentication/models/mongoid' if orm == :mongoid
  end
end
