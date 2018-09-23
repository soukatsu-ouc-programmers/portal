ActiveAdmin.register Group do

	# 編集権限を与える
	permit_params :name, :description,
		group_members_attributes: [:id, :member_id, :group_id, :_destroy]


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

		this_members = Member.where(id: GroupMember.where(group_id: group.id).pluck(:member_id))
		panel '所属メンバー' do
			this_members.pluck(:name).join('・')
			# TODO: メンバーの #show へ入るリンクを追加したい
		end

		if this_members.count > 0 then
			# 時間割テーブル: テンプレートを使って表示
			panel '空きコマ' do
				render partial: "group_schedule", locals: {
					this_group: group,
					this_members: this_members
				}
			end
		end

		# コメント機能を無効にしているので使えない
		# active_admin_comments
	end

	form do |f|
		f.inputs do
			f.input :name
			f.input :description

			f.has_many :group_members, heading: '所属メンバー', allow_destroy: true, new_record: true do |gm|
				gm.input :member_id,
					label: 'メンバー名',
					as: :select,
					collection: Member.all
			end
		end

		f.actions
	end

end
