class NetworkResponseModel{
  final bool status;
  final String? message;
  dynamic data;

  NetworkResponseModel({required this.status, this.message, this.data});
}