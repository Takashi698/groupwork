#ドリンククラス（名前と価格）
class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    self.new('cola', 120)
  end

  def self.water
    self.new('water', 100)
  end

  def self.redbull
    self.new('redbull', 200)
  end
end

# 自販機クラス
class VendingMachine
  # ステップ0 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze 

  #ステップ2 初期状態で、コーラ（値段:120円、名前”コーラ”）を5本格納している。
  def initialize
    @slot_money = 0
    @sale_amount = 0
    @stocks = {cola: 5, water: 0, redbull: 0}
  end

  # ステップ0 投入金額の総計を取得できる。
  def current_slot_money
    puts "現在の投入金額の合計は#{@slot_money}円です。"
  end

  # ステップ1 想定外のもの（硬貨：１円玉、５円玉。お札：千円札以外のお札）
  # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
  def slot_money(money)
    if MONEY.include?(money)
      @slot_money += money
      puts "現在の投入金額の合計は#{@slot_money}円です。"
    else
      puts "#{money}円は使用できません。"
    end
  end

  # ステップ1 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    puts "#{@slot_money}円をお返しします。"
    @slot_money = 0
  end

  # ステップ2 格納されているジュースの情報（値段と名前と在庫）を取得できる。
  def stock_drink(drink)
    puts "#{drink.name}は#{drink.price}円です。#{@stocks[drink.name.to_sym]}本あります。"
  end

  # ステップ3 ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
  # ステップ3 投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。
  # ステップ5 ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、釣り銭（投入金額とジュース値段の差分）を出力する。
  def buy(drink)
    while @stocks[drink.name.to_sym] >= 1
      if @slot_money >= drink.price
        @slot_money -= drink.price
        @stocks[drink.name.to_sym] -= 1
        @sale_amount += drink.price
        puts "#{drink.name}を1本購入しました。"
        puts "残金は#{@slot_money}円です。"
      end
      break
    end
  end

  # ステップ3 現在の売上金を取得できる
  def sale_amount
    puts "現在の売上合計は#{@sale_amount}円です。"
  end

  # ステップ4 ジュースを3種類管理できるようにする。
  def store(drink)
    puts "#{drink.name}は#{@stocks[drink.name.to_sym] += 1}本の在庫があります。"
  end

  # ステップ３ 投入金額、在庫の点で、コーラが購入できるかどうかを取得できる  
  def purchasable(drink)
    if @slot_money >= drink.price && @stocks[drink.name.to_sym] > 0
      "#{drink.name}:#{@stocks[drink.name.to_sym]}"
    elsif @slot_money < drink.price && @stocks[drink.name.to_sym] > 0
      "#{drink.name}:お金が足りません"
    else
      "#{drink.name}:売り切れです"
    end
  end

  # ステップ4 投入金額、在庫の点で購入可能なドリンクのリストを取得できる。
  def purchasable_drink_list
    puts (purchasable(Drink.cola))
    puts (purchasable(Drink.water))
    puts (purchasable(Drink.redbull))
  end
end
