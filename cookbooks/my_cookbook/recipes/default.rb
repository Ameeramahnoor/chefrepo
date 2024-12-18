# my_cookbook/recipes/default.rb

# Install Node.js using Chocolatey (a Windows package manager)
chocolatey_package 'nodejs' do
  action :install
end