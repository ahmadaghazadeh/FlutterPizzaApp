import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pizzas/models/recipe.dart';
import 'package:flutter_pizzas/services/data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mealTypeFilter = "";
  List<String> mealTypes=["Snack","Breakfast","Lunch","Dinner"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Recipe book"),
        centerTitle: true,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

 Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _recipeTypeButtons(),
          _recipesList()
        ],
      ),
    );
 }

 Widget _recipeTypeButtons(){ // Move to independent widget
    return SizedBox(
      height: MediaQuery.sizeOf(context).height *0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mealTypes.length,
          itemBuilder: (context,index){
          return _menuButton(mealTypes[index],(){
            setState(() {
              _mealTypeFilter=mealTypes[index];
            });
          });
          }
      ),
    );
 }

 Widget _menuButton(String title,VoidCallback? onClick) {
   return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0
          ),
          child: FilledButton(onPressed:onClick, child: Text(title)),
        );
 }
 Widget _recipesList(){
    return Expanded(child: FutureBuilder(
      future: DataService().getRecipes(_mealTypeFilter),
      builder: (context,snapshot) {
        if(snapshot.connectionState== ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError){
          return const Center(
            child: Text("Unable to load data."),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context,index){
            Recipe recipe= snapshot.data![index];
            return ListTile(
              contentPadding: const EdgeInsets.only(
                top: 8.0
              ),
              isThreeLine: true,
              leading: Image.network(recipe.image,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Center(child: Text('N/A'));
                } ,),
              subtitle: Text("${recipe.cuisine}\nDifficulty: ${recipe.difficulty}"),
              title: Text(recipe.name),
            trailing: Text(recipe.rating.toString(),style: const TextStyle(fontSize: 15),)
            );
          },
        );
      },)
    );
 }
}
