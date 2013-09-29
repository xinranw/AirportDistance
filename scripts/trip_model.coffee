class TripModel
  data = {}
  originCoords = [0.0, 0.0]
  destinationCoords = [0.0, 0.0]

  @toRad : (degrees)->
    degrees * Math.PI / 180;  

  setOriginCoords : (coords)->
    this.originCoords = coords.slice()

  getOriginCoords : ()->
    return this.originCoords

  setDestinationCoords : (coords)->
    this.destinationCoords = coords.slice()

  getDestinationCoords : ()->
    return this.destinationCoords

  calculateDistance : ()->
    RADIUS = 6371 * 0.539957
    lat1 = TripModel.toRad(this.originCoords[0])
    long1 = TripModel.toRad(this.originCoords[1])
    lat2 = TripModel.toRad(this.destinationCoords[0])
    long2 = TripModel.toRad(this.destinationCoords[1])

    a = Math.sin((lat2 - lat1) / 2) * Math.sin((lat2 - lat1) / 2) + Math.sin((long2 - long1) / 2) * Math.sin((long2 - long1) / 2) * Math.cos(lat1) * Math.cos(lat2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = Math.round(RADIUS * c)

this.TripModel = TripModel