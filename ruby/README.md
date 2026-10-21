# Password Generator API - Ruby Gem

Password Generator creates random passwords, pronounceable strings, and multi-word passphrases configured by length, complexity, and character sets. It outputs generated strings with character counts and configuration metadata.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_passwordgenerator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_passwordgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_passwordgenerator'

# Initialize the client
client = APIVerve::Passwordgenerator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  count: 1,
  length: 12,
  complexity: "medium",
  type: "random",
  includeNumbers: true,
  includeSymbols: true,
  includeUppercase: true,
  includeLowercase: true,
  excludeSimilar: true,
  excludeAmbiguous: true,
  mixedCase: true,
  strict: true,
  wordCount: 4,
  separator: "-",
  capitalize: true,
  analyze: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ count: 1, length: 12, complexity: "medium", type: "random", includeNumbers: true, includeSymbols: true, includeUppercase: true, includeLowercase: true, excludeSimilar: true, excludeAmbiguous: true, mixedCase: true, strict: true, wordCount: 4, separator: "-", capitalize: true, analyze: true })
  puts response["data"]
rescue APIVerve::Passwordgenerator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Passwordgenerator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Passwordgenerator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "passwords": [
      {
        "password": "aOwqDh0ZK*P;!M|%oiFYJ!IK%TMXQO",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "Wo:)*V2nMakoVI78[fKu|QDI.E45p|",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "%XqlsK2qN.9>*&jk6gYIG.[aE,hiRc",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "WQNY0{R~(G99uc&i62Mve).n<|xt=F",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "2$m-&z9!5$c3QlxQP{h#@0x~'M/h]T",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "y]e_H)/z2yzbr{4C&hHOb[Q:#/$Hml",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "+iZ,<<+_MR:jJ,JbXTN*3Z,xLo'=@E",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "x=e6H^U;ajD+)h5Z8$7Wy)^Ob8ERw'",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "+p!SGSnR*JNl}/[#oVQy~ZxtoZU}F+",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      },
      {
        "password": "%h:23-bMb0;?QWL)chKm8{>%)mN:EO",
        "length": 30,
        "metadata": {
          "type": "random",
          "complexity": "strong"
        },
        "analysis": null
      }
    ],
    "count": 10
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/passwordgenerator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/passwordgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/passwordgenerator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
