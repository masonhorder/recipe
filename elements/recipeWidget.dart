import 'package:flutter/material.dart';
import 'package:recipes/models/assigningRecipe.dart';
import 'package:recipes/screens/viewRecipe.dart';
import 'package:recipes/services/database.dart';
import 'package:recipes/style/style.dart';
RecipesWidget(
  BuildContext context,
  String recipeTitle,
  String servings,
  String prepTime,
  int upvotesNumber,
  String image,
  String id,
  StateSetter setState,
) {

  return Container(
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12), 
      boxShadow: [
         BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 10,
          blurRadius: 5,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    padding: EdgeInsets.all(15),
    height: 265,
    width: 320,
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewRecipe()),
            );
            AssignedRecipe.id = id;
          },
          child: Container(
            child: Column(
              children: [
                Text(
                  recipeTitle,
                  style: basicBlackBold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Servings: " + servings,
                      style: basicBlack,
                    ),
                    Text("Prep Time: " + prepTime, style: basicBlack),
                  ],
                ),
                Image.network(image, height: 117,),
              ],
            )
          )
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
          
            children: [
              
              IconButton(
                icon: Icon(Icons.arrow_upward, color: Colors.black.withOpacity(0.7)),
                iconSize: 35,
                onPressed: () => vote(id, upvotesNumber+1),
              ),
              Text(upvotesNumber.toString(), style: basicSmallBlack),
              IconButton(
                icon: Icon(Icons.arrow_downward, color: Colors.black.withOpacity(0.7)),
                iconSize: 35,
                onPressed: () => vote(id, upvotesNumber-1),
              ),
              
              
              Spacer(flex: 7),
              Icon(Icons.star, color: Colors.black.withOpacity(0.7)),
                
            ]
          ),
        ),
      ]
    )
  );
}