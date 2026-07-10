import 'package:bookly/Features/home/presentation/manager/featch_featred_books_cubit/fetchfeaturedbooks_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/core/utils/functions/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchfeaturedbooksCubit, FetchfeaturedbooksState>(
      listener: (context, state) {
        if (state is FetchfeaturedbooksFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FetchfeaturedbooksSuccess) {
          return FeaturedBooksListView(
            books: state.books,
          );
        } else if (state is FetchfeaturedbooksFailure) {
          return SizedBox();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
