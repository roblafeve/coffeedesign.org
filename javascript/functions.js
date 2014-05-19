(function() {
  document.addEventListener("touchstart", (function() {}), true);

  $(function() {
    var lastId, menuItems, scrollItems, topMenu, topMenuHeight;
    $("a#nav-toggle").click(function() {
      $(".navigation, a#nav-toggle").toggleClass("open");
      return false;
    });
    $(".navigation a, a.layout-header-logo").click(function() {
      if ($("a#nav-toggle").hasClass("open")) {
        $(".navigation, a#nav-toggle").toggleClass("open");
      }
      return false;
    });
    $("a.layout-header-logo").click(function() {
      var target;
      if (location.pathname.replace(/^\//, "") === this.pathname.replace(/^\//, "") && location.hostname === this.hostname) {
        target = $(this.hash);
        target = (target.length ? target : $("[name=" + this.hash.slice(1) + "]"));
        if (target.length) {
          $("html,body").animate({
            scrollTop: target.offset().top
          }, 500);
          return false;
        }
      }
    });
    lastId = void 0;
    topMenu = $(".navigation, a.layout-header-logo");
    topMenuHeight = topMenu.outerHeight();
    menuItems = topMenu.find("a");
    scrollItems = menuItems.map(function() {
      var item;
      item = $($(this).attr("href"));
      if (item.length) {
        return item;
      }
    });
    menuItems.click(function(e) {
      var href, offsetTop;
      href = $(this).attr("href");
      offsetTop = (href === "#" ? 0 : $(href).offset().top + 1);
      $("html, body").stop().animate({
        scrollTop: offsetTop
      }, 500);
      return false;
    });
    return $(window).scroll(function() {
      var cur, fromTop, id;
      fromTop = $(this).scrollTop() + topMenuHeight;
      cur = scrollItems.map(function() {
        if ($(this).offset().top < fromTop) {
          return this;
        }
      });
      cur = cur[cur.length - 1];
      id = (cur && cur.length ? cur[0].id : "");
      if (lastId !== id) {
        lastId = id;
        return menuItems.removeClass("active").filter("[href=#" + id + "]").addClass("active");
      }
    });
  });

}).call(this);
