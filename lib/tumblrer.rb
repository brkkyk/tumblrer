require 'open-uri'
require 'nokogiri'
require 'mechanize'

class Tumblrer
  def initialize(url = nil, number_of_images = nil, start_index = nil)
    @url = url
    @number_of_images = number_of_images || 10
    @start_index = start_index || 0 
    @successfulls = 0
    @fails = 0
    @already_exists = 0
    @mechanize = Mechanize.new
  end

  def download
    unless @url.nil?
      puts "download from: #{@url}"
      puts "going to download #{@number_of_images} of image(s) and starting from (#{@start_index}) index of image"
      puts "---------- downloading ----------"
      url = "#{@url}/api/read?type=photo&num=#{@number_of_images}&start=#{@start_index}"
      xml = Nokogiri::XML.parse(open(url))
      images = (xml/'post photo-url').select{|post| post.content if post['max-width'].to_i == 1280}.map{|image| image.content}
      pwd = FileUtils.pwd
      images.each do |image|
        unless File.exists?("#{pwd}/#{image.to_s.split("/").last}")
          begin
            @mechanize.get(image).save
            puts "file saved to current directory :) - #{image}"
            @successfulls += 1
          rescue
            puts "failed to save file to current directory :( - #{image}"
            @fails += 1
          end
        else
          puts "file already exists :( - #{image}"
          @already_exists += 1
        end
      end
      statistics
    else
      puts "you should give some tumblr url :( \n  usage: tumblrer http://hebe.tumblr.com"
    end
  end

  def statistics
    puts "---------- statistics ----------"
    puts "total number of downloaded images: #{@successfulls}"
    puts "total number of failed images: #{@fails}"
    puts "total number of already exist images: #{@already_exists}"
  end
end
