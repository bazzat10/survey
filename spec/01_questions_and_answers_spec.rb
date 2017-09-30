require 'spec_helper'

RSpec.describe '01: Questions and Answers' do
  class Response
    def self.answered?(responses, user, question)
      responses.each { |i|
        result =
          if i[:user] == user && i[:answers][question] != nil
            true
          else
            false
          end
        return result
      }
    end

    def self.answer_for_question_by_user(responses, question, user)
      responses.each { |i|
        if i[:user]
          return i[:answers][question]
        end
      }
    end

    def self.question_average(responses, question)
      sum = 0
      num_people_answered = 0
      average = 0
      responses.each { |i|
        if i[:answers][question] == nil
          sum += 0;
        else
          sum += i[:answers][question]
          num_people_answered += 1
        end
      }
      average = sum.to_f / num_people_answered
      return average.round(2)
    end

    def self.question_participation_percentage(responses, question)
      percentage = 0
      participated = 0
      responses.each { |i|
        if i[:answers][question] != nil
          participated += 1
        end
      }
      percentage = (participated.to_f / responses.length) * 100
      return percentage.round(2)
    end

    def self.overall_participation_percentage(responses)
      percentage = 0
      participated = 0
      responses.each { |i|
        participated +=
          if i[:answers].empty?
            0
          else
            1
          end
      }
      percentage = (participated.to_f / responses.length) * 100
      return percentage.round(2)
    end
  end

  let(:responses) do
    [
      { user: "alice@example.com", answers: { q1: 1, q2: 2, q3: 4 } },
      { user: "bob@example.com", answers: { q1: 1, q2: 4, q3: 5 } },
      { user: "frank@example.com", answers: { q3: 5 } },
      { user: "claire@example.com", answers: {} },
      { user: "ella@example.com", answers: {} },
      { user: "sharon@example.com", answers: {} },
      { user: "ryan@example.com", answers: {} },
    ]
  end

  context "answered?" do #done
    it "determines that question 1 has been answered by alice" do
      expect(Response).to be_answered(responses, "alice@example.com", :q1)
    end

    it "determines that question has not been answered by frank" do #done
      expect(Response).not_to be_answered(responses, "frank@example.com", :q2)
    end

    it "does not error out if a respondent is not in the survey" do #done
      expect(Response).not_to be_answered(responses, "augustus@example.com", :q2)
    end
  end

  context "answer_for_question_by_user" do #done
    it "gets the answer for question 1 by bob" do
      expect(Response.answer_for_question_by_user(responses, :q1, "bob@example.com")).to eq(1)
    end

    it "gets no answer for question 4 from frank" do #done
      expect(Response.answer_for_question_by_user(responses, :q4, "frank@example.com")).to be_nil
    end

    it "returns nil for people who have not responded" do #done
      expect(Response.answer_for_question_by_user(responses, :q4, "claire@example.com"))
    end
  end

  context "question_average" do
    it "determines the average for question 1" do #done
      expect(Response.question_average(responses, :q1)).to eq(1)
    end

    it "determines the average for question 3" do #done
      expect(Response.question_average(responses, :q3)).to eq(4.67)
    end
  end

  context "question participation percentage" do
    # NOTE: This percentage is the number of people who have answered question #1.
    # If someone has answered this question, then we will say that they have "participated".
    # This number is rounded to 2 decimal places.
    it "works out participation percentage for question 1" do #done
      expect(Response.question_participation_percentage(responses, :q1)).to eq(28.57)
    end

    it "works out the participation percentage for question 3" do #done
      expect(Response.question_participation_percentage(responses, :q3)).to eq(42.86)
    end

    it "works out the participation percentage for question 4" do #done
      expect(Response.question_participation_percentage(responses, :q4)).to eq(0)
    end
  end

  context "overall participation percentage" do #done
    # NOTE: People are considered to have participated if they have answered at least 1 question.
    it "works out the overall participation percentage" do
      expect(Response.overall_participation_percentage(responses)).to eq(42.86)
    end
  end
end
