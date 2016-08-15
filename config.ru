Dir.glob('./{config,controllers,services}/init.rb').each do |file|
  require file
end
run ProxyServer
