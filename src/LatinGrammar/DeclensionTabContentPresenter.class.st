Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'caseSymbols',
		'singular',
		'plural',
		'caseNames'
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
	caseSymbols do: [ :symbol | singularInputColumn add: (singular at: symbol) ].
	
	pluralInputColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Plural'.
	caseSymbols do: [ :symbol | pluralInputColumn add: (plural at: symbol) ].
			
	^ complete
		add: caseColumn;
		add: singularInputColumn;
		add: pluralInputColumn;
		yourself.
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 
	
	caseNames := #('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative').
	caseSymbols := #( #nom #gen #dat #acc #abl ).
	singular := Dictionary new.
	plural := Dictionary new.
	caseSymbols do: [ :key | 
		singular add: key->(self newTextInput). 
		plural add: key->(self newTextInput)].
	
	
]

{ #category : #initialization }
DeclensionTabContentPresenter >> plural [
	^ plural
]

{ #category : #initialization }
DeclensionTabContentPresenter >> singular [
	^ singular
]
