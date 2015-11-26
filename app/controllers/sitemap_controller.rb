class SitemapController < ApplicationController
  @@domain = "www.codebyme.com"

  def sitemap
    render inline: static_sitemap.render
  end

  #This method will render a static sitemap while the dynamic method is working.
  def static_sitemap
    map = XmlSitemap::Map.new(@@domain) do |m|
      # Available :period -> :none :always :hourly :daily :weekly :monthly :yearly :never
      m.add welcome_schools_path, :priority => 0.8, :updated => Date.today, :period => :weekly
      m.add welcome_teachers_path, :priority => 0.6, :updated => Date.today - 1.day
      m.add welcome_faq_path, :priority => 0.3
    end
    return map
  end

  #This method will create a sitemap with all the valid routes in this application
  #TODO: Figure out how to filter out the routes that we don't want google to crawl.
  def dynamic_sitemap
    map = XmlSitemap::Map.new(@@domain) do |m|
      paths = ApplicationHelper::RouteRecognizer.new.initial_path_segments
      paths.each { |path| m.add path}
    end
  end

end