import 'package:flutter/material.dart';
import 'package:lecture3/widgets/image_item.dart';

class DetailImagePage extends StatelessWidget {
  const DetailImagePage({
    Key key,
    String imageUrl,
  })  : _imageUrl = imageUrl,
        super(key: key);

  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _detailImage(),
    );
  }

  Widget _detailImage() {
    return Center(
      child: ImageItem(
        imageUrl: _imageUrl,
      ),
    );
  }
}
