// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:flutter/widgets.dart';

class Robots extends StatelessWidget {
  final String content;

  const Robots({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final metaElement = html.MetaElement()
      ..name = 'robots'
      ..content = content;

    html.document.head?.children.add(metaElement);
    return const SizedBox.shrink();
  }
}
