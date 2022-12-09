import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user.dart';
import '../../models/job.dart';
import '../../services/user_api.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    User user;
    Job job;

    on<GetUser>((event, emit) async {
      try {
        if (state is UserInitial || event.isRefresh) {
          user = await UserApi.getUser(
            page: 1,
            perPage: 8,
          );

          emit(UserLoaded(
            user: user.data,
            reachedMax: false,
          ));
        } else {
          UserLoaded userLoaded = state as UserLoaded;
          if (userLoaded.reachedMax) return;

          user = await UserApi.getUser(
            page: userLoaded.page + 1,
            perPage: 8,
          );

          if (user.data.isEmpty) {
            emit(userLoaded.copyWith(
              reachedMax: true,
            ));
          } else {
            emit(UserLoaded(
              page: userLoaded.page + 1,
              user: List.of(userLoaded.user)..addAll(user.data),
              reachedMax: false,
            ));
          }
        }
      } catch (e) {
        emit(UserError(
          message: e.toString(),
        ));
      }
    });

    on<CreateUser>((event, emit) async {
      try {
        emit(UserLoading());

        Map<String, dynamic> data = {
          'name': event.name,
          'job': event.job,
        };
        job = await UserApi.createUser(data: data);

        emit(UserCreated(
          message: 'User ${job.name}, ${job.name} created!',
        ));
      } catch (e) {
        emit(UserError(
          message: e.toString(),
        ));
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        emit(UserLoading());

        Map<String, dynamic> data = {
          'name': event.name,
          'job': event.job,
        };
        job = await UserApi.updateUser(id: event.id, data: data);

        emit(UserUpdated(
          message: 'User ${job.name}, ${job.name} updated!',
        ));
      } catch (e) {
        emit(UserError(
          message: e.toString(),
        ));
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        emit(UserLoading());

        job = await UserApi.deleteUser(id: event.id);

        emit(const UserUpdated(
          message: 'User deleted!',
        ));
      } catch (e) {
        emit(UserError(
          message: e.toString(),
        ));
      }
    });
  }
}
