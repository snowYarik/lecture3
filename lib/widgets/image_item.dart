import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(
      {Key key, @required String imageUrl, VoidCallback onTapAction})
      : _imageUrl = imageUrl,
        _onTapAction = onTapAction,
        super(key: key);

  final String _imageUrl;
  final VoidCallback _onTapAction;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: NetworkImage(
        _imageUrl,
      ),
      fit: BoxFit.fill,
      child: InkWell(
        onTap: () => _onTapAction(),
      ),
    );
  }
}
