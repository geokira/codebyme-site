namespace :sitemap do
    desc "Create basic sitemap based on the routes in the config/routes.rb file"
    task :create do
        map = XmlSitemap::Map.new('www.codebyme.com') do |m|      
            add_page(m, 'welcome/schools')
            add_page(m, 'welcome/teachers')
            add_page(m, 'welcome/faq')
        end
        render(map, 'public/sitemap.xml')
    end
    
    private
    
  # Renders sitempa.xml and sitemap.xml.gzip to the public directory. 
  # 
  # map - XmlSitemap::Map object (required)
  # file_to_render - filename of the sitemap that will be created. (default: public/sitemap.xml)
  def render(map, file_to_render='public/sitemap.xml')
       map.render_to(file_to_render, :gzip => true)
       show_render(file_to_render)
       map.render_to(file_to_render)
  end
    
    def add_page(obj, path_string='')
        obj.add path_string
        show_step path_string
    end
    
    def show_step(path_string='')
        puts path_string + ' was added to the sitemap'
    end
    
    def show_render(str='')
        puts 'sitemap: ' + str + ' was created'
    end
end
