// https://stackoverflow.com/a/57341170/5447232
var ws = function(i, e) {
  $("pre code").filter(function() {
    var _c=$(this),_p = _c.parent();
    return !_p.has("input[switch]").length 
      && _c.get(0).scrollWidth > _c.innerWidth() 
      && _c.height(_c.outerHeight());
  }).before("<input type='checkbox' switch title='Wrap/Unwrap' />");
}
$("body").on("change", ws).change();
$(window).bind("scroll", ws);
