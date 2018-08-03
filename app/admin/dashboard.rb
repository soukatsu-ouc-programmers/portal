ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "創活部員一覧" do
      table_for members do
        column '名前', :name
        column 'LINE表示名', :line_name
        column '学籍番号', :student_number
        column 'できること', :skill
        column ('所属グループ') { |member|
          Group.where(id: GroupMember.where(member_id: member.id).pluck(:group_id)).pluck(:name).join('・')
        }
      end
    end

    panel "創作グループ一覧" do
      table_for groups do
        column '名前', :name
        column ('所属メンバー') { |group|
          Member.where(id: GroupMember.where(group_id: group.id).pluck(:member_id)).pluck(:name).join('・')
        }
        column '説明', :description
      end
    end

  end # content


  controller do

    def index
      @members = Member.all
      @groups = Group.all
      @group_members = GroupMember.all
    end

  end

end
