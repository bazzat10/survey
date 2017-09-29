require 'pry'

module Surveyor
  class Response

    def initialize(response)
      @answers = []
      @response = response
    end

    def answers
      if @response[:answers] != nil
        @answers << @response[:answers]
      end
      @answers
    end


  end
end
