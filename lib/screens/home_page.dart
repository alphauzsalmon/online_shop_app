import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constants/bottom_navigation_bar_items.dart';
import 'package:online_shop_app/constants/colors.dart';
import 'package:online_shop_app/screens/main_page/main_page.dart';
import '../blocs/bottom_navigation_bloc/bottom_navigation_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const MainPage(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc()
        ..add(
          const SetBottomNavigationEvent(0),
        ),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
        return Scaffold(
            body: pages[state.index],
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              elevation: 0.0,
              child: Container(
                  height: 72.0.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0.r),
                      color: boldColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<Widget>.generate(
                        items.length,
                        (index) => GestureDetector(
                              child: items[index],
                              onTap: () {
                                BlocProvider.of<BottomNavigationBloc>(context)
                                    .add(SetBottomNavigationEvent(index));
                              },
                            )),
                  )),
            ));
      }),
    );
  }

  static const String routeName = '/home_page';
  static MaterialPageRoute route(final RouteSettings settings) =>
      MaterialPageRoute(builder: (ctx) => HomePage());
}
