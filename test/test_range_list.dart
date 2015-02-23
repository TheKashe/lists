import "package:lists/lists.dart";
import "package:unittest/unittest.dart";

void main() {
  testAdd();
  testContains();
  testIncludes();
  testIntersect();
  testIntersection();
  testIterable();
  testrng();
  testReversed();
  testSubtract();
}

void testAdd() {
  var result = rng(0, 1) + rng(1, 2);
  expect(result, [0, 1, 2], reason: "RangeList.add");
  result = rng(0, 1) + rng(2, 3);
  expect(result, [0, 1, 2, 3], reason: "RangeList.add");
  result = rng(0, 1) + rng(0, 1);
  expect(result, [0, 1], reason: "RangeList.add");
  result = rng(0, 1) + rng(0, 0);
  expect(result, [0, 1], reason: "RangeList.add");
}

void testContains() {
  var result = rng(0, 5).contains(5);
  expect(result, true, reason: "RangeList.contains");
  result = rng(0, 5).contains(6);
  expect(result, false, reason: "RangeList.contains");
}

void testIncludes() {
  var result = rng(0, 5).includes(rng(0, 5));
  expect(result, true, reason: "RangeList.includes");
  result = rng(0, 5).includes(rng(1, 5));
  expect(result, true, reason: "RangeList.includes");
  result = rng(0, 5).includes(rng(0, 6));
  expect(result, false, reason: "RangeList.includes");
  result = rng(1, 5).includes(rng(0, 5));
  expect(result, false, reason: "RangeList.includes");
}

void testIntersect() {
  var result = rng(0, 5).intersect(rng(0, 5));
  expect(result, true, reason: "RangeList.intersect");
  result = rng(0, 5).intersect(rng(1, 5));
  expect(result, true, reason: "RangeList.intersect");
  result = rng(0, 5).intersect(rng(0, 6));
  expect(result, true, reason: "RangeList.intersect");
  result = rng(1, 5).intersect(rng(0, 5));
  expect(result, true, reason: "RangeList.intersect");
  result = rng(1, 5).intersect(rng(6, 7));
  expect(result, false, reason: "RangeList.intersect");
  result = rng(1, 5).intersect(rng(0, 0));
  expect(result, false, reason: "RangeList.intersect");
}

void testIntersection() {
  var result = rng(0, 2).intersection(rng(0, 2));
  expect(result, [0, 1, 2], reason: "RangeList.intersection");
  result = rng(0, 2).intersection(rng(0, 0));
  expect(result, [0], reason: "RangeList.intersection");
  result = rng(0, 2).intersection(rng(0, 1));
  expect(result, [0, 1], reason: "RangeList.intersection");
  result = rng(1, 2).intersection(rng(0, 2));
  expect(result, [1, 2], reason: "RangeList.intersection");
  result = rng(1, 2).intersection(rng(2, 3));
  expect(result, [2], reason: "RangeList.intersection");
}

void testIterable() {
  var result = rng(0, 5);
  expect(result is Iterable<int>, true, reason: "RangeList is Iterable<int>");
  var length = result.length;
  var i = result.start;
  for (var value in result) {
    expect(value, i++, reason: "RangeList.current");
  }
}

void testrng() {
  var result = rng(0, 5);
  expect(result is List<int>, true, reason: "RangeList is List<int>");
  var length = result.length;
  for (var i = 0; i < length; i++) {
    expect(result[i], i, reason: "RangeList[$i]");
  }
}

void testReversed() {
  var result = rng(-1, 1).reversed;
  expect(result, [1, 0, -1], reason: "RangeList.reversed");
}

void testSubtract() {
  var result = rng(0, 5).subtract(rng(2, 4));
  expect(result, [[0, 1], [5]], reason: "RangeList.subtract");
  result = rng(0, 5).subtract(rng(0, 5));
  expect(result, [], reason: "RangeList.subtract");
  result = rng(2, 7).subtract(rng(1, 4));
  expect(result, [[5, 6, 7]], reason: "RangeList.subtract");
  result = rng(2, 7).subtract(rng(4, 9));
  expect(result, [[2, 3]], reason: "RangeList.subtract");
}

RangeList rng(int start, int end) {
  return new RangeList(start, end);
}