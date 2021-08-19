/*
 * Copyright (c) REGnosys 2018 (www.regnosys.com) 
 */
package com.regnosys.rosetta.web

import javax.servlet.annotation.WebServlet
import org.eclipse.xtext.util.DisposableRegistry
import org.eclipse.xtext.web.servlet.XtextServlet

/**
 * Deploy this class into a servlet container to enable DSL-specific services.
 */
@WebServlet(name = 'XtextServices', urlPatterns = '/xtext-service/*')
class RosettaServlet extends XtextServlet {
	
	DisposableRegistry disposableRegistry
	
	override init() {
		super.init()
		val injector = new RosettaWebSetup().createInjectorAndDoEMFRegistration()
		disposableRegistry = injector.getInstance(DisposableRegistry)
	}
	
	override destroy() {
		if (disposableRegistry !== null) {
			disposableRegistry.dispose()
			disposableRegistry = null
		}
		super.destroy()
	}
	
}
