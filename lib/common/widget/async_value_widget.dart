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
