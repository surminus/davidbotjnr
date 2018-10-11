# Do something when someone leaves
class JoinChannel < SlackRubyBot::Server
  on 'member_joined_channel' do |client, data|
    greeting =
      if Time.now.hour < 12
        'Good morning'
      elsif Time.now.hour > 18
        'Good evening'
      else
        'Good afternoon'
      end

    client.say(
      channel: data.channel,
      text: "#{greeting}, #{client.store.users[data.user].real_name}!"
    )
  end
end
