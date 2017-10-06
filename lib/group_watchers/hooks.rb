module GroupWatchers
  class Hooks  < Redmine::Hook::ViewListener

    # Add stylesheets and javascripts links to all pages
    # (there's no way to add them on specific existing page)
    render_on :view_layouts_base_html_head,
      :partial => "group_watchers/headers"

    # Render form on every page,
    # javascript allows the form to show on new issues
    render_on :view_layouts_base_body_bottom,
      :partial => "group_watchers/add_form"

  end # class
end # module
