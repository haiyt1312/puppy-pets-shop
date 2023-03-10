$(window).on("scroll", function () {
  $(this).scrollTop() > 130
    ? $(".navbar-part").addClass("navbar-fixed")
    : $(".navbar-part").removeClass("navbar-fixed");
}),
  $(".cart-icon").on("click", function () {
    $(".cart-popup").addClass("active"),
      $(".cross-btn").on("click", function () {
        $(".cart-popup").removeClass("active");
      });
  }),
  $(".wish-icon").on("click", function () {
    $(".wish-popup").addClass("active"),
      $(".cross-btn").on("click", function () {
        $(".wish-popup").removeClass("active");
      });
  }),
  $(".menu-bar").on("click", function () {
    $(".navbar-slide").addClass("active"),
      $(".cross-btn").on("click", function () {
        $(".navbar-slide").removeClass("active");
      });
  }),
  $(function () {
    $(".navbar-dropdown a").click(function () {
      $(this).next().toggle(),
        $(".dropdown-list:visible").length > 1 &&
          ($(".dropdown-list:visible").hide(), $(this).next().show());
    });
  }),
  $(".grid-hori").on("click", function () {
    $(".grid-hori").addClass("active"),
      $(".grid-verti").removeClass("active"),
      $(".grid-verti").on("click", function () {
        $(".grid-verti").addClass("active"),
          $(".grid-hori").removeClass("active");
      });
  }),
  $(function () {
    $(".nasted-dropdown a").click(function () {
      $(this).next().toggle(),
        $(".nasted-dropdown li ul:visible").length > 1 &&
          ($(".nasted-dropdown li ul:visible").hide(), $(this).next().show());
    });
  }),
  $(".eye").on("click", function () {
    $(".eye").toggleClass("fa-eye-slash"), $(".eye").toggleClass("fa-eye");
    var i = $("#pass");
    "password" === i.attr("type")
      ? i.attr("type", "text")
      : i.attr("type", "password");
  }),
  jQuery(document).ready(function (i) {
    var n = i(".faq-ans").hide();
    n.first().show(),
      i(".faq-que").click(function () {
        var t = i(this);
        n.slideUp(), t.next().slideDown();
      });
  });
