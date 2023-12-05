import 'package:dio/dio.dart';
import 'package:pokedex_movil/env/env.dart';
import 'package:pokedex_movil/models/pokedex.dart';
import 'package:pokedex_movil/models/pokemon_details.dart';

class PokedexService {
  final _dio = Dio();

  Future<List<Pokemon>> getPokedext() async {
    try {
      String pokedexUrl = '$url/pokemon/?limit=20&offset=20';
      final Response response = await _dio.get(pokedexUrl);
      Pokedex pokedex = Pokedex.fromJson(response.data);
      return await parseResponse(pokedex.results);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPokemonImage(String url) async {
    try {
      final Response response = await _dio.get(url);
      final PokemonDetails pokemonDetails = PokemonDetails.fromJson(response.data);
      final String pokemonImage = pokemonDetails.sprites.other!.home.frontDefault;
      return pokemonImage;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Pokemon>> parseResponse(List<Pokemon> pokemons) async {
    List<Pokemon> parsedPokemons = [];
    for (Pokemon pokemon in pokemons) {
      final String pokemonImage = await getPokemonImage(pokemon.url);
      pokemon.image = pokemonImage;
      parsedPokemons.add(pokemon);
    }
    return parsedPokemons;
  }
}
