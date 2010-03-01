require 'rubygems'
require 'active_support'

def a(*params)
    options = params.extract_options!
    walk_spec_options = myslice!(options,[:type, :function, :language, :arg])
    walk_spec_options = options.slice!(:type, :function, :language, :arg)
    puts "OPTIONS: #{options}"
    puts "WSO: #{walk_spec_options}"
    puts "PARAMS: #{params}"
end

def myslice!(original_hash, keys)
    keys = keys.map! { |key| convert_key(key) } if respond_to?(:convert_key)
    remaining_keys = original_hash.keys - keys
    omit = Hash.new
    remaining_keys.each do |key|
        omit = omit.merge(original_hash.slice(key))
    end
    hash = original_hash.slice(*keys)
    original_hash.replace(hash)
    omit
end

a(:tag => "snakes", :arg => [1000])
