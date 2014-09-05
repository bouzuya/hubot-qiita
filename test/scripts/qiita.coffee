{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'hello', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      done()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    beforeEach ->
      @sender = new User 'bouzuya', room: 'hitoridokusho'
      @callback = @sinon.spy()
      @robot.listeners[0].callback = @callback

    describe 'receive "@hubot qiita lovelive"', ->
      beforeEach ->
        message = '@hubot qiita lovelive'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is '@hubot qiita lovelive'
        assert match[1] is 'lovelive'

  describe 'listeners[0].callback', ->
    beforeEach ->
      @callback = @robot.listeners[0].callback

    describe 'receive "@hubot qiita lovelive"', ->
      beforeEach ->
        responseBody = [title: 'hoge', url: 'https://qiita.com/items/abc']
        httpGetResponse = @sinon.stub()
        httpGetResponse
          .onFirstCall()
          .callsArgWith 0, null, null, JSON.stringify(responseBody)
        @send = @sinon.spy()
        @callback
          match: ['@hubot qiita lovelive', 'lovelive']
          send: @send
          http: (-> query: (-> get: (-> httpGetResponse)))

      it 'send "hoge https://qiita.com/items/abc"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is 'hoge https://qiita.com/items/abc'
