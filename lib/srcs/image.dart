// ignore_for_file: public_member_api_docs, avoid_web_libraries_in_flutter, unnecessary_cast, unsafe_html

import 'dart:html' as html;
import 'package:flutter/material.dart';

class Image extends SingleChildRenderObjectWidget { // Nouvel argument ajouté

  const Image({
    required this.src,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    Key? key,
    this.href,
    this.borderRadius, // Nouvel argument ajouté
  }) : super(key: key);
  final String src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? href;
  final BorderRadius? borderRadius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderImageToHtml(
      src,
      width,
      height,
      fit,
      href: href,
      borderRadius:
          borderRadius, // Passage de l'argument borderRadius au constructeur de RenderImageToHtml
    );
  }
}

class RenderImageToHtml extends RenderBox {

  RenderImageToHtml(
    this.src,
    this.width,
    this.height,
    this.fit, {
    this.href,
    this.borderRadius, // Nouvel argument ajouté
  });
  final String src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? href;
  final BorderRadius? borderRadius; // Nouvel argument ajouté

  html.ImageElement? imageElement;

  @override
  void performLayout() {
    final double desiredWidth = width ?? constraints.maxWidth;
    final double desiredHeight = height ?? constraints.maxHeight;

    // Create a new HTML image element
    imageElement = html.ImageElement();

    // Set the loading listener to update the layout once the image is loaded

    // Set the image dimensions
    imageElement!.src = src;
    imageElement!.width = desiredWidth.toInt();
    imageElement!.height = desiredHeight.toInt();
    final String objectFit = _convertBoxFitToCss(fit);
    imageElement!.style.objectFit = objectFit;

    if (borderRadius != null) {
      final String borderRadiusCss = _convertBorderRadiusToCss(borderRadius!);
      imageElement!.style.borderRadius = borderRadiusCss;
    }

    // Update the size constraints
    size = constraints.constrain(Size(desiredWidth, desiredHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (imageElement != null) {
      final html.DivElement div = html.DivElement()
        ..style.position = 'absolute'
        ..style.left = '${offset.dx}px'
        ..style.top = '${offset.dy}px'
        ..style.width = '${size.width}px'
        ..style.height = '${size.height}px';

      final html.Element contentElement =
          (href != null) ? html.AnchorElement() : html.SpanElement();

      contentElement.style.display = 'block';
      contentElement.style.width = '100%';
      contentElement.style.height = '100%';
      contentElement.append(imageElement!);

      if (contentElement is html.AnchorElement && href != null) {
        (contentElement as html.AnchorElement).href = href;
      }

      div.append(contentElement);

      html.document.body?.append(div);
    }
  }

  String _convertBoxFitToCss(BoxFit fit) {
    switch (fit) {
      case BoxFit.fill:
        return 'fill';
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fitWidth:
        return 'fit-width';
      case BoxFit.fitHeight:
        return 'fit-height';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scale-down';
      default:
        return 'contain';
    }
  }

  String _convertBorderRadiusToCss(BorderRadius borderRadius) {
    final Radius topLeft = borderRadius.topLeft;
    final Radius topRight = borderRadius.topRight;
    final Radius bottomLeft = borderRadius.bottomLeft;
    final Radius bottomRight = borderRadius.bottomRight;

    return '${_convertRadiusToCss(topLeft)} '
        '${_convertRadiusToCss(topRight)} '
        '${_convertRadiusToCss(bottomRight)} '
        '${_convertRadiusToCss(bottomLeft)}';
  }

  String _convertRadiusToCss(Radius radius) {
    return '${radius.x}px';
  }
}
