import 'package:flutter/material.dart';
import 'package:pokedex_movil/services/pokedex_service.dart';
import 'package:pokedex_movil/widgets/pokemon_card.dart';

import '../models/pokedex.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: PokedexService().getPokedext(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if (snapshot.hasError){
             return Text('Error: ${snapshot.error}');
          }else{
            //Ejemplo de commit
            List<Pokemon> pokemons = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4
              ),
              itemCount: pokemons.length,
              itemBuilder: (BuildContext context,int index){
                return PokemonCard(pokemons[index]);
              }, 
            );
          }
        });
  }
}
