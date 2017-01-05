"use strict";

var controllers = require('./lib/controllers'),

	plugin = {};

plugin.init = function(params, callback) {
	var router = params.router,
		hostMiddleware = params.middleware,
		hostControllers = params.controllers;
		
	// We create two routes for every view. One API call, and the actual route itself.
	// Just add the buildHeader middleware to your route and NodeBB will take care of everything for you.

	router.get('/admin/plugins/terminal', hostMiddleware.admin.buildHeader, controllers.renderAdminPage);
	router.get('/api/admin/plugins/terminal', controllers.renderAdminPage);

	callback();
};

plugin.addNavigation = function(menu, callback) {
	menu = menu.concat(
		[
			{
				"route": "/terminal",
				"title": "Terminal",
				"iconClass": "fa-terminal",
				"textClass": "visible-xs-inline",
				"text": "Terminal"
			}
		]
	);

	callback (null, menu);
};


plugin.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/plugins/terminal',
		icon: 'fa-tint',
		name: 'terminal'
	});

	callback(null, header);
};


module.exports = plugin;