"""
Password Generator API - Basic Usage Example

This example demonstrates the basic usage of the Password Generator API.
API Documentation: https://docs.apiverve.com/ref/passwordgenerator
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/passwordgenerator'

def call_passwordgenerator_api():
    """
    Make a GET request to the Password Generator API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;count&#x27;: 10, &#x27;length&#x27;: 12, &#x27;complexity&#x27;: &#x27;strong&#x27;, &#x27;type&#x27;: &#x27;random&#x27;, &#x27;includeNumbers&#x27;: true, &#x27;includeSymbols&#x27;: true, &#x27;includeUppercase&#x27;: true, &#x27;includeLowercase&#x27;: true, &#x27;excludeSimilar&#x27;: true, &#x27;excludeAmbiguous&#x27;: true, &#x27;mixedCase&#x27;: true, &#x27;strict&#x27;: true, &#x27;wordCount&#x27;: 4, &#x27;separator&#x27;: &#x27;-&#x27;, &#x27;capitalize&#x27;: true}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Password Generator API...\n')

    result = call_passwordgenerator_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
