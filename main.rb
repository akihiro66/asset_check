puts <<~EOS
-----------------------------------------------------------------
ゆとりある老後を送るには『3,500万円』必要とも言われています。
さらに長寿命化、退職金の減少、年金支給額の減少が予測される今、
年金に頼らず、ゆとりある老後を送る為に必要な資産を蓄えるのに、
必要な貯蓄額が毎月どのくらいなのか簡単に確認してみましょう。
-----------------------------------------------------------------

EOS

#ゆとりある老後に必要なお金を3,500万円に設定
NECESSARY_MONEY = 35000000
#定年を60歳に設定
RETIREMENT_AGE = 60

puts <<~EOS
  はじめに、現在の貯蓄額を入力して下さい。
  
  (例)300万円の場合→3000000と入力

EOS

#貯蓄額の入力によって出力を変更する処理
def savings_money_input
  while true
    print "貯蓄額  > "
    $savings_money = gets.to_i

    if $savings_money > NECESSARY_MONEY
      puts "十分な貯蓄がある為、ゆとりある老後を送れるでしょう"
      exit
    elsif $savings_money > 0 && $savings_money < NECESSARY_MONEY
      puts <<~EOS

      現在の貯蓄額は "#{$savings_money}円" ですね。
      
      次に退職金の予定額を入力して下さい。
      (例)1000万円の場合→10000000と入力

      EOS
      break
    else
      puts <<~EOS

      入力が正しくありません。
      再度入力して下さい。

      EOS
    end
  end
end

puts savings_money_input

#退職金の入力によって出力を変更する処理
def retirement_money_input
  while true
    print "退職金 > "
    retirement_money = gets.to_i

    $self_necessary_money = NECESSARY_MONEY - $savings_money - retirement_money

    if $self_necessary_money <= 0
      puts "十分な貯蓄と退職金がある為、ゆとりある老後を送れるでしょう"
      exit
    elsif $self_necessary_money > 0 
      puts <<~EOS

      退職金の予定額は "#{retirement_money}円" ですね。

      ゆとりある老後を送る為にはあと【#{$self_necessary_money}円】必要です。

      次に現在の年齢を入力して下さい。
      (例)30歳の場合→30と入力

      EOS
      break
    end
  end
end

puts retirement_money_input


#年齢の入力により1年間及び1ヶ月の必要額を計算し表示を変える
def age_input
  while true
    print "年齢 > "
    age = gets.to_i

    #退職までの期間
    period_until_retirement = RETIREMENT_AGE - age
    #年間の必要額
    annual_amount = $self_necessary_money / period_until_retirement
    #１ヶ月の必要額
    monthly = annual_amount / 12

    if period_until_retirement < RETIREMENT_AGE && period_until_retirement > 0
      puts <<~EOS

      現在#{age}歳のあなたがゆとりある老後を送る為には

      60歳まで年間【#{annual_amount}円】、
      １ヶ月あたり【#{monthly}円】の貯蓄が必要になります。

      EOS
      
      if monthly <= 100000
        puts "毎月の貯蓄を行えば、ゆとりある老後が送れるでしょう。"
        break
      elsif monthly > 100000 && monthly <= 200000
        puts <<~EOS
        毎月必要な貯蓄額が少し多いようです。節約等を行い、
        工夫して貯蓄を行えば、ゆとりある老後が送れるでしょう。
        EOS
        break
      else
        puts <<~EOS
        毎月必要な貯蓄額が多いようです。
        ライフプランを見直してみましょう。
        EOS
        break
      end

    else
      puts <<~EOS

      入力が正しくありません。
      再度入力して下さい。

      EOS
    end
  end
end

puts age_input
