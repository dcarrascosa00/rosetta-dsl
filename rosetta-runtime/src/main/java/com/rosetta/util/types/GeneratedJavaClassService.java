package com.rosetta.util.types;

import com.rosetta.model.lib.ModelReportId;
import com.rosetta.model.lib.ModelSymbolId;
import com.rosetta.util.DottedPath;

public class GeneratedJavaClassService {
	public JavaClass toJavaReportFunction(ModelReportId id) {
		DottedPath packageName = id.getNamespace().child("reports");
		String simpleName = id.joinRegulatoryReference() + "ReportFunction";
		return new JavaClass(packageName, simpleName);
	}
	public JavaClass toJavaReportTabulator(ModelReportId id) {
		DottedPath packageName = id.getNamespace().child("reports");
		String simpleName = id.joinRegulatoryReference() + "ReportTabulator";
		return new JavaClass(packageName, simpleName);
	}
	
	public JavaClass toJavaFunction(ModelSymbolId id) {
		DottedPath packageName = id.getNamespace().child("functions");
		String simpleName = id.getName();
		return new JavaClass(packageName, simpleName);
	}
	
	public JavaClass toJavaRule(ModelSymbolId id) {
		DottedPath packageName = id.getNamespace().child("reports");
		String simpleName = id.getName() + "Rule";
		return new JavaClass(packageName, simpleName);
	}
	
	public JavaClass toJavaType(ModelSymbolId id) {
		DottedPath packageName = id.getNamespace();
		String simpleName = id.getName();
		return new JavaClass(packageName, simpleName);
	}
}
