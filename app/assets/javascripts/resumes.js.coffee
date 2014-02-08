# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> #The right sided areas to be dropped on the resume
  $(".area").draggable
    revert: "invalid"

$ -> #Position back all the areas to orig.pos. and update the model
  $("#btnReset").click ->
    resetPositions()
    resetDroppables()

$ ->
  $('.resume_droppable').droppable
    accept: ".area"
    hoverClass: "resume_hover"
    drop: (event, ui) ->
      ui.draggable.addClass("dropped-area")
      ui.draggable.attr("coming-from-droppable", $(this).attr("id"))
      $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: $(ui.draggable).attr('area_id')})
      $(this).droppable('disable')

$ -> #This has to be droppable too: To remove single areas from resume
  $("#areas").droppable
    accept: ".dropped-area"
    drop: (event, ui) ->
      ui.draggable.removeClass("dropped-area")
      resetPositions(ui.draggable)
      resetDroppable($("#" + ui.draggable.attr("coming-from-droppable")))
#Helper methods
resetPositions = ($item) ->
  console.log("ITEM ": $item)
  selector = ""
  if($item == undefined)
    selector = ".area"
  else
    selector = $item
  $(selector).each ->
    $(this).animate
      left: 0
      top: 0



resetDroppables = ->
  $(".resume_droppable").each ->
    $(this).droppable("enable")
    $.post($(this).data('update-url'), {position: $(this).attr('id'), area_id: null})

resetDroppable = ($item)->
  console.log($item)
  $item.droppable("enable")
  $.post($item.data('update-url'), {position: $item.attr('id'), area_id: null})

