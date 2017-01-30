module App
  class Team < ActiveRecord::Base
    include SlackRubyBotStore::Team

  end
end
