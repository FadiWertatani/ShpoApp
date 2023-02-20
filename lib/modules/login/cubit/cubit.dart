import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/shared/component/component.dart';
import 'package:shop_app/shared/network/end_point.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialStates());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({
    required email,
    required pwd,
  }) {
    emit(ShopLoginLoadingStates());
    DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': pwd,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(value);
      emit(ShopLoginSuccessStates());
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data.token);
    }).catchError((error) {
      emit(ShopLoginErrorStates(error.toString()));
      print("EROOOOOOOR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPwd = true;

  void changePwdVisibility() {
    isPwd = !isPwd;

    suffix = isPwd ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangePwdVisibilityStates());
  }
}
