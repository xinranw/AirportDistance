class ViewController
  data = {}

  constructor : (file_location)->
    $.getJSON(file_location, (data)=>
      _this.data = data
      )

  @updateDistance : (dom_elem, value)->
    dom_elem.text(value + " km")

  getCoords : (code)->
    coords = []
    coords[0] = data[code]["lat"]
    coords[1] = data[code]["long"]
    return coords

  getData : ()->
    return this.data

  setData : (json)->
    this.data = json

this.ViewController = ViewController