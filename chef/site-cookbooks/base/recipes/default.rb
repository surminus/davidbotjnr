user 'laura' do
  home '/home/laura'
  manage_home true
end

sudo 'laura' do
  user 'laura'
end

directory '/home/laura/.ssh' do
  owner 'laura'
  group 'laura'
  mode '0700'
end

file '/home/laura/.ssh/authorized_keys' do
  owner 'laura'
  group 'laura'
  mode '0600'
  content 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDEm6aB83IC/cwmF5xSrfV1kVgHU1nvPgTurabKTAxOcyOB0BglSKqu2IhSf1X+h5Rtrpht/tgeaZSM7YBxMqAIEw9Wvvbq9m1KvPvNKxZYCzXOMv+0YZJy04Lp3sCiIs3mrMEgX8+h8tMqT1Blf1rNu1v3UhTpZiYmj0HW7jwhGHReUlTQgfyr/xBMXy+Pz6ZQXNrf0xwHFE/PdirOSAFAOyv9ppsEVOONZgLr2AEJ5asBUim7aQSgSDTMHMvtiQN7mw64z4zR7KmTH+drMJd44NTbWgmz8h6++h1Ukk7bH49yqnYGtT+JkHc6KH6lSUUNmsMbkWk/42DL+T9pBFALtYewUmD5ra19pJOMd5kfBqhl2Wmd/9ioU4YMVqwb2zUDigG9C4WgbU7ieOXec3ODZplCIUN+WORw2CZmQNTc/lXVCS0igcjXB9nR4FUqG8GxBTYJgqPNUDG5RCuPyqz0hc9isGXfyAtYHhlXpYwjKZ/Ug2DNWOYlL/AxNZXwAC9b+22fysWva1kjMKiu8Q0nJ6rxEwNzl3bw0i3ZVcoWf2wg5W3EBMIuBcJhgbfVyAIgj8C4Z8LK6A4Me0PpXt/1WpQ5/GKlsm/6IWBHQ48c5PBkuvCW7EPAuqIa/xKNdAv1xkerMQeCl2ut7gJZzzqjdihyuvAzCHUBsCMQbOLCyQ=='
end

docker_service 'default' do
  action [:create, :start]
end
