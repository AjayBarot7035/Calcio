Calcio - CLI Application
=====================================

Quick calculator bot which handles the input manipulation and follow set of rules for the calculation.

## 🚀 Getting started

Instructions for local setup are given below:

1. Clone the repository
```
https://github.com/AjayBarot7035/Calcio.git
```

2. Enter the project directory
```
cd Calcio
```

3. Install dependencies
```
$ bundle install
```

4. rspec spec
```
Calcio
  .add
    when the input is an empty string
      returns 0
      returns 0 even the input has space issue
    when the input is a single digit
      returns 1
    when the input is two numbers separated by a comma
      returns the sum of the numbers
    when the input is more than two numbers separated by a comma
      returns the sum of the numbers
    when the input has new line delimiters between numbers
      returns the sum of all numbers
    when a custom delimiter is specified
      returns the sum of all numbers using the custom delimiter
      returns the sum of all numbers using a different custom delimiter
    when a custom delimiter, comma, newline specified
      returns the sum of all numbers with returns the sum of all numbers
    when input has negative numbers
      raises an exception with a message
    when user entered wrong input
      ignore the wrong input
    when user entered big input
      returns 5000050000

Finished in 0.15891 seconds (files took 0.15433 seconds to load)
12 examples, 0 failures

```
## 🕐 Benchmarking
Below are the result and output of benchmaring for big input 
```
Benchmark.bmbm do |x|
  x.report("Calcio Performance") {Calcio.add(Set.new(1..100000).join(','))}
end
Rehearsal ------------------------------------------------------
Calcio Performance   0.092679   0.005942   0.098621 (  0.098829)
--------------------------------------------- total: 0.098621sec

                         user     system      total        real
Calcio Performance   0.083583   0.003335   0.086918 (  0.087018)
```
PS: Just out of the curisity I tried to explore the parslet gem but getting worse result than this solution.

## 🤔 Initial thoughts
1. Read the instuctions
2. TODO: Don't forget the extra points link below the kata page
3. Do I have to validate the input?(to avoid rubbish/bad data input)
4. String to integer manipulation we have to do for the input
5. Avoid original input manipulation
6. Need to benchmark the solution
7. Small ruby app with minitest will be enough here
8. If we have complex calculation then move that calculation into service object
9. Add the comment so we can have proper rdoc
10. Create the requirement file with all the details
11. Try [parslet gem](https://github.com/kschiess/parslet) instead of regex if it works without rails :(
