ActiveAdmin.register Group do

	permit_params :name, :description, group_members_attributes: [:id, :member_id, :group_id, :reference, :_destroy]

	index do
		selectable_column
		id_column

		column :name
		column :description
		column '所属メンバー' do |group|
			Member.where(id: GroupMember.where(group_id: group.id).pluck(:member_id)).pluck(:name).join('・')
			# TODO: メンバーの #show へ入るリンクを追加したい
		end

	    column :created_at
		column :updated_at
		actions
	end

	show do |group|
		attributes_table(*group.class.columns.collect {
			|column|
			column.name.to_sym
		})

		panel '所属メンバー' do
			Member.where(id: GroupMember.where(group_id: group.id).pluck(:member_id)).pluck(:name).join('・')
			# TODO: メンバーの #show へ入るリンクを追加したい
		end

		# コメント機能を無効にしているので使えない
		# active_admin_comments
	end

	form do |f|
		f.inputs do
			f.input :name
			f.input :description

			f.has_many :group_members, heading: '所属メンバー', allow_destroy: true, new_record: true do |group_member|
				group_member.input :member_id,
					label: '',
					as: :select,
					collection: Member.all.map {
						|member|
						[member.name, member.id]
					}
			end
		end

		actions
	end

end
