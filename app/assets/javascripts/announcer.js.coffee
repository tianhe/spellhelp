# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class SPELLHELPER.Word
  name: "word"

  url: ->
    "/announcer/words/#{@id}"

  initialize: ->

  _register_spell_check_handler: ->
    $("#spell-check").click =>
      @check_spelling()

  check_spelling: ->
    #check if input field is the same as word
    #call answer_handlers as appropriate

  _correct_answer_handler: ->
    #move on to next word

  _incorrect_answer_handler: ->
    #increment incorrect counter in list, if this word isn't previously wrong
