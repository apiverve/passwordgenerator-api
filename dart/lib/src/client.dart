import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class PasswordgeneratorValidationException implements Exception {
  final List<String> errors;

  PasswordgeneratorValidationException(this.errors);

  @override
  String toString() => 'PasswordgeneratorValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Password Generator API client.
///
/// For more information, visit: https://apiverve.com/marketplace/passwordgenerator?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [count] - The number of passwords to generate [min: 1, max: 100]
/// * [length] - The length of the password to generate [min: 4, max: 128]
/// * [complexity] - The complexity of the password. Only applies when type is random
/// * [type] - The kind of password to generate. random uses the complexity preset, pronounceable builds readable syllables, passphrase joins dictionary words, and custom honours the include/exclude switches below
/// * [includeNumbers] - Include digits. Applies to custom and pronounceable, and to random at simple complexity
/// * [includeSymbols] - Include punctuation symbols. Applies to custom, and to random at medium complexity
/// * [includeUppercase] - Include uppercase letters. Applies to custom, and to random at simple complexity
/// * [includeLowercase] - Include lowercase letters in a custom password. Set false to build from the other character sets only
/// * [excludeSimilar] - Exclude characters that are easy to confuse when read aloud or typed (i, l, 1, L, o, 0, O)
/// * [excludeAmbiguous] - Exclude brackets, slashes, quotes and other characters that need escaping in shells and config files
/// * [mixedCase] - Randomly capitalise letters in a pronounceable password
/// * [strict] - Guarantee at least one character from every enabled set rather than leaving it to chance
/// * [wordCount] - How many words a passphrase contains. Only applies when type is passphrase [min: 2, max: 12]
/// * [separator] - The character placed between passphrase words. Only applies when type is passphrase
/// * [capitalize] - Capitalise each word of a passphrase. Only applies when type is passphrase
/// * [analyze] - Return a strength analysis alongside each password
class PasswordgeneratorClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'count': ValidationRule(type: 'integer', required: false, min: 1, max: 100),
    'length': ValidationRule(type: 'integer', required: false, min: 4, max: 128),
    'complexity': ValidationRule(type: 'string', required: false),
    'type': ValidationRule(type: 'string', required: false),
    'includeNumbers': ValidationRule(type: 'boolean', required: false),
    'includeSymbols': ValidationRule(type: 'boolean', required: false),
    'includeUppercase': ValidationRule(type: 'boolean', required: false),
    'includeLowercase': ValidationRule(type: 'boolean', required: false),
    'excludeSimilar': ValidationRule(type: 'boolean', required: false),
    'excludeAmbiguous': ValidationRule(type: 'boolean', required: false),
    'mixedCase': ValidationRule(type: 'boolean', required: false),
    'strict': ValidationRule(type: 'boolean', required: false),
    'wordCount': ValidationRule(type: 'integer', required: false, min: 2, max: 12),
    'separator': ValidationRule(type: 'string', required: false),
    'capitalize': ValidationRule(type: 'boolean', required: false),
    'analyze': ValidationRule(type: 'boolean', required: false),
  };

  PasswordgeneratorClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/passwordgenerator',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [PasswordgeneratorValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw PasswordgeneratorValidationException(errors);
    }
  }

  /// Execute a request to the Password Generator API.
  ///
  /// Parameters are validated before sending the request.
  Future<PasswordgeneratorResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw PasswordgeneratorException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return PasswordgeneratorResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw PasswordgeneratorException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw PasswordgeneratorException('Resource not found');
      } else {
        throw PasswordgeneratorException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is PasswordgeneratorException) rethrow;
      throw PasswordgeneratorException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Password Generator API client.
class PasswordgeneratorException implements Exception {
  final String message;

  PasswordgeneratorException(this.message);

  @override
  String toString() => 'PasswordgeneratorException: $message';
}
