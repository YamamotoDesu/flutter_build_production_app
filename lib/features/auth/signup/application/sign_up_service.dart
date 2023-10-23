import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_setup/features/auth/signup/application/isign_up_service.dart';
import 'package:flutter_setup/features/auth/signup/data/dto/sign_up_response.dart';
import 'package:flutter_setup/features/auth/signup/data/repository/isign_up_repository.dart';
import 'package:flutter_setup/features/auth/signup/data/repository/sign_up_repository.dart';

/// provider for SignUpApiService
final signUpApiServiceProvider = Provider<ISignUpService>((ref) {
  final signUpRepository = ref.watch(signUpRepositoryProvider);
  return SignUpApiService(signUpRepository);
});

class SignUpApiService implements ISignUpService {
  final ISignUpRepository _signUpRepository;

  SignUpApiService(this._signUpRepository);

  @override
  Future<SignUpResponse> signUp(Map<String, dynamic> request) async {
    return await _signUpRepository.signUp(request);
  }
}
