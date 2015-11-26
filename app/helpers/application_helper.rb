module ApplicationHelper

    # Returns the full title on a per-page basis.
    # If title is empty it returnsa default title for all pages.
    def full_title(page_title = '')
        base_title = "Providing a Fun Learning environment for Young Coders and Creators in Orlando, FL"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    class RouteRecognizer
    attr_reader :paths

    # To use this inside your app, call:
    # `RouteRecognizer.new.initial_path_segments`
    # This returns an array, e.g.: ['assets','blog','team','faq','users']

      #This regular expression will match url without special characters or parameters
      INITIAL_SEGMENT_REGEX = %r{^\/([^(:]+)}

    def initialize
      routes = Rails.application.routes.routes
      @paths = routes.collect {|r| r.path.spec.to_s }
    end

    def initial_path_segments
      @initial_path_segments ||= begin
        paths.collect {|path| match_initial_path_segment(path)}.compact.uniq
      end
    end

    def match_initial_path_segment(path)
      if match = INITIAL_SEGMENT_REGEX.match(path)
        match[1]
      end
    end
  end
end
