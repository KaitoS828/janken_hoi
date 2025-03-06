# CSVライブラリを読み込む
# これを書かないとCSV.openやCSV.readが使えない
require "csv"


# （練習）名前を入力する
puts "お名前を入力してください: "
name = gets.chomp # chompで改行を無くす
puts "こんにちは、#{name}さん!"


# ユーザーに入力させる、新規作成 or 既存メモ編集
puts "数字を入力して下さい:1(新規でメモを作成)2(既存のメモを編集する)" 

memo_type = gets.to_s.chomp  # ユーザーの入力をmemo_type変数へ
puts memo_type + "が選択されました。"
input_number = memo_type  # 末尾改行を削除して処理しやすくする

# ① 入力数字が１の場合：新規メモ作成の処理
if input_number == "1"
  puts "新規でメモを作成します!拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp  # ファイル名を入力してもらう,file_nameに保存

  puts "メモの内容を記入してください。Ctrl+Dで保存します。" #ctrl+Dで入力の終了
  input_memo = STDIN.read.chomp  # STDIN.read=複数行の入力を受け取る,input_memoに保存


  # CSVファイルを新規作成（書き込みモード "w"）
  CSV.open("#{file_name}.csv", "w") do |csv|
  # CSV.open("#{file_name}.csv", "w")（書き込み）でファイルの上書き・新規作成
  # do~endの間を処理の塊とする、|csv|から処理開始、csvファイルを扱うための引数
    csv.puts [input_memo]  # 入力したメモをCSVの1行目に書き込む

  end
  puts "#{file_name}.csv に保存しました！終了します。"

# ② 既存メモ編集の処理
elsif input_number == "2"
  puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
  file_name = gets.chomp  # 既存ファイル名を入力してもらう

  # 指定されたCSVファイルが存在するか確認
  if File.exist?("#{file_name}.csv") # 指定したファイルが存在するかどうかをチェック

    puts "追加するメモの内容を記入してください。Ctrl+Dで保存します。"
    input_memo = STDIN.read.chomp  # 追記するメモを入力（複数行OK）

    # 既存のCSVファイルに追記モード "a" で開く
    # a=追記モード、本の内容を残しつつデータを追加
  CSV.open("#{file_name}.csv", "a") do |csv|
    csv.puts [input_memo]  # メモの内容を追記
    
  end
  puts "#{file_name}.csv に追記しました！終了します。"
  
  else
    # 指定されたファイルが存在しなかった場合のエラーメッセージ
    puts "ファイルが見つかりません！"
  end

# ③ 無効な入力への対応
else
  puts "1か2の数字を入力してください"
end
