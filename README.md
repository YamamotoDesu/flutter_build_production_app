# [flutter_production_app](https://github.com/rddewan/flutter-build-production-app)

# Reusable Component
## Scaffold 

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

## TextField

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

## Primary Button
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

## Widget Keys
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

## Dimens 

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
