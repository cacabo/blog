module ApplicationHelper
    def title(page_title)
        content_for(:title) { page_title }
    end

    def description(page_description)
        content_for(:description) { page_description }
    end

    def keywords(page_keywords)
        content_for(:keywords) { page_keywords }
    end

    def image(page_image)
        content_for(:image) { page_image }
    end
end
