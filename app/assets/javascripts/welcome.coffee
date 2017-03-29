# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('button').on("click",->
    url = $('#url').val()
    $.ajax(url: "/welcome/shorten_url/?url=" + url, method: "post").done((data) ->
      $("#results ul").append('
      <li><a href=/'+data.short_url+'>'+data.short_url+'</a></li>')))
