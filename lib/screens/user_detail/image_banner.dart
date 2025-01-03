import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assestPath;
  ImageBanner(this._assestPath);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 350.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Image.asset(
        _assestPath,
        fit: BoxFit.fill,
      ),
    );
  }
}
