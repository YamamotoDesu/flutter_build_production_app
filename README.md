# [flutter_production_app](https://github.com/rddewan/flutter-build-production-app)

# Reusable Component
## Reusable Widget - Scaffold 

lib/common/widget/app_scaffold.dart
```dart
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget title;
  final Widget widget;
  final bool centerTitle;
  final ScrollController? controller;

  const AppScaffold({
    Key? key,
    required this.title,
    required this.widget,
    this.centerTitle = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: centerTitle,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: widget,
        ),
      ),
    );
  }
}

```

lib/common/widget/app_scaffold_slive.dart
```dart
import 'package:flutter/material.dart';

class AppScaffoldSliver extends StatelessWidget {
  final Widget title;
  final List<Widget> slivers;
  final bool centerTitle;
  final ScrollController? controller;

  const AppScaffoldSliver({
    Key? key,
    required this.title,
    required this.slivers,
    this.centerTitle = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: centerTitle,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: controller,
          slivers: slivers,
        ),
      ),
    );
  }
}
```

## Reusable Widget - TextField

lib/common/widget/form/custom_text_form_field.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    ValueKey? textFieldKey,
    required String labelText,
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool isObscureText = false,
    required TextInputType keyboardType,
    required TextInputAction textInputAction,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    String? Function(String?)? onChanged,
    required TextEditingController controller,
  })  : _textFieldKey = textFieldKey,
        _labelText = labelText,
        _hintText = hintText,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _validator = validator,
        _isObscureText = isObscureText,
        _controller = controller,
        _onChanged = onChanged,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _inputFormatters = inputFormatters,
        super(key: key);

  final ValueKey? _textFieldKey;
  final TextEditingController _controller;
  final String _labelText;
  final String? _hintText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final bool _isObscureText;
  final TextInputType _keyboardType;
  final TextInputAction _textInputAction;
  final List<TextInputFormatter>? _inputFormatters;
  final String? Function(String?)? _validator;
  final String? Function(String?)? _onChanged;

  @override
  _CustomTextFormFieldStateState createState() =>
      _CustomTextFormFieldStateState();
}

class _CustomTextFormFieldStateState extends State<CustomTextFormField> {
  String _value = "";

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(() => setTextValue());
  }

  @override
  void dispose() {
    widget._controller.removeListener(() => setTextValue());
    super.dispose();
  }

  void setTextValue() {
    setState(() {
      _value = widget._controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget._textFieldKey,
      controller: widget._controller,
      obscureText: widget._isObscureText,
      keyboardType: widget._keyboardType,
      textInputAction: widget._textInputAction,
      decoration: InputDecoration(
        labelText: widget._labelText,
        hintText: widget._hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: widget._prefixIcon,
        suffixIcon: _value.isNotEmpty ? widget._suffixIcon : null,
      ),
      inputFormatters: widget._inputFormatters,
      validator: widget._validator,
      onChanged: widget._onChanged,
    );
  }
}

```

## Reusable Widget - Primary Button
lib/common/widget/button/primary_button.dart
```dart
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.isEnabled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FilledButton.tonal(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.all(8),
            ),
            onPressed: isEnabled ? onPressed : null,
            child: isLoading
                ? const CircularProgressIndicator.adaptive()
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
          ),
        )
      ],
    );
  }
}
```

## Reusable Widget - Widget Keys
lib/common/widget/widget_key.dart
```dart
import 'package:flutter/material.dart';

const nameTextKey = ValueKey('name');
const emailTextKey = ValueKey('email');
const passwordTextKey = ValueKey('password');
const confirmPasswordTextKey = ValueKey('confirmPassword');
const phoneTextKey = ValueKey('phone');
const btnLoginKey = ValueKey('btnLogin');
const btnRegisterKey = ValueKey('btnRegister');
const btnLogoutKey = ValueKey('btnLogout');
const btnYesKey = ValueKey('btnYes');
const btnNoKey = ValueKey('btnNo');
const registerNowTextKey = ValueKey('registerNow');
```

## Reusable Widget - Dimens 

lib/common/styles/dimens.dart
```dart
const double kXXXSmall = 1.0;
const double kXXSmall = 2.0;
const double kXSmall = 4.0;
const double kSmall = 8.0;
const double kSMedium = 12.0;
const double kMedium = 16.0;
const double kXLMedium = 20.0;
const double kLarge = 24.0;
const double kXLarge = 32.0;
const double kXXLarge = 40.0;
const double kXXXLarge = 48.0;
const double kXXXXLarge = 64.0;
const double kLeadingWidth = 96.0;
```

## Reusable Widget - Dialog
lib/common/widget/dialog/confirm_dialog.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_setup/common/styles/dimens.dart';
import 'package:flutter_setup/common/widget/widget_key.dart';

mixin ConfirmDialog {
  Future<void> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String msg,
    required String btnYesText,
    required String btnNoText,
    bool barrierDismissible = true,
    required VoidCallback onYesTap,
    required VoidCallback onNoTap,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => barrierDismissible,
          child: AlertDialog(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kSmall),
            ),
            content: Container(
              padding: const EdgeInsets.only(
                top: kXLarge,
                bottom: kMedium,
                left: kMedium,
                right: kMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.info),
                  const SizedBox(height: kMedium),
                  Text(title, style: textTheme.headlineSmall),
                  const SizedBox(height: kMedium),
                  Text(
                    msg,
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: kLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        key: btnNoKey,
                        onPressed: onNoTap,
                        icon: const Icon(Icons.close),
                        label: Text(btnNoText),
                      ),
                      const SizedBox(
                        width: kMedium,
                      ),
                      ElevatedButton.icon(
                        key: btnYesKey,
                        onPressed: onYesTap,
                        icon: const Icon(Icons.check),
                        label: Text(btnYesText),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
```

## Reusable Widget - 
Checkbox
lib/common/widget/checkbox/check_box_widget.dart
```dart
import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool? value;
  final FormFieldValidator<bool>? validator;
  final Function(bool?) onChanged;

  const CheckboxWidget({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.validator,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: widget.validator,
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            title: Text(widget.title),
            subtitle: Text(widget.subtitle),
            value: widget.value,
            onChanged: (value) {
              widget.onChanged(value);
              field.didChange(value);
              field.validate();
            },
          ),
          if (field.hasError) ...[
            Text(
              field.errorText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.red,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
```

## Extension - StringHardCoded
lib/common/extentions/string_hardcoded.dart
```dart
extension StringHardCoded on String {
  String get toHardCoded => this;
}
```

## Mixin -Input Validater
lib/common/mixin/input_validation_mixin.dart
```dart
enum ValidateFailResult {
  empty,
  invalidEmail,
  invalidPassword,
  passwordNotMatch,
  invalidAtLeastEightCharacter,
  invalidPhoneNumber,
  invalidLength,
  invalidPasswordType,
  isNewPasswordMatchOldPassword,
  isNewPwdAndConfirmedPwdNotMatched,
}

typedef Validator = ValidateFailResult? Function(String?);
typedef ValidatorString = String? Function(String?);

mixin InputValidationMixin {
  final hasNumberRegEx = RegExp(r'[0-9]+');
  final hasCharacterRegEx = RegExp(r"[a-zA-Z]+");
  final isNumber = RegExp(r'[^0-9]{1,}');
  final isEmailRegEx = RegExp(
    r"^[a-zA-Z0-9.!#$%&'.*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?).*$",
  );
  final isPhoneNumber = RegExp(
    r'^(016|086|096|097|098|032|033|034|035|036|037|038|039|090|093|0120|0121|0122|0126|0128|0896|091|094|083|084|085|081|082|092|056|058|099|059|0296|0254|0209|0204|0291|0222|0275|0256|0274|0271|0252|0290|0292|0206|0236|0262|0261|0215|0251|0277|0269|0226|024|0239|0220|0225|0293|079|028|0221|0258|0297|0260|0213|0263|0205|0214|0272|0228|0238|0259|0229|0257|0232|0235|0255|0203|0233|0299|0212|0276|0227|0208|0237|0234|0273|0294|0207|0270|0216|08|06|09)([0-9]{6,9})$',
  );

  ValidateFailResult? isTextEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return ValidateFailResult.empty;
    }
    return null;
  }

  ValidateFailResult? isInvalidEmail(String? value) {
    if (value == null || !isEmailRegEx.hasMatch(value)) {
      return ValidateFailResult.invalidEmail;
    }
    return null;
  }

  ValidateFailResult? invalidPasswordType(bool? invalid) {
    if (invalid != null) {
      return ValidateFailResult.invalidPasswordType;
    }
    return null;
  }

  // at least 8 character (a-z)
  // at least 1 number (0-9)
  ValidateFailResult? isPasswordInvalid(String? value) {
    bool isInvalidLength = (value == null || value.length < 6);

    if (isInvalidLength) {
      return ValidateFailResult.invalidLength;
    }

    bool haveAtLeastOneNumber = hasNumberRegEx.hasMatch(value);
    bool haveAtLeastOneCharacter = hasCharacterRegEx.hasMatch(value);

    if (!haveAtLeastOneNumber || !haveAtLeastOneCharacter) {
      return ValidateFailResult.invalidPassword;
    }

    return null;
  }

  ValidateFailResult? isInvalidPhoneNumber(String? value) {
    String? isValidNumber = value?.replaceAll(isNumber, '');

    if (isValidNumber != null) {
      if (isValidNumber.length < 10) {
        return ValidateFailResult.invalidPhoneNumber;
      }
      if (!isPhoneNumber.hasMatch(isValidNumber)) {
        return ValidateFailResult.invalidPhoneNumber;
      }
    }

    return null;
  }

  ValidatorString combine(List<ValidatorString> validators) {
    return (String? str) {
      for (final validator in validators) {
        final result = validator(str);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  ValidatorString withMessage(String message, Validator validator) {
    return (String? str) {
      final result = validator(str);
      if (result != null) {
        return message;
      }
      return null;
    };
  }

  String? isValidTermsAndConditions(bool? value, String message) {
    if (value == false || value == null) {
      return message;
    }
    return null;
  }
}
```

## Text Theme Context 

```dart
import 'package:flutter/material.dart';

extension TextThemeContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
```

## Async Value Widget
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_setup/core/exception/failure.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (error, stack) {
        final failure = error as Failure;
        return Center(
          child: Text(failure.message),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

```

## InputPhoneFormatter
pubspec.yaml
```yaml
  mask_text_input_formatter: ^2.5.0
```

lib/common/mixin/input_phone_formatter_mixin.dart
```dart
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

mixin InputPhoneFormatter {
  var maskPhoneFormatter = MaskTextInputFormatter(
    mask: '###-###-####', //016-196-0210
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
```

## Sign up 
<img width="300" alt="image" src="https://github.com/YamamotoDesu/flutter_build_production_app/assets/47273077/a8cc3c2b-6cb7-4361-b6d1-7501a59557d1">

lib/features/auth/presentation/ui/signup_screen.dart
```dart
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseConsumerState<SignUpScreen>
    with InputValidationMixin, InputPhoneFormatter {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text('SignUp'),
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                labelText: 'Name'.toHardCoded,
                hintText: 'Enter your name'.toHardCoded,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: _nameController,
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _nameController.clear();
                  },
                ),
                validator: combine([
                  withMessage(
                    'Name is required'.toHardCoded,
                    isTextEmpty,
                  ),
                ]),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                labelText: 'Email'.toHardCoded,
                hintText: 'Enter your email'.toHardCoded,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: _emailController,
                prefixIcon: const Icon(Icons.email),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _emailController.clear();
                  },
                ),
                validator: combine([
                  withMessage(
                    'email is required'.toHardCoded,
                    isTextEmpty,
                  ),
                  withMessage(
                    'email is invalid'.toHardCoded,
                    isInvalidEmail,
                  ),
                ]),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                labelText: 'Password'.toHardCoded,
                hintText: 'Enter your password'.toHardCoded,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                controller: _passwordController,
                isObscureText: true,
                prefixIcon: const Icon(Icons.visibility_off),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _passwordController.clear();
                  },
                ),
                validator: combine([
                  withMessage(
                    'password is required'.toHardCoded,
                    isTextEmpty,
                  ),
                  withMessage(
                    'password is invalid'.toHardCoded,
                    isPasswordInvalid,
                  ),
                ]),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                labelText: 'Confirm Password'.toHardCoded,
                hintText: 'Enter your confirm password'.toHardCoded,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                controller: _confirmPasswordController,
                isObscureText: true,
                prefixIcon: const Icon(Icons.visibility_off),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _confirmPasswordController.clear();
                  },
                ),
                validator: combine([
                  withMessage(
                    'password is required'.toHardCoded,
                    isTextEmpty,
                  ),
                  withMessage(
                    'password is invalid'.toHardCoded,
                    isPasswordInvalid,
                  ),
                ]),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                labelText: 'Phone'.toHardCoded,
                hintText: 'Enter your phone password'.toHardCoded,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: _phoneController,
                prefixIcon: const Icon(Icons.visibility_off),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _phoneController.clear();
                  },
                ),
                inputFormatters: [maskPhoneFormatter],
                validator: combine([
                  withMessage(
                    'phone is required'.toHardCoded,
                    isTextEmpty,
                  ),
                  withMessage(
                    'phone is invalid'.toHardCoded,
                    isInvalidPhoneNumber,
                  ),
                ]),
                onChanged: (String? value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              CheckboxWidget(
                title: 'Terms and conditions',
                subtitle: 'Please accept the terms and conditions',
                value: false,
                validator: (value) {
                  return isValidTermsAndConditions(
                    value,
                    'Please accept the terms and conditions',
                  );
                },
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              PrimaryButton(
                text: 'Sign Up',
                isEnabled: true,
                isLoading: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Signup API service
lib/features/auth/signup/data/api/sign_up_api_service.dart
```dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_setup/core/remote/network_service.dart';
import 'package:flutter_setup/features/auth/signup/data/dto/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_service.g.dart';

/// provider for SignUpApiService
final signUpApiServiceProvider = Provider<SignUpApiService>((ref) {
  final dio = ref.watch(networkServiceProvider);

  return SignUpApiService(dio);
});

@RestApi()
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio) => _SignUpApiService(dio);

  @POST('api/v1/register')
  Future<SignUpResponse> signUp(@Body() Map<String, dynamic> request);
}
```

lib/features/auth/signup/data/dto/sign_up_response.dart
```dart
@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    required String id,
    required String name,
    required String email,
    required String phone,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
```

## Signup API Repository
lib/features/auth/signup/data/repository/isign_up_repository.dart
```dart
import 'package:flutter_setup/features/auth/signup/data/dto/sign_up_response.dart';

abstract class ISignUpRepository {
  Future<SignUpResponse> signUp(Map<String, dynamic> request);
}
```

lib/features/auth/signup/data/repository/sign_up_repository.dart
```dart
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
```
