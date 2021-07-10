gem environment
gem update --system

gem sources --remove https://rubygems.org/
gem sources -l

gem install --local /Applications/RubyMine.app/Contents/plugins/ruby/rb/gems/debase-0.3.0.beta34.gem -- --with-cflags="-Wno-error=implicit-function-declaration"

gem list | grep debase
sudo gem install debase --version '>= 0.2.5.beta2'

bundle install