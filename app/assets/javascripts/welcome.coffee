# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

getUrl = ()->
  $('#url').val()

validateUrl = (string) ->
  /(http\:\/\/|https\:\/\/)?([a-z0-9][a-z0-9\-]*\.)+[a-z0-9][a-z0-9\-]*$/.test(string)

activateButton= (statement) ->
  errorMessage = "<p style='z-index:999;color:red'> This link is not valid! must be like
        google.co.uk </p>"
  if statement == true
    $('button').removeProp("disabled")
    $('#info').html("")
  else
    $('#info').html(errorMessage)
    $('button').prop("disabled", true)

validateInput = ->
  $('#url').keyup( ->
    if validateUrl(getUrl())
      activateButton(true)
    else
      activateButton(false)
  )

$(document).ready ->
  validateInput()
  $('button').on("click",->
    $.ajax(url: "/welcome/shorten_url/?url=" + getUrl(), method: "post").done((data) ->
      $("#results ul").append('
      <li><a href=/'+data.short_url+'>'+data.short_url+'</a></li>')))
