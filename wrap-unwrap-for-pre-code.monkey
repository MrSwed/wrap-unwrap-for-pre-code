// ==UserScript==
// @name         Wrap-Unwrap for pre code
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  https://stackoverflow.com/a/57341170/5447232 
// @author       MrSwed
// @match        https://stackoverflow.com/*
// @include      /^https:\/\/(gitlab.com|github.com|.*\.wordpress\..*)\/.*/
// @grant        none
// ==/UserScript==


(function($) {
	'use strict';
	$('head').append('<style>pre {position:relative;} pre code {display:block} input[type="checkbox"][switch] {position: absolute; display: block; right:0.5em; top:0.5em; box-shadow: 0 0 0 10px rgba(255,255,255,0.7);} pre input[switch]:checked + code { white-space: pre-wrap; overflow-y:auto; margin-right:1em;}</style>');

	var ws = function(i, e) {
		$("pre code").filter(function() {
			var _c=$(this),_p = _c.parent();
			return !_p.has("input[switch]").length &&
				_c.get(0).scrollWidth > _c.innerWidth() &&
				_c.height(_c.outerHeight());
		}).before("<input type='checkbox' switch title='Wrap/Unwrap' />");
	}
	$("body").on("change", ws).change();
	$(window).bind("scroll", ws);
})(jQuery);
