module SpriteMe
  class Server  < Goliath::API

    def response(env)
      urls =["http://imgv2-3.scribdassets.com/img/word_user/20953361/48x48/e0e419fad7/1332991813", "http://profile.ak.fbcdn.net/hprofile-ak-snc4/187591_519501168_265807_q.jpg"]
      p Downloader.get_responses(urls)
      [200, {}, "OK"]
    end
  end
end