import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../demoData.dart';

class ImageCarousal extends StatefulWidget {
  const ImageCarousal({
    super.key,
  });

  @override
  State<ImageCarousal> createState() => _ImageCarousalState();
}

class _ImageCarousalState extends State<ImageCarousal> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.81,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                itemCount: demoBigImages.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                //here the images already rounded
                //but all images may not the same
                //Let's add rounded shape
                itemBuilder: (context, index) => ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Image.asset(demoBigImages[index]))),
            Positioned(
              bottom: defaultPadding,
              right: defaultPadding,
              child: Row(
                  children: List.generate(
                    demoBigImages.length,
                        (index) => Padding(
                        padding: const EdgeInsets.only(left: defaultPadding / 4),
                        child: IndicatorDot(isActive: index == _currentPage)),
                  )),
            ),
          ],
        ));
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
