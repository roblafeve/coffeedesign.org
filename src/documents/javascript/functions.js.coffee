document.addEventListener "touchstart", (->
), true

$ ->

  $("a#nav-toggle").click ->
    $(".navigation.sub-mobile, a#nav-toggle").toggleClass("open")
    false

  $(".navigation.sub-mobile a, .layout-header-logo a").click ->
    if $("a#nav-toggle").hasClass("open")
      $(".navigation.sub-mobile, a#nav-toggle").toggleClass("open")
    false

  $("a[href*=#]:not([href=#])").click ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top
        , 500
        false