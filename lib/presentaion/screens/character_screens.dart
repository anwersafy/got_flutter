import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omarahmed_cubit/bloc/character_cubit.dart';
import 'package:omarahmed_cubit/data/models/characters.dart';

import '../../constants/colors.dart';
import '../widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<CharactersModel> Allcharacters;
  List<CharactersModel> SearchedCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context)
        .getAllCharacters()
        .then((value) => Allcharacters);
  }
  Widget BuildSearchWidget() {
    return TextField(
      controller: _searchTextController,
      decoration: const InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: (searchedCharacter) {
        addSearchCharactertoSearchedList(searchedCharacter);
      }

    );
  }
  void _startSearch () {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }
void _stopSearch () {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }
  void _clearSearch () {
    setState(() {
      _searchTextController.clear();
    });
  }
  void addSearchCharactertoSearchedList(String searchedCharacter) {
    SearchedCharacters = Allcharacters
        .where((character) =>
            character.fullName.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {

    });
  }
  List<Widget> _BuildAppBarActions(){
    if(_isSearching){
      return [
        IconButton(
          onPressed: (){
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ];
    }
    else{
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search),
        ),
      ];
    }
  }


  Widget BuildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is CharacterLoaded) {
        Allcharacters = state.char ;
        return BuildLoadedWidget();
      }
      else{
        return BuildLoadingWidget();
      }


    });
  }
  Widget BuildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget BuildLoadedWidget() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:Column(
          children: [
            BuildLoadedList(),
          ],
        ),
      ),
    );
  }
  Widget BuildLoadedList() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        itemCount:_searchTextController.text.isEmpty? Allcharacters.length:SearchedCharacters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CharacterItem(
            characterdata: _searchTextController.text.isEmpty?Allcharacters[index]:SearchedCharacters[index],
          );
        }

    );
  }
  Widget _BuildAppBarTitle (){
    return  Text(
      'Game Of Thrones',
      style: TextStyle(color: Colors.white),
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching? BackButton(
          color: Colors.white
        ):Container(),
        backgroundColor: AppColors.primaryColor,
        title: _isSearching?BuildSearchWidget():_BuildAppBarTitle(),
        actions:_BuildAppBarActions(),

        centerTitle: true,
      ),
      body:

      BuildBlocWidget(),
    );
  }
}
