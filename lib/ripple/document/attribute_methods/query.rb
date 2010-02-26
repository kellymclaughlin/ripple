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
require 'ripple'

module Ripple
  module Document
    module AttributeMethods
      module Query
        extend ActiveSupport::Concern

        included do
          attribute_method_suffix "?"
        end

        private
        # Based on code from ActiveRecord
        def attribute?(attr_name)
          unless value = attribute(attr_name)
            false
          else
            prop = self.class.properties[attr_name]
            if prop.nil?
              if Numeric === value || value !~ /[^0-9]/
                !value.to_i.zero?
              else
                #Boolean.ripple_cast(value) || value.present?
                Boolean.ripple_cast(value) || !value.blank?
              end
            elsif prop.type <= Numeric
              !value.zero?
            else
              #value.present?
              !value.blank?
            end
          end
        end
      end
    end
  end
end
