// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe? recipe;
  const RecipeThumbnail({Key? key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: ClipRRect(
                  child: Image.asset('${recipe!.dishImage}', fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12))),
          const SizedBox(height: 10),
          Text(recipe!.title.toString(),
              maxLines: 1, style: Theme.of(context).textTheme.bodyText1),
          Text(recipe!.duration.toString(),
              style: Theme.of(context).textTheme.bodyText1)
        ]));
  }
}
