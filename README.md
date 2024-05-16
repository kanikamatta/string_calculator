# String Calculator

The String Calculator is a simple calculator that takes a string of numbers and returns their sum. It supports various features such as handling different delimiters, allowing new lines between numbers, and ignoring numbers larger than 1000.

## Features

- **Addition of Numbers**: The calculator can sum up numbers provided as a string.
- **Empty String Handling**: An empty string input returns 0.
- **Handling Unknown Amount of Numbers**: The calculator can handle an unknown amount of numbers.
- **Handling New Lines Between Numbers**: New lines between numbers are supported.
- **Support for Different Delimiters**: Delimiters can be customized using a specific format.
- **Exception Handling for Negative Numbers**: Negative numbers are not allowed, and an exception is thrown if any are encountered.
- **Ignoring Numbers Larger Than 1000**: Numbers larger than 1000 are ignored in the calculation.
- **Support for Delimiters of Any Length**: Delimiters can be of any length.
- **Support for Multiple Delimiters**: Multiple delimiters are supported, including those with lengths longer than one character.

## Usage

To use the String Calculator, follow these steps:

1. Start by cloning the repository:

   ```
   git clone https://github.com/kanikamatta/string_calculator
   ```

2. Navigate to the project directory:

   ```
   cd string_calculator
   ```

3. Run the Rails server:

   ```
   rails server
   ```

4. You can now make HTTP requests to the calculator API. Here are some examples:

   - **Adding Numbers**: Send a POST request to `/calculator/add` with the numbers in the request body as JSON. For example:

     ```
     POST /calculator/add
     Content-Type: application/json

     {
       "numbers": "1,2,3"
     }
     ```

     Response:

     ```
     {
       "result": 6
     }
     ```

5. Explore the test suite to understand how different scenarios are handled:

   ```
   rails test
   ```

