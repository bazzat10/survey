require 'pry'

module Surveyor
  class Answer

    def initialize(question_answer)
      @question = question_answer[:question]
      @answer = question_answer[:value]
    end


    def valid?
      @question && @answer.to_i < 6
    end

  end
end
