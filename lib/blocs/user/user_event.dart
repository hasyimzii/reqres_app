part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  final bool isRefresh;

  const GetUser({
    this.isRefresh = false,
  });

  @override
  List<Object> get props => [isRefresh];
}

class CreateUser extends UserEvent {
  const CreateUser({
    required this.name,
    required this.job,
  });

  final String name;
  final String job;

  @override
  List<Object> get props => [name, job];
}

class UpdateUser extends UserEvent {
  const UpdateUser({
    required this.id,
    required this.name,
    required this.job,
  });

  final int id;
  final String name;
  final String job;

  @override
  List<Object> get props => [id, name, job];
}

class DeleteUser extends UserEvent {
  const DeleteUser({
    required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];
}