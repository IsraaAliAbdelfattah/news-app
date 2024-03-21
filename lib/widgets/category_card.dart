import 'package:flutter/material.dart';
import 'package:news_app/componant/category_model.dart';
import 'package:news_app/views/category_view.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryModel,
  });
final  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context) {
             return CategoryView(
               category: categoryModel.text,
             );
            },
            ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(categoryModel.photo),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  categoryModel.text,
                  style:const  TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
