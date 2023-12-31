// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.freezed.dart';

@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    required int id,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
