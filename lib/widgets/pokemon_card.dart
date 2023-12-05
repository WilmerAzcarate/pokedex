import 'package:flutter/material.dart';
import 'package:pokedex_movil/models/pokedex.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Center(
              child: Text(
                _capitalizeString(pokemon.name)
              ),
            ),
          ),
          Image.network(pokemon.image!)
        ],
      ),
    );
  }

  String _capitalizeString(String text){
    return text[0].toUpperCase()+text.substring(1).toLowerCase();
  }
}