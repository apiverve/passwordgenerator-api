PasswordGenerator API
============

Password Generator is a simple tool for generating passwords. It returns the generated password.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a .NET Wrapper for the [PasswordGenerator API](https://apiverve.com/marketplace/passwordgenerator?utm_source=nuget&utm_medium=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.PasswordGenerator
```

Using the Package Manager:
```
nuget install APIVerve.API.PasswordGenerator
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.PasswordGenerator
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.PasswordGenerator"
5. Click on the APIVerve.API.PasswordGenerator package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the passwordgenerator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.PasswordGenerator;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The PasswordGenerator API documentation is found here: [https://docs.apiverve.com/ref/passwordgenerator](https://docs.apiverve.com/ref/passwordgenerator?utm_source=nuget&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
PasswordGenerator API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.PasswordGenerator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.PasswordGenerator;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.PasswordGenerator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

        var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.PasswordGenerator;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new PasswordGeneratorQueryOptions {
    Count = 1,
    Length = 12,
    Complexity = "medium"
};

using (var apiClient = new PasswordGeneratorAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
