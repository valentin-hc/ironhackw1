class FlashCard
  attr_accessor :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def question_and_answer(index = nil)
      if @answer == ""
          return
      end         
      puts " #{index} #{@question}"
      input = ''
      while input != @answer
          input = gets.chomp
      end
      puts @answer
  end
end


def display_cards(cards)

    cards.each_with_index{|card, index| 
      card.question_and_answer(index + 1)
  }

end

card0 = FlashCard.new("What does the array.each method do", "hello")
card01 = FlashCard.new("How much wood could a wood chuck chuck if a wood chuck could chuck wood", "42")
card1 = FlashCard.new("What does the array.each_with_index method do", "hello")
card2 = FlashCard.new("What does the array.map method do", "hello")
card5 = FlashCard.new("What does the array.select method do", "hello")
card02 = FlashCard.new("What is my favorite food", "hello")
card3 = FlashCard.new("What does the array.reduce method do", "hello")
card03 = FlashCard.new("Why is the sky blue", "Because, science.")

card_list = [card0, card01, card1, card02, card2, card3, card03, card5]

new_card_list = card_list.map do |card|
  card.question += "?"
  card
end

filtered_card_list = new_card_list.select do |card|
  card.question.include?("array")
end

display_cards(filtered_card_list.shuffle!)

