import 'package:flutter/material.dart';
import 'package:pokemon_slider_ui/widgets/image_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: PokemonList(),
    );
  }
}

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010101),
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.62, 0.67, 0.85, 1.0],
                  // stops: const [0.0, 0.82, 0.85, 0.92, 1.0],
                ).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    ImageListView(
                      startIndex: 1,
                      duration: 45,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageListView(
                      startIndex: 4,
                      duration: 25,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageListView(
                      startIndex: 1,
                      duration: 35,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageListView(
                      startIndex: 2,
                      duration: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "the world of pokemons",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "The world of pokemons is a world of dreams and adventures with friends and companions. It is a world where you can become a hero.",
                    style: TextStyle(color: Colors.white70, height: 1.2),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
