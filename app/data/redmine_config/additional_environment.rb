config.logger = Logger.new(Rails.root.join("log",Rails.env + ".log"),3,5*1024*1024)
config.logger.level = Logger::WARN
