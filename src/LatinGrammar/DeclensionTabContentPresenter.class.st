Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'caseSymbols',
		'caseNames',
		'pluralTextInputs',
		'singularTextInputs'
	],
	#category : #LatinGrammar
}

{ #category : #layout }
DeclensionTabContentPresenter >> defaultLayout [  

	| complete caseColumn singularInputColumn pluralInputColumn |
	complete := SpBoxLayout newLeftToRight.
	
	caseColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: ''.
	caseNames do: [ :case | caseColumn add: case ].
	
	singularInputColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Singular'.
	caseSymbols do: [ :symbol | singularInputColumn add: (singularTextInputs at: symbol) ].
	
	pluralInputColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Plural'.
	caseSymbols do: [ :symbol | pluralInputColumn add: (pluralTextInputs at: symbol) ].
			
	^ complete
		add: caseColumn;
		add: singularInputColumn;
		add: pluralInputColumn;
		yourself.
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initialize [

	super initialize.
	
	singularTextInputs := Dictionary new.
	pluralTextInputs := Dictionary new.
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 
	
	caseNames := #('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative').
	caseSymbols := #( #nom #gen #dat #acc #abl ).
	singularTextInputs := Dictionary new.
	pluralTextInputs := Dictionary new.
	caseSymbols do: [ :key | 
		singularTextInputs add: key->(self newTextInput). 
		pluralTextInputs add: key->(self newTextInput)].
	
	
]

{ #category : #initialization }
DeclensionTabContentPresenter >> plural [
	^ pluralTextInputs
]

{ #category : #initialization }
DeclensionTabContentPresenter >> singular [
	^ singularTextInputs
]
