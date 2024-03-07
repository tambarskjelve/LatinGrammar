Class {
	#name : #GrammarPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'firstInput',
		'secondInput',
		'thirdInput',
		'thirdIstemInput',
		'fourthInput',
		'fifthInput'
	],
	#category : #LatinGrammar
}

{ #category : #layout }
GrammarPresenter >> defaultLayout [ 
	^ SpGridLayout new
		add: 'First' at: 1@1; add: firstInput at: 2@1; 
		add: 'Second' at: 1@2; add: secondInput at: 2@2;
		add: 'Third' at: 1@3; add: thirdInput at: 2@3; 
		add: 'i-stem' at: 1@4; add: thirdIstemInput at: 2@4; 
		add: 'Fourth' at: 1@5; add: fourthInput at: 2@5; 
		add: 'Fifth' at: 1@6; add: fifthInput at: 2@6;
		beColumnNotHomogeneous;
		yourself.
]

{ #category : #accessing }
GrammarPresenter >> fifthInput [
	^ fifthInput 
]

{ #category : #accessing }
GrammarPresenter >> firstInput [
	^ firstInput 
]

{ #category : #accessing }
GrammarPresenter >> fourthInput [
	^ fourthInput 
]

{ #category : #initialization }
GrammarPresenter >> initializePresenters [ 
	firstInput := self newTextInput.
	secondInput := self newTextInput.
	thirdInput := self newTextInput.
	thirdIstemInput := self newTextInput.
	fourthInput := self newTextInput.
	fifthInput := self newTextInput.
]

{ #category : #accessing }
GrammarPresenter >> secondInput [
	^ secondInput 
]

{ #category : #accessing }
GrammarPresenter >> thirdInput [
	^ thirdInput 
]

{ #category : #accessing }
GrammarPresenter >> thirdIstemInput [
	^ thirdIstemInput 
]
