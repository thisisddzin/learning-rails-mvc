# frozen_string_literal: true

module ApplicationHelper
  def date_format(us_date, to)
    case to
    when 'br'
      us_date.strftime('%d/%m/%Y')
    else
      us_date
    end
  end

  def my_environment(language)
    case language
    when 'br'
      Rails.env.development? ? 'Desenvolvimento' : Rails.env.production? ? 'Produção' : Rails.env
    else
      Rails.env
    end
  end
end
