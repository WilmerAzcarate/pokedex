import 'package:flutter/material.dart';
import 'package:pokedex_movil/services/pokedex_service.dart';

import '../models/pokedex.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokedex>(
        future: PokedexService().getPokedext(),
        initialData: Pokedex(count: 0, next: '', previous: '', results: []),
        builder: (BuildContext context, AsyncSnapshot<Pokedex> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if (snapshot.hasError){
             return Text('Error: ${snapshot.error}');
          }else{
            //Ejemplo de commit
            List<Pokemon> pokemons = snapshot.data!.results;
          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (BuildContext context,int index){
              String pokemonName = _capitalizeString(pokemons[index].name);
              return ListTile(title: Text(pokemonName));
            });
          }
        });
  }
  String _capitalizeString(String text){
    return text[0].toUpperCase()+text.substring(1).toLowerCase();
  }
}
