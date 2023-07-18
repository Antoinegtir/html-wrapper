// ignore_for_file: public_member_api_docs, prefer_single_quotes, avoid_redundant_argument_values, avoid_positional_boolean_parameters, cast_nullable_to_non_nullable, avoid_web_libraries_in_flutter, unsafe_html, unnecessary_cast

import 'dart:html' as html;
import 'package:flutter/material.dart';

class Tag {
  static const String p = "p";
  static const String u = "u";
  static const String s = "s";
  static const String q = "q";
  static const String h1 = "h1";
  static const String h2 = "h2";
  static const String h3 = "h3";
  static const String h4 = "h4";
  static const String h5 = "h5";
  static const String h6 = "h6";
  static const String em = "em";
  static const String sub = "sub";
  static const String sup = "sup";
  static const String del = "del";
  static const String ins = "ins";
  static const String pre = "pre";
  static const String big = "big";
  static const String abbr = "abbr";
  static const String span = "span";
  static const String code = "code";
  static const String small = "small";
  static const String strong = "strong";
  static const String mark = "mark";
  static const String address = "address";
  static const String blockquote = "blockquote";
}

class Text extends SingleChildRenderObjectWidget {
  const Text(
    this.text, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    required this.tag,
    this.href,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final String tag;
  final String? href;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTextToHtml(
      text,
      style,
      strutStyle,
      textAlign,
      textDirection,
      locale,
      softWrap,
      overflow,
      textScaleFactor,
      maxLines,
      semanticsLabel,
      textWidthBasis,
      textHeightBehavior,
      selectionColor,
      tag,
      href,
    );
  }
}

class RenderTextToHtml extends RenderBox {
  RenderTextToHtml(
    this.text,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.tag,
    this.href,
  ) {
    if (tag == null) {
      element = html.Element.tag("span");
    }
    if (tag != null) {
      element = html.Element.tag(tag as String);
    }
  }
  final String? href;
  final String text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final String? tag;
  html.Element element = html.SpanElement();

  @override
  void performLayout() {
    element.text = text;
    element.style.color = _convertColorToCss(style?.color);
    element.style.fontSize = '${style?.fontSize}px';
    element.style.fontFamily = style?.fontFamily;
    element.style.fontWeight = _convertFontWeightToCss(style?.fontWeight);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection ?? TextDirection.ltr,
      textAlign: textAlign ?? TextAlign.start,
      textScaleFactor: textScaleFactor ?? 1.0,
      maxLines: maxLines ?? 1,
      strutStyle: strutStyle,
      ellipsis: overflow == TextOverflow.ellipsis ? '...' : null,
      locale: locale,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
    );
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);

    final bool wrapText = softWrap ?? false;
    final double maxWidth = constraints.maxWidth;
    if (wrapText && textPainter.width > maxWidth) {
      textPainter.layout(maxWidth: maxWidth);
    }

    final Size desiredSize = Size(
      textPainter.width,
      textPainter.height,
    );

    size = constraints.constrain(desiredSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final html.DivElement div = html.DivElement()
      ..style.position = 'absolute'
      ..style.left = '${offset.dx}px'
      ..style.top = '${offset.dy}px'
      ..style.width = '${size.width + style!.fontSize!.toInt()}px'
      ..style.height = '${size.height}px';

    final html.Element element = (href !=
            null)
        ? html
            .AnchorElement()
        : html
            .SpanElement();

    element.text = text;
    element.style.color = _convertColorToCss(style?.color);
    element.style.fontSize = '${style?.fontSize}px';
    element.style.fontFamily = style?.fontFamily;
    element.style.fontWeight = _convertFontWeightToCss(style?.fontWeight);

    if (element is html.AnchorElement && href != null) {
      (element as html.AnchorElement).href =
          href;
    }

    div.append(element);

    html.document.body?.append(div);
  }

  String? _convertColorToCss(Color? color) {
    if (color != null) {
      return 'rgb(${color.red}, ${color.green}, ${color.blue})';
    }
    return 'rgb(0,0,0)';
  }

  String? _convertFontWeightToCss(FontWeight? fontWeight) {
    if (fontWeight != null) {
      if (fontWeight == FontWeight.bold) {
        return 'bold';
      }
      if (fontWeight == FontWeight.normal) {
        return 'normal';
      }
      if (fontWeight == FontWeight.w100) {
        return '100';
      }
      if (fontWeight == FontWeight.w200) {
        return '200';
      }
      if (fontWeight == FontWeight.w300) {
        return '300';
      }
      if (fontWeight == FontWeight.w400) {
        return '400';
      }
      if (fontWeight == FontWeight.w500) {
        return '500';
      }
      if (fontWeight == FontWeight.w600) {
        return '600';
      }
      if (fontWeight == FontWeight.w700) {
        return '700';
      }
      if (fontWeight == FontWeight.w800) {
        return '800';
      }
      if (fontWeight == FontWeight.w900) {
        return '900';
      }
    }
    return null;
  }
}
