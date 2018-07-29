ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    panel "創活部員一覧" do
      table_for Member.all do |member|
        column '名前', :name
        column 'LINE表示名', :line_name
        column '学籍番号', :student_number
        column 'できること', :skill
      end
    end

    panel "創作グループ一覧" do
      table_for Group.all do |group|
        column '名前', :name
        column '所属メンバー' do |group_member|
          group_member.members
#        column '所属メンバー', GroupMember.where(group_id: :id).all.pluck(:id).join('・')
        end
      end
    end

  end # content
end
