# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

resetPosition = ->
  console.log("adsfasdf")
  $(".area").each ->
    $(this).animate
      left: 0
      top: 0

resetDroppables = ->
  $(".resume_droppable").each ->
    $(this).droppable("enable")
    $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: null})


$ ->
  $(".area").each ->
    $(this).attr("left", $(this).offset().left)
    $(this).attr("top", $(this).offset().top)

$ ->
  $(".area").draggable
    revert: "invalid"

$ ->
  $("#btnReset").click ->
    resetPosition()
    resetDroppables()

$ ->
  $('.resume_droppable').droppable
    accept: ".area"
    hoverClass: "resume_hover"
    activeClass: "resume_dropped"
    drop: (event, ui) ->
      $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: $(ui.draggable).attr('area_id')})
      $(this).droppable('disable')
    out: (event, ui) ->
      #not used atm


$ ->
  $('#resume_droppable area_draggable').sortable



$ ->
  $('#areas').sortable
    axis: 'y'
    create: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
