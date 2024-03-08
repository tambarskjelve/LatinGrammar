Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'grammarWords',
		'singular',
		'plural'
	],
	#category : #LatinGrammar
}

{ #category : #layout }
DeclensionTabContentPresenter >> defaultLayout [  
	^ SpBoxLayout newLeftToRight 
		add: (SpBoxLayout newTopToBottom 
			add: 'Nominative';
			add: 'Genitive';
			add: 'Dative';
			add: 'Accusative';
			add: 'Ablative';
			yourself);
		add: (SpBoxLayout newTopToBottom 
			add: (singular at: #nom);
			add: (singular at: #gen);
			add: (singular at: #dat);
			add: (singular at: #acc);
			add: (singular at: #abl);
			yourself);
		add: (SpBoxLayout newTopToBottom 
			add: (plural at: #nom);
			add: (plural at: #gen);
			add: (plural at: #dat);
			add: (plural at: #acc);
			add: (plural at: #abl);
			yourself).
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 
	
	grammarWords := #( #nom #gen #dat #acc #abl ).
	singular := Dictionary new.
	plural := Dictionary new.
	grammarWords do: [ :key | 
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
