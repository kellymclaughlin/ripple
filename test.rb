require 'rubygems'
require 'active_support'

def a(*params)
    options = params.extract_options!
    walk_spec_options = myslice!(options,[:type, :function, :language, :arg])
    puts "OPTIONS: #{options}"
    puts "WSO: #{walk_spec_options}"
    puts "PARAMS: #{params}"
end

def myslice!(original_hash, keys)
    keys = keys.map! { |key| convert_key(key) } if respond_to?(:convert_key)
    puts "keys: #{keys}"
    puts "orig keys: #{original_hash.keys}"
    puts original_hash.keys - keys
    omit = original_hash.slice(original_hash.keys - keys)
    puts omit
    hash = original_hash.slice(*keys)
    original_hash.replace(hash)
    omit
end

a(:tag => "snakes", :arg => [1000])
