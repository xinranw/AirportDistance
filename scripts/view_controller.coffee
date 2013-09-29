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
    dom_elem.text(value + " nmi")

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

this.ViewController = ViewController