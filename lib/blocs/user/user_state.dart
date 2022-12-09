part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  const UserLoaded({
    this.page = 1,
    this.user = const <UserData>[],
    this.reachedMax = false,
  });

  final int page;
  final List<UserData> user;
  final bool reachedMax;

  UserLoaded copyWith({
    List<UserData>? user,
    bool? reachedMax,
  }) {
    return UserLoaded(
      user: user ?? this.user,
      reachedMax: reachedMax ?? this.reachedMax,
    );
  }

  @override
  List<Object> get props => [user, reachedMax];
}

class UserCreated extends UserState {
  const UserCreated({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class UserUpdated extends UserState {
  const UserUpdated({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class UserDeleted extends UserState {
  const UserDeleted({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class UserError extends UserState {
  const UserError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
