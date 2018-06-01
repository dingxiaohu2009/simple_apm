module SimpleApm
  class Setting
    ApmSettings = YAML.load(IO.read(Dir.join(Rails.root, 'configs', 'simple_apm.yml'))) rescue {}
    REDIS_URL = ApmSettings['redis_url'].presence || 'redis://localhost:6379/0'
    # nil , hiredis ...
    REDIS_DRIVER = ApmSettings['redis_driver']
    # 最慢的请求数存储量
    SLOW_ACTIONS_LIMIT = ApmSettings['slow_actions_limit'].presence || 1000
    # 每个action存最慢的请求量
    ACTION_SLOW_REQUEST_LIMIT = ApmSettings['action_slow_request_limit'].presence || 100
  end
end