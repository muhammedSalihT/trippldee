import 'package:flutter/material.dart';

class DisplayName extends StatelessWidget {
  final String firstName;
  final String secondName;
  final String prefix;
  final String suffix;
  final TextStyle? style;

  const DisplayName({
    super.key,
    required this.firstName,
    required this.secondName,
    this.prefix = '',
    this.suffix = '',
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$prefix$firstName $secondName $suffix',
      style: style,
    );
  }
}
