# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(".area").draggable revert: "invalid"
  $(".droppable").droppable drop: (event, ui) ->
    $(this).addClass "ui-state-highlight"

$ ->
  $('.resume_droppable').droppable
    accept: ".area"
    hoverClass: "ui-state-hover"
    drop: (event, ui) ->
      $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: $(ui.draggable).attr('area_id')})


$ ->
  $('#resume_droppable area_draggable').sortable



$ ->
  $('#areas').sortable
    axis: 'y'
    create: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
