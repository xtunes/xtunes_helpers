module TestEngine
  class HomeController < TestEngine::ApplicationController
    def index
      logger.info 'out file'
    end
  end
end