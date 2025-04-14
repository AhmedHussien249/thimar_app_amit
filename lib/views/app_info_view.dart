import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get_it/get_it.dart';

import '../features/app_info/bloc.dart';

class AppInfoView extends StatefulWidget {
  const AppInfoView({super.key});

  @override
  State<AppInfoView> createState() => _AppInfoViewState();
}

class _AppInfoViewState extends State<AppInfoView> {
  final cubit = GetIt.instance<AppInfoBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppInfo"),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is GetAppInfoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAppInfoFailedState) {
            return Text(state.msg);
          } else if (state is GetAppInfoSuccessState) {
            return HtmlWidget(state.model.terms);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
