import 'package:unittest/unittest.dart';
import 'package:descriptive_array/descriptive_array.dart';

void main() {
  group("descriptive_array()", () {

    group("parses a list as true", () {
      test("when list is empty", () {
        ArrayEvaluator e = new ArrayEvaluator([]);
        expect(e.isSelfDescribingArray,isTrue);
        //expect(range(0, 4)[0], equals(0));
      });

      test("when list is ", () {
        ArrayEvaluator e = new ArrayEvaluator([6, 2, 1, 0, 0, 0, 1, 0, 0, 0]);
        expect(e.isSelfDescribingArray,isTrue);
      });

      test("or when list is ", () {
        ArrayEvaluator e = new ArrayEvaluator([13, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0]);
        expect(e.isSelfDescribingArray,isTrue);
      });

    });

    group("parses as false", () {
      test("when first element is zero and length is one", () {
        ArrayEvaluator e = new ArrayEvaluator([0]);
        expect(e.isSelfDescribingArray,isFalse);
      });
      test("when list is ", () {
        ArrayEvaluator e = new ArrayEvaluator([6, 2, 1, 0, 0, 0, 1, 0, 0, 20]);
        expect(e.isSelfDescribingArray,isFalse);
      });
    });


    group("throws an exception when", () {
      test("start > stop", () {
        //expect(() => range(5, 2), throwsA(new isInstanceOf<ArgumentError>()));
      });

    });
  });
}
