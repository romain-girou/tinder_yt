import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'setup_data_event.dart';
part 'setup_data_state.dart';

class SetupDataBloc extends Bloc<SetupDataEvent, SetupDataState> {
  UserRepository userRepository;

  SetupDataBloc(this.userRepository) : super(SetupDataInitial()) {
    on<SetupRequired>((event, emit) async {
      emit(SetupDataLoading());
      try {
        MyUser updatedUser = await userRepository.userSetup(event.myUser);
        emit(SetupDataSuccess(updatedUser));
      } catch (e) {
        emit(SetupDataFailure());
      }
    });
  }
}
