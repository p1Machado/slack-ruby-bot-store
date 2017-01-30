require 'rspec'
require 'yaml'
require 'active_record'


ActiveRecord::Tasks::DatabaseTasks.database_configuration = YAML.load_file(File.expand_path("../../activerecord/config/database.yml", __FILE__))
ActiveRecord::Base.establish_connection ActiveRecord::Tasks::DatabaseTasks.database_configuration["development"]
ActiveRecord::Tasks::DatabaseTasks.db_dir = File.expand_path("../../activerecord/db", __FILE__)
ActiveRecord::Tasks::DatabaseTasks.root = File.expand_path("../../activerecord/", __FILE__)
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = File.expand_path("../../activerecord/db/migrate", __FILE__)
drop_config = ActiveRecord::Tasks::DatabaseTasks.database_configuration["development"].clone
drop_config["database"] = "db/development.sqlite3"
ActiveRecord::Tasks::DatabaseTasks.drop drop_config
ActiveRecord::Tasks::DatabaseTasks.create ActiveRecord::Tasks::DatabaseTasks.database_configuration["development"]
ActiveRecord::Tasks::DatabaseTasks.migrate


require File.expand_path('../../../lib/slack-ruby-bot-store', __FILE__)

require File.expand_path("../../activerecord/app/models/team", __FILE__)

describe SlackRubyBotStore::Team do
  context 'save!' do
    it 'a new team' do
      team = App::Team.new
      team.domain = "teste"
      expect(team.save!).to be true
    end
  end

  context 'deactivate!' do
    it 'deactivates a team' do
      team = App::Team.new
      team.domain = "teste"
      team.save!
      expect(team.save!).to be true
      expect(team.active).to be true
      team.deactivate!
      expect(team.active).to be false
    end
  end
end
