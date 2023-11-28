import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_movil/env/env.dart';
import 'package:pokedex_movil/models/pokedex.dart';

class PokedexService {

  Future<Pokedex> getPokedext() async {
    String pokedexUrl = '$url/pokemon/?limit=20&offset=20'; //limit (limite de la cantidad de registros), offset (desde que indice de la lista traer los registros)
    final response = await http.get(Uri.parse(pokedexUrl));
    Pokedex pokedex = Pokedex.fromJson(jsonDecode(response.body));
    return pokedex;
  }

}