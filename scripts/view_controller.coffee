class ViewController
  data = {}
  keys = []

  loadData : (file_location, fun)->
    if !file_location?
      console.log('no file location specified')
      return
    $.getJSON(file_location, (data)=>
      console.log('success')
      _this.data = data
      _this.keys = Object.keys(data)
      if !fun?
        console.log('no callback function specified')
        return
      fun()
    ).error(()->
      console.log('error')
    )


  @updateDistance : (dom_elem, value)->
    dom_elem.text(value)

  getInputValue : (dom_elem)->
    return $(dom_elem).val()

  setTripCoords : (origin, destination, trip_model)->
    trip_model.setOriginCoords(origin)
    trip_model.setDestinationCoords(destination)

  getCoords : (code)->
    coords = []
    coords[0] = this.data[code]["latitude"]
    coords[1] = this.data[code]["longitude"]
    return coords

  getData : ()->
    return this.data

  setData : (json)->
    this.data = $.extend(true, {}, json)

  getKeys : ()->
    return this.keys

  initializeMap : (coords1, coords2, dom_elem)->
    directionsService = new google.maps.DirectionsService()
    directionsDisplay = new google.maps.DirectionsRenderer()
    directionsRequest = {
      origin: new google.maps.LatLng(coords1[0], coords1[1]),
      destination: new google.maps.LatLng(coords2[0], coords2[1]),
      travelMode: google.maps.TravelMode.DRIVING
    }


    mapOptions = {
      center: new google.maps.LatLng((coords1[0] + coords2[0])/ 2,(coords1[1] + coords2[1])/ 2),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(dom_elem[0], mapOptions)
    directionsDisplay.setMap(map)
    directionsService.route(directionsRequest, (result, status)->
      if (status == google.maps.DirectionsStatus.OK)
        directionsDisplay.setDirections(result)
      )



this.ViewController = ViewController