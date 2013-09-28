// Generated by CoffeeScript 1.6.3
describe('Player', function() {
  var calc;
  calc = null;
  beforeEach(function() {
    return calc = new DistCalculator();
  });
  it('can convert degrees to radians', function() {
    var result;
    result = DistCalculator.toRad(90).toFixed(2);
    return expect(result).toBe('1.57');
  });
  return it('should calculate the distance between two Geographic Coordinates', function() {
    var result;
    result = calc.calculateDistance([35, -106], [38, -76]);
    return expect(result).toBe(2690);
  });
});
