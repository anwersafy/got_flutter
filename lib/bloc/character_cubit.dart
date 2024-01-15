import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/characters.dart';
import '../data/repositry/characters_repositry.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepositry characterRepositry;
  late List <CharactersModel> characters ;
  CharacterCubit(this.characterRepositry) : super(CharacterInitial());
  Future getAllCharacters() {
    final characters = characterRepositry.getAllCharacters().then((Characters) {
      emit(CharacterLoaded(Characters));

      this.characters = Characters;

    });
    return characters;
  }

}
