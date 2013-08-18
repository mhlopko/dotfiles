#! /usr/bin/env ruby

# Generate all tags for all gems included by bundler in gems.tags
#
# Basically does the same as "bundle show gemname", except for all gems.
# Interestingly enough, "bundle show" without any arguments falls back to
# "bundle list", otherwise the whole thing could have been a bash one-liner.

require 'bundler'

paths = Bundler.load.specs.map(&:full_gem_path)

system("ctags -R -f gems.tags #{paths.join(' ')}")
