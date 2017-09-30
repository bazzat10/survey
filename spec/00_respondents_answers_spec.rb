require 'spec_helper'
require 'rubygems'
require 'pry'

RSpec.describe '00: Respondent Answers' do
  class Response
    def self.count(responses)
       return responses.count
    end

    def self.for(responses, user)
      responses.each { |i|
        if i[:user] == user
          return i
        end
      }
    end

    def self.present?(responses, user)
      responses.each { |i|
        if i[:user] == user
          return true
        end
      }
      return false
    end

    def self.positive(responses)
      positive_responses = 0
      responses.each { |i|
        if i[:answer] > 3
          positive_responses += 1
        end
      }
      return positive_responses
    end

    def self.negative(responses)
      negative_responses = 0
      responses.each { |i|
        if i[:answer] < 3
          negative_responses += 1
        end
      }
      return negative_responses
    end

    def self.average(responses)
      average = 0
      sum = 0
      responses.each { |i|
        sum += i[:answer]
      }
      average = sum.to_f / responses.length #calculates and return float
      return average
    end
  end

  let(:responses) do
    [
      { user: "alice@example.com", answer: 1 },
      { user: "bob@example.com", answer: 2 },
      { user: "frank@example.com", answer: 3 },
      { user: "claire@example.com", answer: 4 },
    ]
  end

  context "count" do # done
    it "counts the number of responses" do
      expect(Response.count(responses)).to eq(4)
    end
  end

  context "for" do # done
    it "finds the response from frank@example.com" do
      response = Response.for(responses, "frank@example.com")
      expect(response[:answer]).to eq(3)
    end

    it "finds the response from bob@example.com" do # done
      response = Response.for(responses, "bob@example.com")
      expect(response[:answer]).to eq(2)
    end
  end

  context "present?" do
    it "frank@example.com's response is present" do #done
      expect(Response.present?(responses, "frank@example.com")).to be true
    end

    it "bill@example.com's response is not present" do #done
      expect(Response.present?(responses, "bill@example.com")).to be false
    end
  end

  context "positive" do #done
    it "finds the positive responses (score > 3)" do
      expect(Response.positive(responses)).to eq(1)
    end
  end

  context "negative" do #done
    it "finds the negative responses (score < 3)" do
      expect(Response.negative(responses)).to eq(2)
    end
  end

  context "average" do #done
    it "finds the average of the answers" do
      expect(Response.average(responses)).to eq(2.5)
    end
  end
end
