import 'package:assignment/api/api_service.dart';
import 'package:assignment/bloc/homepage_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Create a mock ApiService
class MockApiService extends Mock implements ApiService {}

void main() {
  group('HomepageBloc', () {
    late HomepageBloc homepageBloc;
    late MockApiService mockApiService;

    setUp(() {
      mockApiService = MockApiService();
      homepageBloc = HomepageBloc(mockApiService);
    });

    tearDown(() {
      homepageBloc.close();
    });

    test('initial state is HomepageLoadingState', () {
      expect(homepageBloc.state, isA<HomepageLoadingState>());
    });

    blocTest<HomepageBloc, HomepageState>(
      'emits [HomepageLoadingState, HomepageLoadedState] when LoadHomepageEvent is added and API call is successful',
      build: () {
        // Mock a successful API response
        when(mockApiService.getHomepageData()).thenAnswer((_) async {
          return Response(
            requestOptions: RequestOptions(path: '/homepage_dynamic'),
            data: [
              {'type': 'category_list', 'data': []},
              {'type': 'product_list', 'data': []}
            ],
            statusCode: 200,
          );
        });
        return homepageBloc;
      },
      act: (bloc) => bloc.add(LoadHomepageEvent()),
      expect: () => [
        isA<HomepageLoadingState>(),
        isA<HomepageLoadedState>(),
      ],
      verify: (_) async {
        // Verify that getHomepageData was called once
        verify(mockApiService.getHomepageData()).called(1);
      },
    );

    blocTest<HomepageBloc, HomepageState>(
      'emits [HomepageLoadingState, HomepageErrorState] when LoadHomepageEvent is added and API call fails',
      build: () {
        // Mock a failed API response (e.g., 401 error)
        when(mockApiService.getHomepageData()).thenThrow(DioException(
          requestOptions: RequestOptions(path: '/homepage_dynamic'),
          type: DioExceptionType.badResponse,
          response: Response(requestOptions: RequestOptions(path: '/homepage_dynamic'), statusCode: 401),
        ));
        return homepageBloc;
      },
      act: (bloc) => bloc.add(LoadHomepageEvent()),
      expect: () => [
        isA<HomepageLoadingState>(),
        isA<HomepageErrorState>(),
      ],
      verify: (_) async {
        // Verify that getHomepageData was called once
        verify(mockApiService.getHomepageData()).called(1);
      },
    );
  });
}