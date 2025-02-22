import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{}

class InternetFailure extends Failures{
  @override
  
  List<Object?> get props => [];
}

class ServerFailure extends Failures{
  @override
  
  List<Object?> get props => [];
}