import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/space_model.dart';

class PlanetProvider with ChangeNotifier {
  Planet? _planetModel;
  List<Planet> _likedPlanets = [];

  Planet? get planetModel => _planetModel;
  List<Planet> get likedPlanets => _likedPlanets;

  void setPlanetModel(Planet planet) {
    _planetModel = planet;
    notifyListeners();
  }

  Future<void> toggleLiked(Planet planet) async {
    planet.toggleLiked();
    notifyListeners();
    await _saveLikedState(planet);
    _updateLikedPlanets(planet);
  }

  Future<void> _saveLikedState(Planet planet) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('liked_${planet.name}', planet.liked);
  }

  Future<void> loadLikedState(List<Planet> planets) async {
    final prefs = await SharedPreferences.getInstance();
    for (var planet in planets) {
      final liked = prefs.getBool('liked_${planet.name}') ?? false;
      planet.liked = liked;
      _updateLikedPlanets(planet);
    }
    notifyListeners();
  }

  void _updateLikedPlanets(Planet planet) {
    if (planet.liked) {
      _likedPlanets.add(planet);
    } else {
      _likedPlanets.removeWhere((p) => p.name == planet.name);
    }
  }
}
