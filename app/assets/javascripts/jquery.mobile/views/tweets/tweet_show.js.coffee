class Mifd.Views.TweetShow extends Backbone.View
  el:"div[data-role='content']"
  template: JST['jquery.mobile/templates/tweets/show']
  events:
    "click .main-tweet-actions span.retweet":'retweet'
    "click .main-tweet-actions span.favorite":'favorite'
  initialize: ->
    #get model data
    #window.onpopstate = (e) ->
    #window.location.href = "/"
  render: ->
    #$(@el).html(@template({user:@.model.get('user'), tweet:@.model.attributes}))
  retweet: (e)->
    e.preventDefault()
    if _.isNull(@model.get('user'))
      $("#are-you-login").popup({
      }).popup("open")
    else
      window.Mifd.Util.tweetRequest(@model.get('user').screen_name, 'R', @model.get('tweet').id_str, () ->
        $(e.currentTarget).text('Retweeted').removeClass("retweet").addClass("retweeted")
      )
  favorite: (e) ->
    e.preventDefault()
    if _.isUndefined(@model.get('user'))
      $("#are-you-login").popup({
      }).popup("open")
    else
      window.Mifd.Util.tweetRequest(@model.get('user').screen_name, 'F', @model.get('tweet').id_str, () ->
        $(e.currentTarget).text('Favorited').removeClass("favorite").addClass("favorited")
      )

