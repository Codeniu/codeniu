require 'httparty'
require 'nokogiri'
require 'octokit'

# Scrape blog posts from the website
url = "https://juejin.cn/user/1732486058223176/posts"
response = HTTParty.get(url)
# puts response.body
parsed_page = Nokogiri::HTML(response.body)
posts = parsed_page.css('.content-main .title')
# puts posts

# Generate the updated blog posts list (top 5)
posts_list = ["\n### Recent Blog Posts\n\n"]
posts.first(5).each do |post|
  title = post.text
  link = "https://juejin.cn/post/#{post[:href]}"
  posts_list << "* [#{title}](#{link})"
end
puts posts_list