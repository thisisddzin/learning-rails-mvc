require 'tty-spinner'

namespace :dev do
  desc "Recriando banco do 0."
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando banco de dados ...') { %x(rails db:drop) }
      show_spinner('Criando banco de dados ...') { %x(rails db:create) }
      show_spinner('Executando migração de tabelas ...') { %x(rails db:migrate) }
      show_spinner('Enviandos dados de seed para o banco ...') { %x(rails db:seed) }
    else
      puts "Você precisa estar em ambiente de desenvolvimento."
    end
  end

  def show_spinner(start_msg, end_msg = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] Executando tarefa: #{start_msg}", format: :pulse_2)
    spinner.auto_spin
    yield
    spinner.success("(#{end_msg})")
  end
end