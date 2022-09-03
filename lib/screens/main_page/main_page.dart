import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop_app/blocs/main_page_bloc/main_page_bloc.dart';
import 'package:online_shop_app/constants/colors.dart';
import 'package:online_shop_app/constants/typography.dart';
import 'package:online_shop_app/infrastructure/data_source/main_page_data_provider.dart';
import 'package:online_shop_app/infrastructure/repositories/main_page_repositories.dart';
import 'package:online_shop_app/screens/main_page/best_seller_widget.dart';
import 'package:online_shop_app/screens/main_page/category_widget.dart';
import 'package:online_shop_app/screens/main_page/home_store_widget.dart';
import 'package:online_shop_app/widgets/dart/circular_indicator_widget.dart';
import 'package:online_shop_app/widgets/error_text_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
      create: (ctx) => MainPageBloc(MainPageRepository(MainPageDataProvider()))
        ..add(LoadMainPageData()),
      child:
          BlocBuilder<MainPageBloc, MainPageState>(builder: (context, state) {
        if (state is MainPageError) {
          return ErrorTextWidget(text: state.message);
        }
        if (state is MainPageCompleted) {
          return Scaffold(
            backgroundColor: scaffoldColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.0.h),
                    Row(
                      children: [
                        SizedBox(width: 132.0.w),
                        SvgPicture.asset('assets/icons/main_page/location.svg',
                            height: 15.31.h, width: 12.0.w),
                        SizedBox(width: 11.0.w),
                        Text('Zihuatanejo, Gro',
                            style: markPro15and500(boldColor)),
                        SizedBox(width: 8.0.w),
                        const Icon(Icons.keyboard_arrow_down_sharp,
                            color: disableColor),
                        SizedBox(width: 76.0.w),
                        GestureDetector(
                          child: SvgPicture.asset(
                              'assets/icons/main_page/filter.svg',
                              height: 13.0.h,
                              width: 11.0.w),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0.h),
                    Row(
                      children: [
                        SizedBox(width: 17.0.w),
                        Text('Select Category',
                            style: markPro25and700(boldColor)),
                        SizedBox(width: 119.0.w),
                        TextButton(
                            onPressed: () {},
                            child: Text('view all',
                                style: markPro15and400(lightColor)))
                      ],
                    ),
                    SizedBox(height: 14.0.h),
                    SizedBox(
                      height: 94.0.h,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: state.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CategoryWidget(
                              logo: state.categories[index]['logo'],
                              title: state.categories[index]['title'],
                              hasPressed: state.categories[index]['hasPressed'],
                              onPressed: () {
                                for (int i = 0;
                                    i < state.categories.length;
                                    ++i) {
                                  if (i == index) {
                                    state.categories[i]['hasPressed'] = true;
                                  } else {
                                    state.categories[i]['hasPressed'] = false;
                                  }
                                }
                                BlocProvider.of<MainPageBloc>(context).add(
                                    ChooseCategory(
                                        model: state.model,
                                        categories: state.categories));
                              })),
                    ),
                    SizedBox(height: 25.0.h),
                    Row(
                      children: [
                        SizedBox(width: 32.0.w),
                        SizedBox(
                          height: 34.0.h,
                          width: 300.0.w,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                constraints: BoxConstraints(maxHeight: 34.0.h),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0.r),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 24.0.w),
                                  child: SvgPicture.asset(
                                      'assets/icons/main_page/search.svg',
                                      height: 16.0.h,
                                      width: 16.0.w),
                                ),
                                prefixIconConstraints:
                                    BoxConstraints(maxHeight: 16.0.h),
                                hintText: 'Search',
                                hintStyle: markPro12and400(semiBoldColor)),
                          ),
                        ),
                        SizedBox(width: 11.0.w),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: 34.0.h,
                              width: 34.0.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: lightColor),
                              alignment: Alignment.center,
                              child: const Icon(Icons.qr_code,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.0.h),
                    Row(
                      children: [
                        SizedBox(width: 17.0.w),
                        Text('Hot sales', style: markPro25and700(boldColor)),
                        SizedBox(width: 189.0.w),
                        TextButton(
                            onPressed: () {},
                            child: Text('see more',
                                style: markPro15and400(lightColor)))
                      ],
                    ),
                    CarouselSlider(
                        items: List<Widget>.generate(
                            state.model.homeStore.length,
                            (index) => HomeStoreWidget(
                                imageUrl: state.model.homeStore[index].picture,
                                isNew: state.model.homeStore[index].isNew,
                                title: state.model.homeStore[index].title,
                                subtitle: state.model.homeStore[index].subtitle,
                                isBuy: state.model.homeStore[index].isBuy)),
                        options: CarouselOptions(
                            height: 170.0.h,
                            autoPlay: false,
                            enableInfiniteScroll: false)),
                    Row(
                      children: [
                        SizedBox(width: 17.0.w),
                        Text('Best Seller', style: markPro25and700(boldColor)),
                        SizedBox(width: 178.0.w),
                        TextButton(
                            onPressed: () {},
                            child: Text('see more',
                                style: markPro15and400(lightColor)))
                      ],
                    ),
                    SizedBox(
                      height: 247.0.h,
                      child: GridView.builder(
                          itemCount: state.model.bestSeller.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => Padding(
                                padding: index.isOdd
                                    ? EdgeInsets.only(right: 14.0.w)
                                    : const EdgeInsets.only(),
                                child: BestSellerWidget(
                                    imageUrl:
                                        state.model.bestSeller[index].picture,
                                    isFavorites: state
                                        .model.bestSeller[index].isFavorites,
                                    price: state.model.bestSeller[index]
                                        .priceWithoutDiscount,
                                    discountPrice: state
                                        .model.bestSeller[index].discountPrice,
                                    title: state.model.bestSeller[index].title,
                                    onPressedFavorite: () {
                                      state.model.bestSeller[index]
                                              .isFavorites =
                                          !state.model.bestSeller[index]
                                              .isFavorites;
                                      BlocProvider.of<MainPageBloc>(context)
                                          .add(ChooseCategory(
                                              model: state.model,
                                              categories: state.categories));
                                    },
                                    onPressed: () {}),
                              )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const CircularIndicatorWidget();
      }),
    );
  }

  static const String routeName = '/main_page';
  static MaterialPageRoute route(final RouteSettings settings) =>
      MaterialPageRoute(builder: (ctx) => const MainPage());
}
