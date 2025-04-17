

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:themar_app_amit/core/designs/app_images.dart';


import '../../../../core/designs/app_failed.dart';
import '../../../../core/designs/app_loading.dart';
import '../../../../features/notifications/bloc.dart';

part 'components/item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final bloc = GetIt.instance<GetNotificationsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الإشعارات"),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetNotificationsFailedState) {
            return AppFailed(
              msg: state.msg,
              onPress: () {},
            );
          } else if (state is GetNotificationsSuccessState) {
            return ListView.separated(
              padding: EdgeInsets.all(16.r),
              itemBuilder: (context, index) => _Item(
                index: index,
                model: state.list[index],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: state.list.length,
            );
          } else {
            return const AppLoading();
          }
        },
      ),
    );
  }
}
