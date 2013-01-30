library descriptive_array;

class DescriptiveElement{
  static int CountOfAllElements;
  static bool isWithinGlobalBoundaries(DescriptiveElement e)=>e.countOfOccurrencesInArray < CountOfAllElements;

  bool isWithinBoundaries()=> isWithinGlobalBoundaries(this);

  int index;
  int countOfOccurrencesInArray;

  bool get isDescriptive{
    return _actualCount == countOfOccurrencesInArray;
  }

  bool get canBecomeDescriptiveElement{
    return _actualCount <= countOfOccurrencesInArray;
  }

  int _actualCount;
  int get actualCount{
    return _actualCount;
  }

  void addOne(){
    _actualCount++;
  }

  bool get pointsToSelf{
    return countOfOccurrencesInArray == index;
  }

  DescriptiveElement(this.index, this.countOfOccurrencesInArray){
    _actualCount=0;
  }
}

class ArrayEvaluator{
  List<int> numbers;
  ArrayEvaluator(this.numbers){
  }

  List<DescriptiveElement> buildElements(List<int> numbers){
    int index = 0;
    return numbers.mappedBy((int number)=>new DescriptiveElement(index++, number)).toList();
  }

  bool get isSelfDescribingArray{
    List<DescriptiveElement> elements = buildElements(numbers);
    DescriptiveElement.CountOfAllElements = elements.length;
    for(DescriptiveElement e in elements){
      if(!e.isWithinBoundaries()){
        return false;
      }
      DescriptiveElement other = elements[e.countOfOccurrencesInArray];
      other.addOne();
      if(!other.canBecomeDescriptiveElement){
        return false;
      }
    }
    return elements.every((v)=> v.isDescriptive);
  }

}
