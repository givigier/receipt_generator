# Receipt Generator

## How to Run

I'm using Ruby 3.4.2

1. Run the program using:
  ```bash
    ruby main.rb
  ```
2. Run specs using:
  ```bash
    bundle exec rspec spec
  ```

## Assumptions

1. Product names containing keywords like 'book', 'chocolate', 'pills' are considered tax exempt. If I need to build a solution based on user input, it becomes much more complex because I would have to classify whether the input falls into one of the exempt categories.
2. Products with 'imported' in their name are considered imported goods.
3. All prices are in the same currency.
4. Input format follows the specified pattern: "<quantity> <name> at <price>". If the input doesn't match this format, it's ignored.
5. I chose to enter the data directly into the main.rb file.

## Questions

1. Is the Output 3 correct? In my calculations the line `3 imported boxes of chocolates: 35.55` should be 35.45.