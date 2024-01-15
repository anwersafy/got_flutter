

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omarahmed_cubit/bloc/character_cubit.dart';
import 'package:omarahmed_cubit/data/models/characters.dart';
import 'package:omarahmed_cubit/data/repositry/characters_repositry.dart';
import 'package:omarahmed_cubit/presentaion/screens/character_details.dart';
import 'package:omarahmed_cubit/presentaion/screens/character_screens.dart';

import 'constants/strings.dart';
import 'data/services/character_web_services.dart';
class AppRoute {
  late CharacterRepositry characterRepositry ;
  late CharacterCubit characterCubit ;
  AppRoute(){
    characterRepositry = CharacterRepositry(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepositry);
  }
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharacterCubit(CharacterRepositry(CharacterWebServices()))..getAllCharacters(),
            child: const CharacterScreen(),

          ),

        );
      case characterDetailsScreen:
        final characterdata = settings.arguments as CharactersModel;
        return MaterialPageRoute(
          builder: (_) =>  CharacterDetailsScreen(characterdata: characterdata,),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}