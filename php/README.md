# Password Generator API - PHP Package

Password Generator creates random passwords, pronounceable strings, and multi-word passphrases configured by length, complexity, and character sets. It outputs generated strings with character counts and configuration metadata.

## Installation

Install via Composer:

```bash
composer require apiverve/passwordgenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Passwordgenerator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'count' => 1,
    'length' => 12,
    'complexity' => 'medium',
    'type' => 'random',
    'includeNumbers' => true,
    'includeSymbols' => true,
    'includeUppercase' => true,
    'includeLowercase' => true,
    'excludeSimilar' => true,
    'excludeAmbiguous' => true,
    'mixedCase' => true,
    'strict' => true,
    'wordCount' => 4,
    'separator' => '-',
    'capitalize' => true,
    'analyze' => true
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Passwordgenerator\Client;
use APIVerve\Passwordgenerator\Exceptions\APIException;
use APIVerve\Passwordgenerator\Exceptions\ValidationException;

try {
    $response = $client->execute(['count' => 1, 'length' => 12, 'complexity' => 'medium', 'type' => 'random', 'includeNumbers' => true, 'includeSymbols' => true, 'includeUppercase' => true, 'includeLowercase' => true, 'excludeSimilar' => true, 'excludeAmbiguous' => true, 'mixedCase' => true, 'strict' => true, 'wordCount' => 4, 'separator' => '-', 'capitalize' => true, 'analyze' => true]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/passwordgenerator?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/passwordgenerator?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/passwordgenerator?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
