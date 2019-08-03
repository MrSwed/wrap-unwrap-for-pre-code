// https://stackoverflow.com/a/57341170/5447232
var ws = function(i,e) { 
  $("pre code").filter(function(){
   var _t = $(this).parent();
    return !_t.has("input[switch").length 
      && _t.get(0).scrollWidth > _t.innerWidth();
  }).before("<input type='checkbox' checked switch title='Wrap/Unwrap' />");
}
$("body").on("change", ws).change();
$(window).bind("scroll", ws);
