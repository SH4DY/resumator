# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
    $(".draggable").draggable revert: "invalid"
    $(".droppable").droppable drop: (event, ui) ->
        $(this).addClass "ui-state-highlight"

$ ->
  $('#areas').sortable
    axis: 'y'
    create: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
