#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'haml'

require 'pcduino'

get '/' do
  haml :index
end

get '/control' do
  haml :control
end

post '/control' do
  @host = params[:host]
  @my_pin = Pin.new 13
  @results = @my_pin.write(@host.to_i)
  

  haml :control
end


__END__
@@ layout
%html
  %head
    %title Network Tools
  %body
    #header
      %h1 Network Tools
    #content
      =yield
  %footer
    %a(href='/') Back to index

@@ index
%p
  Welcome to Wills mini home automation server!
%ul
  %li
    %h3
      %a(href='/control') Control Stuff!

@@ control
%h3 Whois
%form(action='/control' method='POST')
  %input(type='text' name='host' value=@output)
  %input(type='submit')
- if defined?(@results)
  %pre= @results

