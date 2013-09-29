describe 'TripModel', ->
  trip = null

  beforeEach ->
    trip = new TripModel()

  it 'can convert degrees to radians', ->
    result = TripModel.toRad(90).toFixed(2)
    expect(result).toBe '1.57'

  it 'should set and get origin coords', ->
    trip.setOriginCoords([1, 2])
    expect(trip.getOriginCoords()[0]).toBe 1
    expect(trip.getOriginCoords()[1]).toBe 2

  it 'should set and get destination', ->
    trip.setDestinationCoords([1,2])
    expect(trip.getDestinationCoords()[0]).toBe 1
    expect(trip.getDestinationCoords()[1]).toBe 2

  it 'should calculate the distance between two Geographic Coordinates', ->
    # result = trip.calculateDistance([35, -106], [38, -76])
    trip.setOriginCoords([35, -106])
    trip.setDestinationCoords([38, -76])
    result = trip.calculateDistance()
    expect(result).toBe 1453

  # it("should be able to play a Song", function() {
  #   player.play(song);
  #   expect(player.currentlyPlayingSong).toEqual(song);

  #   //demonstrates use of custom matcher
  #   expect(player).toBePlaying(song);
  # });

  # describe("when song has been paused", function() {
  #   beforeEach(function() {
  #     player.play(song);
  #     player.pause();
  #   });

  #   it("should indicate that the song is currently paused", function() {
  #     expect(player.isPlaying).toBeFalsy();

  #     // demonstrates use of 'not' with a custom matcher
  #     expect(player).not.toBePlaying(song);
  #   });

  #   it("should be possible to resume", function() {
  #     player.resume();
  #     expect(player.isPlaying).toBeTruthy();
  #     expect(player.currentlyPlayingSong).toEqual(song);
  #   });
  # });

  # // demonstrates use of spies to intercept and test method calls
  # it("tells the current song if the user has made it a favorite", function() {
  #   spyOn(song, 'persistFavoriteStatus');

  #   player.play(song);
  #   player.makeFavorite();

  #   expect(song.persistFavoriteStatus).toHaveBeenCalledWith(true);
  # });

  # //demonstrates use of expected exceptions
  # describe("#resume", function() {
  #   it("should throw an exception if song is already playing", function() {
  #     player.play(song);

  #     expect(function() {
  #       player.resume();
  #     }).toThrow("song is already playing");
  #   });
  # });