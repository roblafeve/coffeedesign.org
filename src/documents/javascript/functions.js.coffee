document.addEventListener "touchstart", (->
), true

$ ->

  $("a#nav-toggle").click ->
    $(".navigation, a#nav-toggle").toggleClass("open")
    false

  $(".navigation a, a.layout-header-logo").click ->
    if $("a#nav-toggle").hasClass("open")
      $(".navigation, a#nav-toggle").toggleClass("open")
    false

  $("a.layout-header-logo").click ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top
        , 500
        false

  # Cache selectors
  lastId = undefined
  topMenu = $(".navigation, a.layout-header-logo")
  topMenuHeight = topMenu.outerHeight()

  # All list items
  menuItems = topMenu.find("a")

  # Anchors corresponding to menu items
  scrollItems = menuItems.map(->
    item = $($(this).attr("href"))
    item  if item.length
  )

  # Bind click handler to menu items
  # so we can get a fancy scroll animation
  menuItems.click (e) ->
    href = $(this).attr("href")
    offsetTop = (if href is "#" then 0 else $(href).offset().top + 1)
    $("html, body").stop().animate
      scrollTop: offsetTop
    , 500
    false


  # Bind to scroll
  $(window).scroll ->
    
    # Get container scroll position
    fromTop = $(this).scrollTop() + topMenuHeight
    
    # Get id of current scroll item
    cur = scrollItems.map(->
      this  if $(this).offset().top < fromTop
    )
    
    # Get the id of the current element
    cur = cur[cur.length - 1]
    id = (if cur and cur.length then cur[0].id else "")
    if lastId isnt id
      lastId = id
      
      # Set/remove active class
      menuItems.removeClass("active").filter("[href=#" + id + "]").addClass "active"
