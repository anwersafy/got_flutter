import 'package:omarahmed_cubit/data/services/character_web_services.dart';

import '../models/characters.dart';

class CharacterRepositry{
   CharacterWebServices characterWebServices ;
   CharacterRepositry(this.characterWebServices);

   Future<List<CharactersModel>> getAllCharacters() async {
     final characters = await characterWebServices.getAllCharacters();
      return characters.map((Character) => CharactersModel.fromJson(Character)).toList();
   }
}