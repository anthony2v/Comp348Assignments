# Automatic Readability Index Calculator
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
\end{lstlisting}

\section*{Problem 4}

\begin{lstlisting}[label={list:second},caption=Ruby Code -- Automatic Readability Index Calculator.]
def calcARI(fileName)
    data = []
    characters = words = sentences = 0
    gradeLevel = {  1 => "5-6 (kindergarten)",
                    2 => "6-7 (first/second grade)",
                    3 => "7-9 (third grade)",
                    4 => "9-10 (fourth grade)",
                    5 => "10-11 (fifth grade)",
                    6 => "11-12 (sixth grade)",
                    7 => "12-13 (seventh grade)",
                    8 => "13-14 (eighth grade)",
                    9 => "14-15 (ninth grade)",
                    10 => "15-16 (tenth grade)",
                    11 => "16-17 (eleventh grade)",
                    12 => "17-18 (twelfth grade)",
                    13 => "18-24 (college student)",
                    14 => "24+ (professor)" }
    File.open(fileName).each { |line|
            data.concat(line.split)
    }
    data.each { |word|
            characters += word.length
            if word.match(/\p{Alnum}*\./) then
                    sentences += 1
            end
            if word.match(/\p{Any}*\p{P}/) then
                characters -= word.scan(/\p{P}/).length
            end
            if word.match(/\p{Alnum}'\p{Alnum}/) then
                    characters += 1
            end
            words += 1
    }
    ari = 4.71 * characters/words
    ari +=  0.5 * words/sentences - 21.43
    puts "Total number of characters: " + characters.to_s
    puts "Total number of words: " + words.to_s
    puts "Total number of sentences: " + sentences.to_s
    puts "Automated Readability Index: " + ari.round(1).to_s
    puts "Grade level: " + gradeLevel[ari.to_i]
end

calcARI("paragraph.txt")