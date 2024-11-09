import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/product_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<ProductEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<ProductEntity>>> call([NoParam? param]) async {
    // TODO: implement call
    return await homeRepo.fetchFeaturedBooks();
  }
}
