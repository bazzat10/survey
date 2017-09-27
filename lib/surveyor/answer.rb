require 'pry'

module Surveyor
  class Answer

    def initialize(q_validation)
      @question_validation = q_validation
    end

    def valid?
      @question_validation[:question] && @question_validation[:value].to_i < 6
    end

  end
end
