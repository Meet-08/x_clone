import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:x_clone/features/auth/data/datasources/session_local_data_source.dart';
import 'package:x_clone/features/auth/data/repository/mock_auth_repository.dart';
import 'package:x_clone/features/auth/domain/repository/auth_repository.dart';
import 'package:x_clone/features/auth/domain/service/user_session_service.dart';
import 'package:x_clone/features/auth/domain/usecase/login_use_case.dart';
import 'package:x_clone/features/auth/domain/usecase/register_use_case.dart';
import 'package:x_clone/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:x_clone/features/auth/presentation/bloc/register_bloc/register_bloc.dart';

part 'init_dependency.main.dart';
