// Generated by CoffeeScript 1.6.3
var data;

data = {
  "test": {
    "name": "Test Airport",
    "code": "test",
    "latitude": 35,
    "longitude": -106
  }
};

describe('ViewController', function() {
  var result, viewController;
  viewController = new ViewController();
  result = null;
  describe('when initialized without data', function() {
    return it('getData() returns an empty object', function() {
      result = viewController.getData();
      return expect($.isEmptyObject(result)).toBe(true);
    });
  });
  return describe('when data exists', function() {
    beforeEach(function() {
      viewController.setData(data);
      return result = viewController.getData();
    });
    it('getData() returns a nonempty object', function() {
      return expect($.isEmptyObject(result)).toBe(false);
    });
    return it('should store the correct file data into a json object', function() {
      expect(data["test"]["name"]).toBe("Test Airport");
      expect(data["test"]["code"]).toBe("test");
      expect(data["test"]["latitude"]).toBe(35);
      return expect(data["test"]["longitude"]).toBe(-106);
    });
  });
});
