def string_sorter (stringArray)
    for i in 0..(stringArray.length - 2) do
            until (stringArray[i] <=> stringArray[i + 1]) <= 0
                    temp = stringArray[i]
                    stringArray[i] = stringArray[i + 1]
                    stringArray[i + 1] = temp
            end
    end
    for s in 0..(stringArray.length - 1) do
            puts stringArray[s] + ", ch_count=" + stringArray[s].length.to_s
    end
end

string_sorter(["Adam", "Eve", "Mark", "Franklin", "John"])