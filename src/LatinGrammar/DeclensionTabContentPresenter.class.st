Class {
	#name : #DeclensionTabContentPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'caseNames',
		'pluralTextInputs',
		'singularTextInputs',
		'singularCaseIndicator',
		'pluralCaseIndicator',
		'fasit',
		'grammarCase',
		'caseKeys',
		'currentWord',
		'currentGender',
		'inputCorrect',
		'inputIncorrect',
		'columnForSingularCaseFeedback',
		'columnForPluralCaseFeedback',
		'singularFeedback',
		'pluralFeedback',
		'genders',
		'genderButtonsContainer',
		'singularCases',
		'singularSuffixes',
		'pluralSuffixes',
		'pluralCases',
		'wordList'
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
	| grammarSection caseColumn columnForSingularCaseInput columnForPluralCaseInput |
	
	caseColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: currentWord.
	caseNames do: [ :case | caseColumn add: case ].
	
	columnForSingularCaseInput := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Singular';
		yourself.
	caseKeys do: [ :symbol | columnForSingularCaseInput add: (singularTextInputs at: symbol) ].
	
	columnForPluralCaseInput := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: 'Plural';
		yourself.
	caseKeys do: [ :symbol | columnForPluralCaseInput add: (pluralTextInputs at: symbol) ].
			
	grammarSection := SpBoxLayout newLeftToRight
		add: caseColumn;
 		add: columnForSingularCaseInput;
		add: columnForSingularCaseFeedback;
 		add: columnForPluralCaseInput;
		add: columnForPluralCaseFeedback;
		yourself.
		
	"Define layout for button Section"
	
	"Return complete layout"
	^ SpBoxLayout newTopToBottom
		add: grammarSection;
		add: (SpBoxLayout newLeftToRight
					add: genderButtonsContainer;
					add: (SpBoxLayout newLeftToRight
							add: (self newButton label: ''; yourself) ;
							add: (self newButton label: 'next'; yourself)));
		yourself.
	
]

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase [
	^ grammarCase 
]

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase: aDictionary [
	grammarCase := aDictionary.
	currentGender := (aDictionary at: 'genders') at: 1.
	currentWord := (((aDictionary at: currentGender) at: 'wordlist') at: 1) capitalized; yourself.
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 

	genders := (grammarCase at: 'genders').

	caseNames := #('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative').
	caseKeys := #( 'nom' 'gen' 'dat' 'acc' 'abl' ).
	fasit := #('aqua' 'aquae' 'aquae' 'aquam' 'aquā').
	
	singularTextInputs := Dictionary new.
	singularFeedback := Dictionary new.
	pluralTextInputs := Dictionary new.
	pluralFeedback := Dictionary new.
	
" 	inputCorrect := SpBoxLayout newTopToBottom add: (self iconNamed: 'thumbsUp'); yourself."
	inputCorrect := self iconNamed: 'thumbsUp'.
 	inputIncorrect := self iconNamed: 'thumbsDown'.
		
	caseKeys do: [ :key | 
		singularTextInputs add: key->(self newTextInput). 
		singularFeedback add: key->(SpImagePresenter new image: nil).
		pluralTextInputs add: key->(self newTextInput).
		pluralFeedback add: key->(SpImagePresenter new image: nil) ].
	
	columnForSingularCaseFeedback := SpBoxLayout newTopToBottom
		add: (SpImagePresenter new image: nil);
		yourself.
		
	columnForPluralCaseFeedback := SpBoxLayout newTopToBottom
		add: (SpImagePresenter new image: nil);
		yourself.
		
	caseKeys do: [ :key |
		columnForSingularCaseFeedback add: (singularFeedback at: key).
		columnForPluralCaseFeedback add: (pluralFeedback at: key) ].

	"Make sure each text input test for correct gender"
	"caseSymbols do: [ :symbol | pluralInputColumn add: (pluralTextInputs at: symbol) ]."
	self setInputsForCase: ((grammarCase at: 'genders') at: 1).

	"Next up: a sophisticated way to redefine word to be tested. Here you need an instance function, no way around that. "
	" I want the buttons to replace the grammar sections"
	genderButtonsContainer := SpBoxLayout newLeftToRight.
	genders do: [ :gender | | button |
		button := self newButton label: gender.
		button action: [ 
			self setInputsForCase: button label. 
		].
		genderButtonsContainer add: button. ].
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
DeclensionTabContentPresenter >> setInputsForCase: aString [

	| rootWord |

	
	currentWord label: (((((grammarCase at: aString) at: 'wordlist') at: 1) at: 'word') capitalized).
	rootWord := ((((grammarCase at: aString) at: 'wordlist') at: 1) at: 'rootword').
	Transcript show: 'setInputsForCase: called', ', rootword: ', rootWord; cr.
	
	caseKeys do: [ :key | 
		
		Transcript show: aString, ' updating ', key; cr.
		
		(singularTextInputs at: key) whenSubmitDo: [ :text | 
			Transcript show: 'input: ', text, ' , against: ', (rootWord, (((grammarCase at: aString) at: 'singular') at: key)); cr.
			text = (rootWord, (((grammarCase at: aString) at: 'singular') at: key)) 
				ifTrue: [(singularFeedback at: key) image: inputCorrect  ] 
				ifFalse: [(singularFeedback at: key) image: inputIncorrect ] 
		].
			
		(pluralTextInputs at: key) whenSubmitDo: [ :text | 
			Transcript show: 'input: ', text, ' , against: ', (rootWord, (((grammarCase at: aString) at: 'plural') at: key)); cr.
			text = (rootWord, (((grammarCase at: aString) at: 'plural') at: key)) 
				ifTrue: [(pluralFeedback at: key) image: inputCorrect ] 
				ifFalse: [(pluralFeedback at: key) image: inputIncorrect ]
		]
	]
]

{ #category : #initialization }
DeclensionTabContentPresenter >> singular [
	^ singularTextInputs
]
