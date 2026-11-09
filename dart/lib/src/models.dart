/// Response models for the Password Generator API.

/// API Response wrapper.
class PasswordgeneratorResponse {
  final String status;
  final dynamic error;
  final PasswordgeneratorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PasswordgeneratorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PasswordgeneratorResponse.fromJson(Map<String, dynamic> json) => PasswordgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PasswordgeneratorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Password Generator API.

class PasswordgeneratorData {
  List<PasswordgeneratorDataPasswordsItem>? passwords;
  num? count;

  PasswordgeneratorData({
    this.passwords,
    this.count,
  });

  factory PasswordgeneratorData.fromJson(Map<String, dynamic> json) => PasswordgeneratorData(
      passwords: (json['passwords'] as List?)?.map((e) => PasswordgeneratorDataPasswordsItem.fromJson(e)).toList(),
      count: json['count'],
    );
}

class PasswordgeneratorDataPasswordsItem {
  String? password;
  num? length;
  PasswordgeneratorDataPasswordsItemMetadata? metadata;
  dynamic analysis;

  PasswordgeneratorDataPasswordsItem({
    this.password,
    this.length,
    this.metadata,
    this.analysis,
  });

  factory PasswordgeneratorDataPasswordsItem.fromJson(Map<String, dynamic> json) => PasswordgeneratorDataPasswordsItem(
      password: json['password'],
      length: json['length'],
      metadata: json['metadata'] != null ? PasswordgeneratorDataPasswordsItemMetadata.fromJson(json['metadata']) : null,
      analysis: json['analysis'],
    );
}

class PasswordgeneratorDataPasswordsItemMetadata {
  String? type;
  String? complexity;

  PasswordgeneratorDataPasswordsItemMetadata({
    this.type,
    this.complexity,
  });

  factory PasswordgeneratorDataPasswordsItemMetadata.fromJson(Map<String, dynamic> json) => PasswordgeneratorDataPasswordsItemMetadata(
      type: json['type'],
      complexity: json['complexity'],
    );
}

class PasswordgeneratorRequest {
  int? count;
  int? length;
  String? complexity;
  String? type;
  bool? includeNumbers;
  bool? includeSymbols;
  bool? includeUppercase;
  bool? includeLowercase;
  bool? excludeSimilar;
  bool? excludeAmbiguous;
  bool? mixedCase;
  bool? strict;
  int? wordCount;
  String? separator;
  bool? capitalize;
  bool? analyze;

  PasswordgeneratorRequest({
    this.count,
    this.length,
    this.complexity,
    this.type,
    this.includeNumbers,
    this.includeSymbols,
    this.includeUppercase,
    this.includeLowercase,
    this.excludeSimilar,
    this.excludeAmbiguous,
    this.mixedCase,
    this.strict,
    this.wordCount,
    this.separator,
    this.capitalize,
    this.analyze,
  });

  Map<String, dynamic> toJson() => {
      if (count != null) 'count': count,
      if (length != null) 'length': length,
      if (complexity != null) 'complexity': complexity,
      if (type != null) 'type': type,
      if (includeNumbers != null) 'includeNumbers': includeNumbers,
      if (includeSymbols != null) 'includeSymbols': includeSymbols,
      if (includeUppercase != null) 'includeUppercase': includeUppercase,
      if (includeLowercase != null) 'includeLowercase': includeLowercase,
      if (excludeSimilar != null) 'excludeSimilar': excludeSimilar,
      if (excludeAmbiguous != null) 'excludeAmbiguous': excludeAmbiguous,
      if (mixedCase != null) 'mixedCase': mixedCase,
      if (strict != null) 'strict': strict,
      if (wordCount != null) 'wordCount': wordCount,
      if (separator != null) 'separator': separator,
      if (capitalize != null) 'capitalize': capitalize,
      if (analyze != null) 'analyze': analyze,
    };
}
