#名前の入力と、0,1でのゲーム継続を加えてみました

# （練習）名前を入力する
puts "こんにちは！お名前を入力してください: "
$name = gets.chomp # chompで改行を無くす,$nameでグローバル変数
puts "こんにちは、#{$name}さん!"

# ここからじゃんけん
def janken
    numbers = ["グー", "チョキ", "パー"]

    puts "じゃんけん..."
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

    # ユーザーの手を入力
    player_number = gets.to_i

    # 3 を選んだらゲームを終了
    if player_number == 3
        puts "---------------------"
        puts "じゃんけんをやめました"
        puts "---------------------"
    return
    end

    # 0〜2 以外の入力なら再挑戦
    unless player_number.between?(0, 2)
        puts "---------------------"
        puts "無効な入力です。0〜3を選んでください"
        puts "---------------------"
    return janken
    end

    # コンピュータの手をランダムに選ぶ
    computer_number = rand(3)

    puts "あなた: #{numbers[player_number]}を出しました。"
    puts "相手: #{numbers[computer_number]}を出しました。"

    # 勝敗判定
    if player_number == computer_number
        puts "---------------------"
        puts "引き分け！もう一回"
        puts "---------------------"
        return janken  # 再試合
    elsif (player_number == 0 && computer_number == 1) ||
        (player_number == 1 && computer_number == 2) ||
        (player_number == 2 && computer_number == 0)
        puts "---------------------"
        puts "#{$name}の勝ちです！おめでとう"
        puts "---------------------"
        return acchimuite_hoi
    else
        puts "---------------------"
        puts "#{$name}の負けです...残念"
        puts "もう一度やる？"
        puts "0(やる) 1(やめる)"
        puts "---------------------"

        player_number = gets.to_i
        if player_number == 0
            return janken
        else player_number == 1
            puts "---------------------"
            puts "お疲れ様でした"
            puts "---------------------"
        return
        end
    end
end

# ここからあっち向いてホイ
def acchimuite_hoi
    choices = ["上", "下", "左", "右"]

    puts "あっち向いてホイ！"
    puts "0(上) 1(下) 2(左) 3(右)"

    # ユーザーの手を入力
    player_choice = gets.to_i
    # コンピュータの手をランダムに選ぶ
    computer_choice = rand(4)

    # 0~3以外だったら再挑戦
    unless player_choice.between?(0, 3)
        puts "---------------------"
        puts "無効な入力です。0〜3を選んでください"
        puts "---------------------"
        return acchimuite_hoi
    end

    puts "あなた: #{choices[player_choice]}"
    puts "相手: #{choices[computer_choice]}"

    # 勝敗判定
    if player_choice == computer_choice
        puts "---------------------"
        puts "#{$name}の勝ち！おめでとう！"
        puts "---------------------"
        puts "もう一度やる？"
        puts "0(やる) 1(やめる)"
        puts "---------------------"
        player_number = gets.to_i
            if player_number == 0
                return janken
            else player_number == 1
                puts "---------------------"
                puts "お疲れ様でした"
                puts "---------------------"
                return
            end
    else
        puts "---------------------"
        puts "続行！またじゃんけんから"
        puts "---------------------"
        return janken  # じゃんけんに戻る
    end
end
# ゲーム開始
janken
