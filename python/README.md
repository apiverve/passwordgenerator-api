Password Generator API
============

Password Generator creates random passwords, pronounceable strings, and multi-word passphrases configured by length, complexity, and character sets. It outputs generated strings with character counts and configuration metadata.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-passwordgenerator.svg)](https://pypi.org/project/apiverve-passwordgenerator/)

This is a Python wrapper for the [Password Generator API](https://apiverve.com/marketplace/passwordgenerator?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-passwordgenerator
```

Using `pip3`:

```bash
pip3 install apiverve-passwordgenerator
```

---

## Configuration

Before using the Password Generator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = PasswordgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Password Generator API documentation is found here: [https://docs.apiverve.com/ref/passwordgenerator](https://docs.apiverve.com/ref/passwordgenerator?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient

# Initialize the client with your APIVerve API key
api = PasswordgeneratorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `PasswordgeneratorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient, PasswordgeneratorAPIClientError

api = PasswordgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except PasswordgeneratorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient, PasswordgeneratorAPIClientError

api = PasswordgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except PasswordgeneratorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient, PasswordgeneratorAPIClientError

query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}

# Using context manager ensures proper cleanup
with PasswordgeneratorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except PasswordgeneratorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient

# Enable debug mode
api = PasswordgeneratorAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_passwordgenerator.apiClient import PasswordgeneratorAPIClient

api = PasswordgeneratorAPIClient("[YOUR_API_KEY]")

query = {
    "count": 1,
    "length": 12,
    "complexity": "medium",
    "type": "random",
    "includeNumbers": true,
    "includeSymbols": true,
    "includeUppercase": true,
    "includeLowercase": true,
    "excludeSimilar": true,
    "excludeAmbiguous": true,
    "mixedCase": true,
    "strict": true,
    "wordCount": 4,
    "separator": "-",
    "capitalize": true,
    "analyze": true
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
