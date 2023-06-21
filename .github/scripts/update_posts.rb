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
  link = "https://juejin.cn#{post[:href]}"
  posts_list << "* [#{title}](#{link})"
end
puts posts_list


# Update the README.md file
client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
repo = ENV['GITHUB_REPOSITORY']
readme = client.readme(repo)
readme_content = Base64.decode64(readme[:content]).force_encoding('UTF-8')

# Replace the existing blog posts section
posts_regex = /### Recent Blog Posts\n\n[\s\S]*?(?=<\/td>)/m
updated_content = readme_content.sub(posts_regex, "#{posts_list.join("\n")}\n")
puts updated_content

client.update_contents(repo, 'README.md', 'Update recent blog posts', readme[:sha], updated_content)