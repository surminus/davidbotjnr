# Do something when someone joins
class LeaveChannel < SlackRubyBot::Server
  on 'member_left_channel' do |client, data|
    goodbye =
      if Time.now.hour > 20
        'Have a nice evening'
      else
        'Goodbye'
      end

    client.say(
      channel: data.channel,
      text: "#{goodbye}, #{client.store.users[data.user].real_name}!"
    )
  end
end
