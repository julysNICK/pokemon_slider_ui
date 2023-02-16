import 'package:flutter/material.dart';

import '../animations/fade_animation.dart';
import '../widgets/blur_container.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Hero(
                tag: image,
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Image.asset(
                      image,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: FadeAnimation(
                  intervalEnd: 0.1,
                  child: BlurContainer(
                    child: Container(
                      alignment: Alignment.center,
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Pokemon",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FadeAnimation(
                intervalStart: 0.3,
                child: Text(
                  "Pokemon#001",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FadeAnimation(
                intervalStart: 0.35,
                child: Text(
                  "owned by Ash Ketchum",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FadeAnimation(
                intervalStart: 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _InfoTile(title: "3d 5h 23m", subtitle: "registered"),
                    _InfoTile(title: "17.5 pw", subtitle: "power"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeAnimation(
              intervalStart: 0.6,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor,
                ),
                child: const FadeAnimation(
                  intervalStart: 0.8,
                  child: Text(
                    "Unregistered pokemon",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
