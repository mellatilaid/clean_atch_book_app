import 'package:bookly/Features/home/domain/entities/product_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<ProductEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<ProductEntity>>> call([NoParam? param]) async {
    // TODO: implement call
    return await homeRepo.fetchNewestBooks();
  }
}
