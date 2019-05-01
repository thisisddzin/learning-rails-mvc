# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coins_list = [
  ["Bitcoin", "BTC", "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"],
  ["Ethereum", "ETH", "https://banner2.kisspng.com/20180330/wae/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01b6f4b4.2459439115224007697494.jpg"],
  ["Ripple", "XRP", "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/ripple_xrp_coin-512.png"],
  ["Litecoin", "LTC", "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/LTC-400.png/220px-LTC-400.png"],
  ["Binance Coin", "BNB", "https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png"],
  ["Tether", "USDT", "http://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Tether-USDT-icon.png"],
]

coins_list.each do |title, acronym, image_url|
  Coin.create!(
    title: title,
    acronym: acronym,
    image_url: image_url
  )
end
