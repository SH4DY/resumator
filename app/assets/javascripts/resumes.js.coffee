# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".area").each ->
    console.log "MOVE"
    $(this).attr("left", $(this).offset().left)
    $(this).attr("top", $(this).offset().top)

$ ->
  $(".area").draggable
    revert: "invalid"

$ ->
  $("#btnReset").click ->
    $(".area").each ->
      $(this).css("left", 0)
      $(this).css("top", 0)

$ ->
  $('.resume_droppable').droppable
    accept: ".area"
    hoverClass: "resume_hover"
    activeClass: "resume_dropped"
    drop: (event, ui) ->
      $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: $(ui.draggable).attr('area_id')})
      $(this).droppable('disable')
    out: (event, ui) ->
      $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: $(ui.draggable).attr('area_id')})
      $(this).droppable('enable')


$ ->
  $('#resume_droppable area_draggable').sortable



$ ->
  $('#areas').sortable
    axis: 'y'
    create: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
