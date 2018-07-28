ActiveAdmin.register Member do

	permit_params :name, :kana, :line_name, :student_number, :skill, :description, group_members_attributes: [:id, :member_id, :group_id, :reference, :_destroy]

	index do
		selectable_column
		id_column

		column :name
		column :kana
		column :line_name
		column :student_number
		column :skill
		column :description
		column '所属グループ' do |member|
			Group.where(id: GroupMember.where(member_id: member.id).pluck(:group_id)).pluck(:name).join('・')
			# TODO: グループの #show へ入るリンクを追加したい
		end

	    column :created_at
		column :updated_at
		actions
	end

	show do |group|
		attributes_table(*member.class.columns.collect {
			|column|
			column.name.to_sym
		})

		panel '所属グループ' do
			Group.where(id: GroupMember.where(member_id: member.id).pluck(:group_id)).pluck(:name).join('・')
			# TODO: グループの #show へ入るリンクを追加したい
		end

		# コメント機能を無効にしているので使えない
		# active_admin_comments
	end

	form do |f|
		f.inputs do
			f.input :name
			f.input :kana
			f.input :line_name
			f.input :student_number
			f.input :skill
			f.input :description

			f.has_many :group_members, heading: '所属グループ', allow_destroy: true, new_record: true do |group_member|
				group_member.input :member_id,
					label: '',
					as: :select,
					collection: Group.all.map {
						|group|
						[group.name, group.id]
					}
			end
		end

		actions
	end

end
