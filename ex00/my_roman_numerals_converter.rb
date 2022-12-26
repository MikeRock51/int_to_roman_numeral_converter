# This function computes the roman numeral of a single unit (numbers between 1 - 9)
def get_unit_roman(num_string)
    roman_value = ""

    if num_string == "4"
        roman_value += "IV"
    elsif num_string == "9"
        roman_value += "IX"
    elsif num_string.to_i < 4
        v = 0
        while v < num_string.to_i
            roman_value += "I"
            v += 1
        end
    elsif num_string.to_i < 9
        v = 5
        roman_value += "V"
        while v < num_string.to_i
            roman_value += "I"
            v += 1
        end
    end
    return (roman_value)
end

def get_tens_roman(roman_system, num_string)
    roman_value = ""
    tens_value = num_string[0].to_i

    if tens_value < 4
        v = 0
        while v < tens_value
            roman_value += roman_system['10']
            v += 1
        end
    elsif tens_value == 9
        roman_value += "XC"
    elsif tens_value >= 5
        v = tens_value - 5
        roman_value += roman_system['50']
        while v > 0
            roman_value += "X"
            v -= 1
        end
    elsif tens_value == 4
        roman_value += "XL"
    end
    if num_string[1] != 0 and num_string[1] != nil
        roman_value += get_unit_roman(num_string[1])
    end
    return (roman_value)
end

def get_hundreds_roman(roman_system, num_string)
    roman_value = ""
    hundreds_value = num_string[0].to_i
    
    if hundreds_value < 4
        v = hundreds_value
        while v > 0
            roman_value += roman_system['100']
            v -= 1
        end
    elsif hundreds_value == 9
        roman_value += "CM"
    elsif hundreds_value >= 5
        v = hundreds_value - 5
        roman_value += roman_system['500']
        while v > 0
            roman_value += 'C'
            v -= 1
        end
    elsif hundreds_value == 4
        roman_value += 'CD'
    end

    if num_string[1] != '0' && num_string[1] != nil
        roman_value += get_tens_roman(roman_system, num_string[1])
    end
    if num_string[2] != '0'
        roman_value += get_unit_roman(num_string[2])
    end
    return (roman_value)
end

def get_thousand_roman(roman_system, num_string)
    roman_value = ""
    thousand_value = num_string[0].to_i

    v = thousand_value
    while v > 0
        roman_value += roman_system['1000']
        v -= 1
    end
    if num_string[1] != '0' && num_string[1] != nil
        roman_value += get_hundreds_roman(roman_system, num_string[1])
    end
    if num_string[2] != '0' && num_string[2] != nil
        roman_value += get_tens_roman(roman_system, num_string[2])
    end
    if num_string[3] != '0'
        roman_value += get_unit_roman(num_string[3])
    end
    return (roman_value)
end

def my_roman_numerals_converter(number=0)
    sum = 0
    roman_system = {"1"=>"I", "5"=>"V", "10"=>"X", "50"=>"L", "100"=>"C", "500"=>"D", "1000"=>"M"}
    roman_value = ""
    num_string = number.to_s
    case num_string
    when "1", "5", "10", "50", "100", "500", "1000"
        roman_value = roman_system[num_string]
        return (roman_value)
    else
        case num_string.length()
        when 1
            roman_value = get_unit_roman(num_string)
            return (roman_value)
        when 2
            roman_value = get_tens_roman(roman_system, num_string)
            return (roman_value)
        when 3
            roman_value = get_hundreds_roman(roman_system, num_string)
            return (roman_value)
        when 4
            roman_value += get_thousand_roman(roman_system, num_string)
            return (roman_value)
        end
    end
end

# for i in 1500..2023
#     puts (my_roman_numerals_converter(i))
# end
# puts my_roman_numerals_converter(845)