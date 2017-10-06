module GroupWatchersHelper
  def groups_users_check_box_tags(groups)
    s = ''
    groups.each do |group|
      if group.users.any?
        s << "<div><label class='groups_label'><input type='checkbox'> #{h group}</label>"
        s << '<div style="display: none">'
        s << principals_check_box_tags('watcher[user_ids][]', group.users)
        s << '</div></div>'
      end
    end
    s.html_safe
  end
end
