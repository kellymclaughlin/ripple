# Copyright 2010 Sean Cribbs, Sonian Inc., and Basho Technologies, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
require 'riak'
require 'active_support'

module Riak
  module Util
    module ActiveSupportHelper 
      def slice!(input_hash, keys)
        keys = keys.map! { |key| convert_key(key) } if respond_to?(:convert_key)
        remaining_keys = input_hash.keys - keys
        omit = Hash.new
        remaining_keys.each do |key|
          omit = omit.merge(input_hash.slice(key))
        end
        hash = input_hash.slice(*keys)
        input_hash.replace(hash)
        omit
      end
    end
  end
end

