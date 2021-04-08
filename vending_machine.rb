# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。
# 例
# irb
# require '/Users/okatakashi/workspace/groupwork/vending_machine.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

  # ...ステップ０　お金の投入と払い戻しの例コード
# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (100)
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class VendingMachine
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # ...ステップ1...
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    #..... include？メソッド = 引数で指定した要素が配列や文字列内に入っているか判定するメソッド
    #..... 「unless」文は条件式が偽の場合の処理を記述するのに使われる
    if MONEY.include?(money)
      # 投入金額の総計を取得できる
      @slot_money += money
      puts "投入金額の合計は#{@slot_money}円です。"
    else
      # 自動販売機にお金を入れる
      puts "#{money}円は使用できません。"
    # else 
    #   nil != (money =~ /\A[a-z]+\z/)
    #   puts "お金を入れてください。"
    end
    #..... より簡易的な書き方（https://blog.jnito.com/entry/2013/05/22/073525）
    # MONEY.include?(money) ? 
    # nil.tap { @slot_money += money } : money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end
end
