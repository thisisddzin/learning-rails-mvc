require 'tty-spinner'

namespace :dev do
  desc "Recriando banco do 0."
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando banco de dados ...') { %x(rails db:drop) }
      show_spinner('Criando banco de dados ...') { %x(rails db:create) }
      show_spinner('Executando migração de tabelas ...') { %x(rails db:migrate) }
      puts "Iniciando seeds by task ..."
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você precisa estar em ambiente de desenvolvimento."
    end
  end

  desc "Criando moedas."
  task add_coins: :environment do
    # order: title | acronym | image_url
    coins_list = [
      [
        "Bitcoin", 
        "BTC", 
        "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png",
        MiningType.find_by(acronym: "PoW")
      ],
      [
        "Ethereum", 
        "ETH", 
        "https://banner2.kisspng.com/20180330/wae/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01b6f4b4.2459439115224007697494.jpg",
        MiningType.all.sample
      ],
      [
        "Ripple", 
        "XRP", 
        "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/ripple_xrp_coin-512.png",
        MiningType.all.sample
      ],
      [
        "Litecoin", 
        "LTC", 
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/LTC-400.png/220px-LTC-400.png",
        MiningType.all.sample
      ],
      [
        "Binance Coin", 
        "BNB", 
        "https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png",
        MiningType.all.sample
      ],
      [
        "Tether", 
        "USDT", 
        "http://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/Tether-USDT-icon.png",
        MiningType.all.sample
      ],
    ]

    spinner = TTY::Spinner.new("[:spinner] Executando tarefa: Adicionando tipos de mineração ...", format: :pulse_2)
    spinner.auto_spin

    coins_list.each do |title, acronym, image_url, mining_type|
      puts mining_type
      Coin.find_or_create_by!(
        title: title,
        acronym: acronym,
        image_url: image_url,
        mining_type: mining_type
      )
    end
    spinner.success("(Concluído!)")
  end

  desc "Criando moedas."
  task add_mining_types: :environment do
    # order: title | acronym
    type_mining_list = [
      ["Proof of Stake", "PoS"],
      ["Proof of Work", "PoW"],
      ["Proof of Capacity", "PoC"]
    ]
    spinner = TTY::Spinner.new("[:spinner] Executando tarefa: Adicionando moedas ...", format: :pulse_2)
    spinner.auto_spin

    type_mining_list.each do |title, acronym|
      MiningType.find_or_create_by!(
        title: title,
        acronym: acronym
      )
    end
    spinner.success("(Concluído!)")
  end

  private

  def show_spinner(start_msg, end_msg = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] Executando tarefa: #{start_msg}", format: :pulse_2)
    spinner.auto_spin
    yield
    spinner.success("(#{end_msg})")
  end

end