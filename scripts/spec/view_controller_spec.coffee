data = {"test":{"name":"Test Airport","code":"test","latitude":35,"longitude":-106}}
       # {"ABQ":{"name":"Test Airport","code":"test","latitude":35,"longitude":-106}}

describe 'ViewController', ->
  viewController = new ViewController()
  result = null

  it 'should setTripCoords()', ->
    trip = new TripModel()
    viewController.setTripCoords([0,1], [2,3], trip)
    expect(trip.getOriginCoords()[0]).toBe 0
    expect(trip.getOriginCoords()[1]).toBe 1
    expect(trip.getDestinationCoords()[0]).toBe 2
    expect(trip.getDestinationCoords()[1]).toBe 3

  describe 'when initialized without data', ->
    it 'getData() returns an empty object', ->
      result = viewController.getData()
      expect($.isEmptyObject(result)).toBe true

  describe 'when data exists', ->
    beforeEach ->
      viewController.setData(data)
      result = viewController.getData()

    it 'getData() returns a nonempty object', ->
      expect($.isEmptyObject(result)).toBe false

    it 'should store the correct file data into a json object', ->
      expect(data["test"]["name"]).toBe "Test Airport"
      expect(data["test"]["code"]).toBe "test"
      expect(data["test"]["latitude"]).toBe 35
      expect(data["test"]["longitude"]).toBe -106

    it 'should getCoords()', ->
      coords = viewController.getCoords("test")
      expect(coords[0]).toBe 35
      expect(coords[1]).toBe -106



      
