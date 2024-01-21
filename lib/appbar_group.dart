import 'package:flutter/material.dart';

class AppBarGroup
{
  static AppBar homeAppBar(BuildContext context)
  {
    return AppBar
    (
          title: const Text('Regressify'),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            Container(margin: const EdgeInsets.only(right: 3.5), child: IconButton(onPressed: (){}, icon: const Icon(Icons.help_outline)))
          ],
    );
  }

  static AppBar infoAppBar(BuildContext context, String title)
  {
    return AppBar
    (
        title: Text(title),
        leading: const BackButton(),
    );
  }
}