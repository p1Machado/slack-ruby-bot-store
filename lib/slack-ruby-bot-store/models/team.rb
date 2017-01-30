module SlackRubyBotStore
  module Team

    #attr_accessor(:team_id, :name, :domain, :token, :active)


    def deactivate!
      update_attributes!(active: false)
    end

    def activate!(token)
      update_attributes!(active: true, token: token)
    end
  end
end
