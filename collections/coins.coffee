#blockchain = DDP.connect 'ws://ws.blockchain.info/inv'
#blockchain = new WebSocket 'ws://ws.blockchain.info/inv'

@Coins = new Meteor.Collection 'coins',
  #connection: blockchain
  transform: (args) ->
    new @Bitcoin args

@Addresses = new Meteor.Collection 'addresses',
  transform: (args) ->
    # TODO: refactore with meteor-dependance
    switch args.code
      when 'BTC' then new @Bitcoin args.address
      when 'EAC' then new @Earthcoin args.address
      when 'LTC' then new @Litecoin args.address
      when 'NOBLE' then new @Noblecoin args.address
      else new @Bitcoin args.address
