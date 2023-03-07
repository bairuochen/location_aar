import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// 网络货运司机位置sdk封装
class LocationOpenApi {
  @visibleForTesting
  final methodChannel = const MethodChannel('location_aar');

  /// 初始化sdk
  Future<String?> init() async {
    String? result = await methodChannel.invokeMethod<String>('init');
    return result;
  }

  /// 授权接口
  /// param: appId 网络货运企业app的唯一标识
  /// param: appSecret 网络货运企业在省平台申请的接入安全码
  /// param: enterpriseSenderCode 网络货运企业在省平台申请的企业发送代码
  /// param: environment 环境“debug”接入测试环境，"release"接入正式环境
  Future<dynamic> auth(String appId, String appSecret,
      String enterpriseSenderCode, String environment) async {
    Map<String, dynamic> params = {
      'appId': appId,
      'appSecret': appSecret,
      'enterpriseSenderCode': enterpriseSenderCode,
      'environment': environment,
    };
    var result = await methodChannel.invokeListMethod('auth', params);
    return result;
  }

  /// 开启定位接口
  /// param: vehicleNumber 车牌号
  /// param: driverName 司机姓名
  /// param: remark 备注
  /// param: shippingNoteInfos 运单信息列表
  Future<dynamic> start(String vehicleNumber, String driverName, String remark,
      List shippingNoteInfos) async {
    Map<String, dynamic> params = {
      'vehicleNumber': vehicleNumber,
      'driverName': driverName,
      'remark': remark,
      'shippingNoteInfos': shippingNoteInfos,
    };
    var result = await methodChannel.invokeListMethod('start', params);
    return result;
  }

  /// 发送定位接口
  /// param: vehicleNumber 车牌号
  /// param: driverName 司机姓名
  /// param: remark 备注
  /// param: shippingNoteInfos 运单信息列表
  Future<dynamic> send(String vehicleNumber, String driverName, String remark,
      List shippingNoteInfos) async {
    Map<String, dynamic> params = {
      'vehicleNumber': vehicleNumber,
      'driverName': driverName,
      'remark': remark,
      'shippingNoteInfos': shippingNoteInfos,
    };
    var result = await methodChannel.invokeListMethod('send', params);
    return result;
  }

  /// 暂停定位接口
  /// param: vehicleNumber 车牌号
  /// param: driverName 司机姓名
  /// param: remark 备注
  /// param: shippingNoteInfos 运单信息列表
  Future<dynamic> pause(String vehicleNumber, String driverName, String remark,
      List shippingNoteInfos) async {
    Map<String, dynamic> params = {
      'vehicleNumber': vehicleNumber,
      'driverName': driverName,
      'remark': remark,
      'shippingNoteInfos': shippingNoteInfos,
    };
    var result = await methodChannel.invokeListMethod('pause', params);
    return result;
  }

  /// 重启定位接口
  /// param: vehicleNumber 车牌号
  /// param: driverName 司机姓名
  /// param: remark 备注
  /// param: shippingNoteInfos 运单信息列表
  Future<dynamic> restart(String vehicleNumber, String driverName,
      String remark, List shippingNoteInfos) async {
    Map<String, dynamic> params = {
      'vehicleNumber': vehicleNumber,
      'driverName': driverName,
      'remark': remark,
      'shippingNoteInfos': shippingNoteInfos,
    };
    var result = await methodChannel.invokeListMethod('restart', params);
    return result;
  }

  /// 重启定位接口
  /// param: vehicleNumber 车牌号
  /// param: driverName 司机姓名
  /// param: remark 备注
  /// param: shippingNoteInfos 运单信息列表
  Future<dynamic> stop(String vehicleNumber, String driverName, String remark,
      List shippingNoteInfos) async {
    Map<String, dynamic> params = {
      'vehicleNumber': vehicleNumber,
      'driverName': driverName,
      'remark': remark,
      'shippingNoteInfos': shippingNoteInfos,
    };
    var result = await methodChannel.invokeListMethod('stop', params);
    return result;
  }
}
