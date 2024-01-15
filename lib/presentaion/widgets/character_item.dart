
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:omarahmed_cubit/data/models/characters.dart';

import '../../constants/strings.dart';

class CharacterItem extends StatelessWidget {
  final CharactersModel  characterdata;
  const CharacterItem({super.key,required this.characterdata});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 15,
      elevation: 10,

      color: Colors.transparent,
      width: double.infinity,
      child:
      InkWell(
        onTap: (){
          Navigator.pushNamed(context, characterDetailsScreen,arguments: characterdata);
        },
        child: Hero(
          tag: characterdata.fullName,
          child: GridTile(footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
                "${characterdata.fullName}",
                textAlign: TextAlign.center,
              ),
            ),child:
          Container(
            child: characterdata.imageUrl.isNotEmpty
                ? Image.network(
              characterdata.imageUrl!,
              fit: BoxFit.cover,
            )
                : Lottie.asset('assets/images/loading.json',fit: BoxFit.cover,)
          ),

          ),
        ),
      ),


    );
  }
}
