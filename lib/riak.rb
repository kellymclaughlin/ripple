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
$KCODE = "UTF8" if RUBY_VERSION < "1.9"

#require 'active_support/all'
require 'active_support/core_ext/module/aliasing'
require 'active_support/json'
require 'base64'
require 'uri'
require 'net/http'
require 'yaml'

# The Riak module contains all aspects of the HTTP client interface
# to Riak.
module Riak
  # Domain objects
  autoload :Bucket,          "riak/bucket"
  autoload :Client,          "riak/client"
  autoload :Link,            "riak/link"
  autoload :WalkSpec,        "riak/walk_spec"
  autoload :RObject,         "riak/robject"
  autoload :MapReduce,       "riak/map_reduce"

  # Exceptions
  autoload :FailedRequest,   "riak/failed_request"
  autoload :InvalidResponse, "riak/invalid_response"
  autoload :MapReduceError,  "riak/map_reduce_error"
  
  module Util
    autoload :Headers,       "riak/util/headers"
    autoload :Multipart,     "riak/util/multipart"
    autoload :Translation,   "riak/util/translation"
    autoload :ActiveSupportHelper,   "riak/util/activesupporthelper"
  end
end
