// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Pokedex welcomeFromJson(String str) => Pokedex.fromJson(json.decode(str));

String welcomeToJson(Pokedex data) => json.encode(data.toJson());

class Pokedex {
    int count;
    String next;
    String previous;
    List<Pokemon> results;

    Pokedex({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<Pokemon>.from(results.map((x) => x.toJson())),
    };
}

class Pokemon {
    String name;
    String url;

    Pokemon({
        required this.name,
        required this.url,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
