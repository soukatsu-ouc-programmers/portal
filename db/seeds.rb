# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 曜日
DayOfWeek.create(name: "月", order: 1)
DayOfWeek.create(name: "火", order: 2)
DayOfWeek.create(name: "水", order: 3)
DayOfWeek.create(name: "木", order: 4)
DayOfWeek.create(name: "金", order: 5)
DayOfWeek.create(name: "土", order: 6)
DayOfWeek.create(name: "日", order: 7)

# 時間割のコマ
BlockTime.create(name: '１講(08:50-10:20)', order: 1)
BlockTime.create(name: '２講(10:30-12:00)', order: 2)
BlockTime.create(name: '昼休み(12:00-12:50)', order: 3)
BlockTime.create(name: '３講(12:50-14:20)', order: 4)
BlockTime.create(name: '４講(14:30-16:00)', order: 5)
BlockTime.create(name: '５講(16:10-17:40)', order: 6)
BlockTime.create(name: '６講(17:45-19:15)', order: 7)
BlockTime.create(name: '７講(19:25-20:55)', order: 8)
