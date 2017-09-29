module Surveyor
  class Survey

    def initialize(survey)
      @survey = survey
      @survey_name = survey[:name]
      @questions = []
      @response = []
    end

    def name
      name = @survey_name
    end

    def questions
      if @survey[:question] != nil
        @questions << @survey[:question]
      end
      @questions
    end

    def responses
      if @survey[:response] != nil
        @response << @survey[:response]
      end
      @response
    end

    def participation_percentage(question_1)
      for i in @response
        binding.pry
      end

      @questions
      print question_1.title
      binding.pry

    end

  end
end
