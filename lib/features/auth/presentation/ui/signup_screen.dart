import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_setup/base/base_consumer_state.dart';
import 'package:flutter_setup/common/extentions/string_hardcoded.dart';
import 'package:flutter_setup/common/mixin/input_phone_formatter_mixin.dart';
import 'package:flutter_setup/common/mixin/input_validation_mixin.dart';
import 'package:flutter_setup/common/widget/app_scaffold.dart';
import 'package:flutter_setup/common/widget/button/primary_button.dart';
import 'package:flutter_setup/common/widget/checkbox/check_box_widget.dart';
import 'package:flutter_setup/common/widget/form/custom_text_form_field.dart';

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
