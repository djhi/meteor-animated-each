@Stuff = new Meteor.Collection("stuff")

if Meteor.isClient
  Template.list.events
    "submit form": (e, t) ->
      e.preventDefault();

      num = t.find("input[type=number]").valueAsNumber
      Stuff.insert(num: num)
    "click .delete": (e, t) ->
      Stuff.remove(this._id)

  Template.list.stuff = ->
    Stuff.find({}, sort: {num: 1})

  Template.list.rendered = ->
    AnimatedEach.attachHooks(this.find(".each-parent"))