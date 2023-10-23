import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_setup/features/auth/signup/data/api/sign_up_api_service.dart';
import 'package:flutter_setup/features/auth/signup/data/dto/sign_up_response.dart';
import 'package:flutter_setup/features/auth/signup/data/repository/isign_up_repository.dart';

/// provider for ISignUpRepository
final signUpRepositoryProvider = Provider<ISignUpRepository>((ref) {
  final _signUpApiService = ref.watch(signUpApiServiceProvider);
  return SignUpRepository(_signUpApiService);
});

class SignUpRepository implements ISignUpRepository {
  final SignUpApiService _signUpApiService;

  SignUpRepository(this._signUpApiService);

  @override
  Future<SignUpResponse> signUp(Map<String, dynamic> request) async {
    return await _signUpApiService.signUp(request);
  }
}
