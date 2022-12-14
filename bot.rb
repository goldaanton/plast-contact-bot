# frozen_String_literal: true

require 'telegram_bot'

token = '5909233774:AAEn9Kb8B58EWUIg-x5UUOW9YSMy20EmTYc'

bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"

  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      reply.text = "All I can do is say hello. Try the /greet command."
    when /greet/i
      greetings = ['bonjour', 'hola', 'hallo', 'sveiki', 'namaste', 'salaam', 'szia', 'halo', 'ciao']
      reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}!"
    else
      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
