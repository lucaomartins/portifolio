
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool useVerticalLayout = constraints.maxWidth < 400.0;
          return Flex(
            children: const [
              Text("Hello"),
              Text("World"),
            ],
            direction: useVerticalLayout ? Axis.vertical : Axis.horizontal,
          );
        });
  }
}
