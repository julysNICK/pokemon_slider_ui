import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../screens/pokemonScreen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView(
      {super.key, required this.startIndex, required this.duration});

  final int startIndex;
  final double duration;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late final _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        _autoScroll();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  _autoScroll() {
    final currentScrollPosition = _scrollController.offset;

    final scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
        currentScrollPosition == scrollEndPosition ? 0.0 : scrollEndPosition,
        duration: Duration(seconds: widget.duration.toInt()),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return _ImageTile(image: 'assets/${widget.startIndex + index}.png');
          },
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PokemonScreen(
              image: image,
            ),
          ),
        );
      },
      child: Hero(
        tag: image,
        child: Image.asset(
          image,
          width: 130,
        ),
      ),
    );
  }
}
