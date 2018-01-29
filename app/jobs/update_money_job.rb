class UpdateMoneyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    money = Persistence.find_by(name: 'money')
    lost = money.value.to_i
    loop do
      logger.info "job"
      puts "job"
      lost = lost+1653439
      money.value = lost
      money.save
      sleep 1
    end
  end
end
