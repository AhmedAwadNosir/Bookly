import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_book_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featch_featred_books_cubit/fetchfeaturedbooks_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/fethc_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/apiServecies/api_services.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/functions/setup_service_locator.dart';
import 'package:bookly/core/utils/simple_bloc_opserver.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppConstants.kFeaturedBooksBox);
  await Hive.openBox<BookEntity>(AppConstants.knewestBooksBox);
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchfeaturedbooksCubit(
            fetchFeaturedBookUseCase:
                FetchFeaturedBookUseCase(homeRepo: getIt.get<HomeRepoImpl>()),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => FetchNewestBooksCubit(
            fetchNewestBookUseCase: FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
