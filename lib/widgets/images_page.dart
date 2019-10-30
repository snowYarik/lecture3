import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lecture3/widgets/detail_image_page.dart';
import 'package:lecture3/widgets/image_item.dart';

class ImagesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final _imageUrls = <String>[];

  final _gridScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Images',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: _imageGrid(context),
      floatingActionButton: _addImageFloatButton(),
    );
  }

  Widget _imageGrid(BuildContext context) {
    return GridView.builder(
      itemCount: _imageUrls.length,
      controller: _gridScrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _imageUrls.length,
      ),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(5.0),
          child: ImageItem(
            imageUrl: _imageUrls[index],
            onTapAction: () =>
                _navigateToDetailImage(context, _imageUrls[index]),
          ),
        );
      },
    );
  }

  void _navigateToDetailImage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DetailImagePage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  Widget _addImageFloatButton() {
    return FloatingActionButton(
      splashColor: Colors.blueGrey,
      child: Icon(Icons.add),
      onPressed: () {
        _imageUrls.add(_generateRandomUrl());
        _animateToEnd();
      },
    );
  }

  String _generateRandomUrl() =>
      'https://picsum.photos/id/${Random().nextInt(1000)}/1080/';

  void _animateToEnd() {
    _gridScrollController.animateTo(
      _gridScrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
  }
}
