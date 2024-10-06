# A regular expression (or regex) can be thought of as kind of like a search query. Regular expressions are used to identify, match, or otherwise manage text. Regex is capable of much more than keyword searches, though. It can be used to find any kind of pattern imaginable. Patterns can be found easier by using meta-characters. These special characters that make this search tool much more powerful.
cat phone.txt # his example uses US (NANP) conventions for phone numbers. These are 10-digit IDs that are broken up into an area code (3 digits), and a unique 7 digit combination where the first 3 digits correspond to a central telecom office (known as a prefix) and the last 4 are called the line number. So the pattern is AAA-PPP-LLLL.
"5551231234
555 123 1234
555-123-1234
(555)-123-1234
555!123!1234 this is not a standard phone number pattern and will not be returned by the grep expression"
# using meta-characters to isolate the relevant data and ignore what isn't needed
grep '\(([0-9]\{3\})\|[0-9]\{3\}\)[ -]\?[0-9]\{3\}[ -]\?[0-9]\{4\}' ./phone.txt
# First let's separate the section of the RegEx that looks for the "area code" in the phone number. A similar pattern is partially repeated to get the rest of the digits, as well. It's important to note that the area code is sometimes encapsulated in parentheses, so you need to account for that with the expression here.
'\(([0-9]\{3\})\|[0-9]\{3\}\)         [ -]\?[0-9]\{3\}[ -]\?[0-9]\{4\}'
# The logic of the entire area code section is encapsulated in an escaped set of round braces. You can see that my code starts with \( and ends with \)
"\(    ([0-9]\{3\})\|[0-9]\{3\}    \)"
# When you use the square brackets [0-9], you're letting grep know that you're looking for a number between 0 and 9. Similarly, you could use [a-z] to match letters of the alphabet.
"\((    [0-9]    \{3\})\|[0-9]\{3\}\)"
# The number in the curly brackets {3\}, means that the item in the square braces is matched exactly three times.
"\(([0-9]\    {3\}    )\|[0-9]\{3\}\)"
# (3-digit number, each one could be 0-9 inside parenthesis)      OR      3-digit number, each one could be 0-9
'\(                 ([0-9]\{3\})                                 \|                   [0-9]\{3\}              \)'
#  The \? symbol means "match zero or one of the preceding character". Here, that's referring to what is in our square brackets [ -]. In other words, there may or may not be a hyphen that follows the digits.
'\(([0-9]\{3\})\|[0-9]\{3\}\)      [ -]\?      [0-9]\{3\}[ -]\?[0-9]\{4\}'
# To complete the phone number pattern, you can just re-purpose some of your existing code. You don't have to be concerned about the parenthesis surrounding the prefix anymore, but you still may or may not have a "-" between the prefix and the line digits of the phone number.
'\(([0-9]\{3\})\|[0-9]\{3\}\)[ -]\?        [0-9]\{3\}[ -]\?         [0-9]\{4\}'
# The last section of the phone number does not require us to look for any other characters, but you need to update the expression to reflect the extra digit.
'\(([0-9]\{3\})\|[0-9]\{3\}\)[ -]\?[0-9]\{3\}[ -]\?           [0-9]\{4\}'
# make sure that the expression is contained in quotes to minimize unexpected behaviors.
"\(([0-9]\{3\})\|[0-9]\{3\}\)[ -]\?[0-9]\{3\}[ -]\?[0-9]\{4\}"


cat AsciidoctorConvertWithNashorn.java
'public class AsciidoctorConvertWithNashorn {
    ScriptEngine engine = engineManager.getEngineByName("nashorn");
    engine.eval(new FileReader("./spec/nashorn/asciidoctor-convert.js"));'
cat BasicJavascriptWithNashorn.java
'public class BasicJavascriptWithNashorn {
    ScriptEngine engine = engineManager.getEngineByName("nashorn");
    engine.eval(new FileReader("./spec/nashorn/basic.js"));'

^ # the start of the line
[^:]* # followed by a sequence of any characters except a colon
\. # followed by a dot (the dot has a special meaning in regex, so I had to protect it with a backslash to express I want a literal match)
java # followed by the four letters “java.”
# In practice, since grep will use a colon to separate the filename from the context, I keep only lines having .java in the filename section
grep -ir nashorn ./ | grep "^[^:]*\.java"

'./spec/nashorn/AsciidoctorConvertWithNashorn.java:public class AsciidoctorConvertWithNashorn {
./spec/nashorn/AsciidoctorConvertWithNashorn.java:    ScriptEngine engine = engineManager.getEngineByName("nashorn");
./spec/nashorn/AsciidoctorConvertWithNashorn.java:    engine.eval(new FileReader("./spec/nashorn/asciidoctor-convert.js"));
./spec/nashorn/BasicJavascriptWithNashorn.java:public class BasicJavascriptWithNashorn {
./spec/nashorn/BasicJavascriptWithNashorn.java:    ScriptEngine engine = engineManager.getEngineByName("nashorn");
./spec/nashorn/BasicJavascriptWithNashorn.java:    engine.eval(new FileReader("./spec/nashorn/basic.js"));'


# https://en.wikipedia.org/wiki/Regular_expression?ref=linuxhandbook.com

# https://en.wikipedia.org/wiki/Glob_(programming)?ref=linuxhandbook.com
