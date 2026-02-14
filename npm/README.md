# Password Generator API

Password Generator is a simple tool for generating passwords. It returns the generated password.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)
[![npm version](https://img.shields.io/npm/v/@apiverve/passwordgenerator.svg)](https://www.npmjs.com/package/@apiverve/passwordgenerator)

This is a Javascript Wrapper for the [Password Generator API](https://apiverve.com/marketplace/passwordgenerator?utm_source=npm&utm_medium=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/passwordgenerator
```

Using yarn:
```shell
yarn add @apiverve/passwordgenerator
```

---

## Configuration

Before using the Password Generator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=readme)

The Password Generator API documentation is found here: [https://docs.apiverve.com/ref/passwordgenerator](https://docs.apiverve.com/ref/passwordgenerator?utm_source=npm&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const passwordgeneratorAPI = require('@apiverve/passwordgenerator');
const api = new passwordgeneratorAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  count: 1,
  length: 12,
  complexity: "medium"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  count: 1,
  length: 12,
  complexity: "medium"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  count: 1,
  length: 12,
  complexity: "medium"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "length": "30",
    "count": 10,
    "complexity": "strong",
    "passwords": [
      "nYC+ye^j0?*$[FQh-x2WkBs0)B3Z2A",
      "KbT'#1$?Z.|y:E*vy3iPndYM78mh.",
      "]Pja)F/#a{pc[nS37w_@B*+Tjq3)/]",
      "/C7f!3g-}QnJBJAV7hxiLv'UBkc@2=",
      ".'i2('fD'80]'l/g)BoY[#OW&8",
      "1::wMGZ#sUpgeQW9HMPNKbD00jyR|A",
      "0C]R0!V'Q0g09^H)dn!b9Zi3L|@9B",
      "evM'CS7ssm!URJ?6|2O-XfgziQZ=b",
      "52.Z8G||Zf(-|d'c3Lf0Ap#PagG9j(",
      "inBL1G-H(Oo[B#xfgJ$F*%=3')Ofn"
    ]
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=readme), [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=readme), and [Refund Policy](https://apiverve.com/refund?utm_source=npm&utm_medium=readme).

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
