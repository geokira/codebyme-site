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
end
