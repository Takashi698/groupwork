# VendingMachineグループワーク課題

#### 自販機スタート
ファイルのパスをrepuireする
```
$ require './vending_machine.rb'
```
初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
```
$ vm = VendingMachine.new
```

#### 購入者側操作
自動販売機にお金を入れる（10円、50円、100円、500円、1000円が利用可能）
```
$ vm.slot_money (100)
```
投入金額の総計を取得する
```
$ vm.current_slot_money
```
投入金額の総計を釣り銭として出力する（払い戻し操作）
```
$ vm.return_money
```
格納されているジュースの情報（値段と名前と在庫）を取得する
```
$ vm.stock_drink(Drink.cola)
$ vm.stock_drink(Drink.water)
$ vm.stock_drink(Drink.redbull)
```
投入金額、在庫の点で、コーラが購入できるかどうかを取得する（ステップ3要件）
```
$ vm.purchasable(Drink.cola)
```
購入操作
```
$ vm.buy(Drink.cola)
$ vm.store(Drink.water)
$ vm.store(Drink.redbull)
```
購入できるドリンクのリストを取得する
```
$ vm.purchasable_drink_list
```

#### 管理者側操作
ドリンクを補充する
```
$ vm.store(Drink.cola)
$ vm.store(Drink.water)
$ vm.store(Drink.redbull)
```
売上金の確認
```
$ vm.sale_amount
```