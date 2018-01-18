class Bottles
    def verse(number_of_bottles)
        first = FirstPhrase.new.generate(number_of_bottles)
        second = SecondPhrase.new.generate(number_of_bottles)
        "#{first}#{second}"
    end

    def verses(from, to)
        stanza = ''
        while from >= to  do
            stanza = "#{stanza}#{verse(from)}\n" 
            from = from - 1
         end
         stanza.chomp
    end

    def song
        verses(99,0)
    end
    
end

class Phrase
    def create_remaining_bottles_phrase(number_of_bottles)
        if number_of_bottles == 1
            "1 bottle"
        elsif number_of_bottles == 0
            "no more bottles"
        else
            "#{number_of_bottles} bottles"
        end
    end
end


class FirstPhrase < Phrase
    def generate(number_of_bottles)
        remaining_in_the_wall = create_remaining_bottles_wall_phrase(number_of_bottles)
        remaining = create_remaining_bottles_phrase(number_of_bottles)
        "#{remaining_in_the_wall} of beer on the wall, #{remaining} of beer."
    end

    def create_remaining_bottles_wall_phrase(number_of_bottles)
        if number_of_bottles == 1
            "1 bottle"
        elsif number_of_bottles == 0
            "No more bottles"
        else
            "#{number_of_bottles} bottles"
        end
    end
end

class SecondPhrase < Phrase
    def generate(number_of_bottles)
        previous = number_of_bottles
        if(number_of_bottles == 0 )
            number_of_bottles = 100
        end
        number_of_bottles = number_of_bottles - 1

        take_down = create_take_down_phrase(previous, number_of_bottles)
        remaining = create_remaining_bottles_phrase(number_of_bottles)
        "\n#{take_down}, #{remaining} of beer on the wall.\n"
    end

    def create_take_down_phrase(previous, number_of_bottles)
        if(number_of_bottles ==  0 && previous == 1)
            "Take it down and pass it around"
        elsif(number_of_bottles == 99 && previous == 0)
            "Go to the store and buy some more"
        else
            "Take one down and pass it around"
        end
    end
end