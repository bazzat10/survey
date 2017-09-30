require 'pry'

module Surveyor
  class Question

    def initialize(new_question)
      @title = new_question[:title]
      @type = new_question[:type]
    end

    def title
      @title
    end

    def type
      @type
    end

  end
end
