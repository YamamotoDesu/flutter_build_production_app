import 'package:flutter_setup/features/auth/signup/data/dto/sign_up_response.dart';

abstract class ISignUpRepository {
  Future<SignUpResponse> signUp(Map<String, dynamic> request);
}
