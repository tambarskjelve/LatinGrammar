Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'caseSymbols',
		'caseNames',
		'pluralTextInputs',
		'singularTextInputs',
		'fasit',
		'grammarCase'
	],
	#category : #LatinGrammar
}

{ #category : #'as yet unclassified' }
DeclensionTabContentPresenter class >> forCase: aDictionary [
	^ self new initializeWithCase: aDictionary; yourself.
]

{ #category : #layout }
DeclensionTabContentPresenter >> defaultLayout [  
	"Default layout needs to select the first gender for its particular case. "
	| grammarSection caseColumn singularInputColumn pluralInputColumn |
	
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
			
	grammarSection := SpBoxLayout newLeftToRight
		add: caseColumn;
		add: singularInputColumn;
		add: pluralInputColumn.
		
	^ SpBoxLayout newTopToBottom
		add: grammarSection;
		add: (SpBoxLayout newLeftToRight
					add: (SpBoxLayout newLeftToRight
							add: (self newButton label: 'feminine'; yourself) ;
							add: (self newButton label: 'masculine'; yourself));
					add: (SpBoxLayout newLeftToRight
							add: (self newButton label: ''; yourself) ;
							add: (self newButton label: 'next'; yourself)));
		yourself.
	
]

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase [
	^ grammarCase 
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 
	
	caseNames := #('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative').
	caseSymbols := #( #nom #gen #dat #acc #abl ).
	fasit := #('aqua' 'aquae' 'aquae' 'aquam' 'aquā').
	
	singularTextInputs := Dictionary new.
	pluralTextInputs := Dictionary new.
	
	caseSymbols do: [ :key | 
		singularTextInputs add: key->(self newTextInput). 
		pluralTextInputs add: key->(self newTextInput)].
	
" whenSubmitDo: [ :text | text = (grammarCase ) if Transcript show: 'hello!' ]"
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializeWithCase: aDictionary [
	grammarCase := aDictionary.
]

{ #category : #'scripting - widgets' }
DeclensionTabContentPresenter >> newButton [
	^ self instantiate: SpButtonPresenter
]

{ #category : #initialization }
DeclensionTabContentPresenter >> plural [
	^ pluralTextInputs
]

{ #category : #initialization }
DeclensionTabContentPresenter >> singular [
	^ singularTextInputs
]
