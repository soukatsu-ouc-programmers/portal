ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "創活部員一覧" do
      table_for members do
        column '名前', :name, sortable: :name
        column 'LINE表示名', :line_name, sortable: :line_name
        column '学籍番号', :student_number, sortable: :student_number
        column 'できること', :skill, sortable: :skill
        column '所属グループ' do |member|
          Group.where(id: GroupMember.where(member_id: member.id).pluck(:group_id)).pluck(:name).join('・')
        end
        column '空きコマ数' do |member|
          MemberIdle.where(member_id: member.id).count
        end
      end
    end

    panel "創作グループ一覧" do
      table_for groups do
        column '名前', :name, sortable: :name
        column '所属メンバー' do |group|
          Member.where(id: GroupMember.where(group_id: group.id).pluck(:member_id)).pluck(:name).join('・')
        end
        column '説明', :description
      end
    end

  end # content


  controller do

    def index
      @members = Member.all.order(:student_number)
      @groups = Group.all.order(:created_at)
      @group_members = GroupMember.all
    end

  end

end
