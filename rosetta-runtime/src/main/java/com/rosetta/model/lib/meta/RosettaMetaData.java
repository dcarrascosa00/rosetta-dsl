package com.rosetta.model.lib.meta;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.function.Function;

import com.rosetta.model.lib.RosettaModelObject;
import com.rosetta.model.lib.qualify.QualifyFunctionFactory;
import com.rosetta.model.lib.qualify.QualifyResult;
import com.rosetta.model.lib.validation.Validator;
import com.rosetta.model.lib.validation.ValidatorFactory;
import com.rosetta.model.lib.validation.ValidatorWithArg;

public interface RosettaMetaData<T extends RosettaModelObject> {

	List<Validator<? super T>> dataRules(ValidatorFactory factory);
	
	// @Compat. This will be empty, as choice rules are now all data rules.
	@Deprecated
	default List<Validator<? super T>> choiceRuleValidators() {
		return Collections.emptyList();
	}
	
	List<Function<? super T, QualifyResult>> getQualifyFunctions(QualifyFunctionFactory factory);
	
	Validator<? super T> validator();
	
	// @Compat. The default can be removed once validation/ingestion is in the BSP.
	default Validator<? super T> typeFormatValidator() {
		return null;
	}
	
	ValidatorWithArg<? super T, Set<String>> onlyExistsValidator();
}
