module Clot
  module LinkFilters
    include ActionView::Helpers::TagHelper

    def edit_link(target, message = "Edit", class_name = "")
      url = object_url target, class_name
      content_tag :a, message, :href => url + "/edit"
    end

    def view_link(target, message = "View", class_name = "")
      url = object_url target, class_name
      content_tag :a, message, :href => url
    end

    def delete_link(target, message = "Delete", class_name = "")
      url = object_url target
      gen_delete_link(url, message, class_name)
    end

    def gen_delete_link(url, message = nil, class_name="")
      '<a href="' + url + '" onClick="' + gen_delete_onclick + '" class="' + class_name + '">' + message + '</a>'
    end

    def gen_delete_onclick
      token_string = "var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '__CROSS_SITE_REQUEST_FORGERY_PROTECTION_TOKEN__') ;f.appendChild(s);"

      if @context['page']
        page_string = "var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'page_slug'); s.setAttribute('value', '" + @context['page'].slug + "') ;f.appendChild(s);"
      else
        page_string = ""
      end

      "if (confirm('Are you sure?')) { var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var m = document.createElement('input'); m.setAttribute('type', 'hidden'); m.setAttribute('name', '_method'); m.setAttribute('value', 'delete'); f.appendChild(m);" + token_string + page_string + "f.submit(); };return false;"
    end

    def index_link(controller, message = nil)
      if message.blank?
        controller_array = controller.split("_")
        controller_array.map! {|item| item.capitalize }
        message = controller_array.join(" ") + " Index"
      end
    '<a href="/' + controller +'">' + message + '</a>'
    end

    def new_link(controller, message = nil)
      if message.blank?
        controller_array = controller.split("_")
        controller_array.map! {|item| item.capitalize }
        message = "New "  + controller_array.join(" ")
        message.chomp!("s")
      end
    '<a href="/' + controller +'/new">' + message + '</a>'
    end

    def stylesheet_link(sheet_name)
      '<link href="'+ stylesheet_url(sheet_name) +'"  media="screen" rel="stylesheet" type="text/css" />'
    end

		def page_link_for(url, page, message)
			"<a href=\"" + url + "?page=" + page.to_s + "\">" + message + "</a>"
		end

  end
end
