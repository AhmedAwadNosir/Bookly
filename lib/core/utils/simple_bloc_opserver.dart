import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('🟢 Created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // log('🔄 Changed in ${bloc.runtimeType}:');
    // log('   Current State: ${change.currentState}');
    // log('   Next State:    ${change.nextState}');
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    log('🔴 Closed: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
