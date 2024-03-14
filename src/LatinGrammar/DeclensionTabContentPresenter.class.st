Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'grammarCase',
		'currentGender',
		'currentWord',
		'genderButtonsContainer',
		'genders',
		'currentWordPresenter'
	],
	#category : #LatinGrammar
}

{ #category : #'as yet unclassified' }
DeclensionTabContentPresenter class >> forCase: aDictionary [
	^ self basicNew 
		grammarCase: aDictionary; 
		initialize;
		yourself.
	

]

{ #category : #accessing }
DeclensionTabContentPresenter >> currentWord: aString [
	currentWord := aString.
]

{ #category : #layout }
DeclensionTabContentPresenter >> defaultLayout [  
	"Default layout needs to select the first gender for its particular case. "
	
	"Return complete layout"
	^ SpBoxLayout newTopToBottom
		add: currentWordPresenter;
		add: (SpBoxLayout newLeftToRight
					add: genderButtonsContainer;
					add: (SpBoxLayout newLeftToRight
							add: (self newButton label: ''; yourself) ;
							add: (self newButton label: 'next'; yourself)));
		yourself.
]

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase: aDictionary [
	grammarCase := aDictionary.
	genders := (aDictionary at: 'genders').
	currentGender := (aDictionary at: 'genders') at: 1.
	currentWord := (((aDictionary at: currentGender) at: 'wordlist') at: 1).
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 


	currentWordPresenter := DeclensionCurrentWordPresenter forWord: currentWord withCases: (grammarCase at: currentGender).
	
	genderButtonsContainer := SpBoxLayout newLeftToRight.
	genders do: [ :gender | | button |
		button := self newButton label: gender.
		button action: [ | newPresenter newWord |
			newWord := (((grammarCase at: gender) at: 'wordlist') at: 1).
			newPresenter := DeclensionCurrentWordPresenter forWord: newWord withCases: (grammarCase at: gender).
			self layout replaceAtIndex: 1 with: newPresenter. 
		].
		genderButtonsContainer add: button. ].
]

{ #category : #'scripting - widgets' }
DeclensionTabContentPresenter >> newButton [
	^ self instantiate: SpButtonPresenter
]
