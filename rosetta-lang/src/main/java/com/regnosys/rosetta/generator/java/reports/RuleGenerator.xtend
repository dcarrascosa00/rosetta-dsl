package com.regnosys.rosetta.generator.java.reports

import com.regnosys.rosetta.generator.java.RosettaJavaPackages.RootPackage
import javax.inject.Inject
import org.eclipse.xtext.generator.IFileSystemAccess2
import com.regnosys.rosetta.generator.java.util.ImportManagerExtension
import com.regnosys.rosetta.generator.java.types.JavaTypeTranslator
import com.regnosys.rosetta.types.RObjectFactory
import com.regnosys.rosetta.generator.java.JavaScope
import com.rosetta.model.lib.reports.ReportFunction
import com.rosetta.util.types.JavaParameterizedType
import com.rosetta.util.types.JavaInterface
import com.regnosys.rosetta.generator.java.function.FunctionGenerator
import com.regnosys.rosetta.rosetta.RosettaRule

class RuleGenerator {
	@Inject extension JavaTypeTranslator
	@Inject extension RObjectFactory
	@Inject extension ImportManagerExtension
	@Inject FunctionGenerator functionGenerator

	
	def generate(RootPackage root, IFileSystemAccess2 fsa, RosettaRule rule, String version) {
		val rFunctionRule = buildRFunction(rule)
		val clazz = rFunctionRule.toFunctionJavaClass
		val baseInterface = new JavaParameterizedType(JavaInterface.from(ReportFunction), rFunctionRule.inputs.head.attributeToJavaType, rFunctionRule.output.attributeToJavaType)
		val topScope = new JavaScope(clazz.packageName)
		val classBody = functionGenerator.rBuildClass(rFunctionRule, false, #[baseInterface], emptyMap, true, topScope)
		
		val content = buildClass(clazz.packageName, classBody, topScope)
		fsa.generateFile(clazz.canonicalName.withForwardSlashes + ".java", content)
	}
}