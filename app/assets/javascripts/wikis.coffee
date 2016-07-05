# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  converter = new showdown.Converter()

  $('#wiki_body').on 'keyup', (e) ->
    mdown = $(this).val()
    html = converter.makeHtml(mdown)
    $('#wiki-preview').html(html)
