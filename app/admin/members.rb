ActiveAdmin.register Member do

	# 編集権限を与える
	permit_params :name, :kana, :line_name, :student_number, :skill, :description,
		group_members_attributes: [:member_id, :group_id, :_destroy],
		member_idles_attributes: [:member_id, :day_of_week_id, :block_time_id, :_destroy]


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
		column '空きコマ数' do |member|
			MemberIdle.where(member_id: member.id).count
		end

	    column :created_at
		column :updated_at
		actions
	end

	show do
		attributes_table(*member.class.columns.collect {
			|column|
			column.name.to_sym
		})

		panel '所属グループ' do
			Group.where(id: GroupMember.where(member_id: member.id).pluck(:group_id)).pluck(:name).join('・')
			# TODO: グループの #show へ入るリンクを追加したい
		end

		# 時間割テーブル: テンプレートを使って表示
		panel '空きコマ' do
			render partial: "member_schedule", locals: {
				this_member: member
			}
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

			# 所属グループのサブ編集欄
			f.has_many :group_members, heading: '所属グループ', allow_destroy: true, new_record: true do |group_member|
				group_member.input :group_id,
					label: 'グループ名',
					as: :select,
					collection: Group.all.map {
						|group|
						[group.name, group.id]
					}
			end

			# 空きコマのサブ編集欄
			f.has_many :member_idles, heading: '空き講', allow_destroy: true, new_record: true do |member_idle|
				member_idle.input :day_of_week_id,
					label: '曜日',
					as: :select,
					collection: DayOfWeek.all
				member_idle.input :block_time_id,
					label: '時間帯',
					as: :select,
					collection: BlockTime.order(:order).all
			end
		end

		f.actions
	end


end
