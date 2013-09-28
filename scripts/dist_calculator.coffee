class DistCalculator

  @toRad : (degrees)->
    degrees * Math.PI / 180;

  calculateDistance : (coord1, coord2)->
    RADIUS = 6371
    lat1 = DistCalculator.toRad(coord1[0])
    long1 = DistCalculator.toRad(coord1[1])
    lat2 = DistCalculator.toRad(coord2[0])
    long2 = DistCalculator.toRad(coord2[1])

    a = Math.sin((lat2 - lat1) / 2) * Math.sin((lat2 - lat1) / 2) + Math.sin((long2 - long1) / 2) * Math.sin((long2 - long1) / 2) * Math.cos(lat1) * Math.cos(lat2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    debugger
    d = Math.round(RADIUS * c)

this.DistCalculator = DistCalculator