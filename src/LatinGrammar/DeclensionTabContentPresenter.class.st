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
		'inputCorrect',
		'inputIncorrect',
		'columnForSingularCaseFeedback',
		'columnForPluralCaseFeedback',
		'singularFeedback',
		'pluralFeedback'
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

{ #category : #layout }
DeclensionTabContentPresenter >> defaultLayout [  
	"Default layout needs to select the first gender for its particular case. "
	| grammarSection caseColumn columnForSingularCaseInput columnForPluralCaseInput |
	
	caseColumn := SpBoxLayout newTopToBottom
		borderWidth: 10;
		spacing: 10;
		add: (currentWord capitalized).
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

{ #category : #accessing }
DeclensionTabContentPresenter >> grammarCase: aDictionary [
	grammarCase := aDictionary.
	currentWord := (((aDictionary at: ((aDictionary at: 'genders') at: 1)) at: 'wordlist') at: 1) at: 'word'.
]

{ #category : #initialization }
DeclensionTabContentPresenter >> initializePresenters [ 

	| defaultCase |

	caseNames := #('Nominative' 'Genitive' 'Dative' 'Accusative' 'Ablative').
	caseKeys := #( 'nom' 'gen' 'dat' 'acc' 'abl' ).
	fasit := #('aqua' 'aquae' 'aquae' 'aquam' 'aquā').
	
	singularTextInputs := Dictionary new.
	singularFeedback := Dictionary new.
	pluralTextInputs := Dictionary new.
	pluralFeedback := Dictionary new.
	
" 	inputCorrect := SpBoxLayout newTopToBottom add: (self iconNamed: 'thumbsUp'); yourself."
	inputCorrect := SpImagePresenter new image: nil.
 	inputIncorrect := SpBoxLayout newTopToBottom add: (self iconNamed: 'thumbsDown'); yourself.
		
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
	defaultCase := (grammarCase at: 'genders') at: 1.
	caseKeys do: [ :key | 
		(singularTextInputs at: key) whenSubmitDo: [ :text | | correctWord |
			correctWord := ((((grammarCase at: defaultCase) at: 'wordlist') at: 1) at: 'rootword'), (((grammarCase at: defaultCase) at: 'singular') at: key).
			text = correctWord ifTrue: [(singularFeedback at: key) image: (self iconNamed: #thumbsUp) ] ifFalse: [(singularFeedback at: key) image: (self iconNamed: #thumbsDown) ] ].
		(pluralTextInputs at: key) whenSubmitDo: [ :text | | correctWord |
			correctWord := ((((grammarCase at: defaultCase) at: 'wordlist') at: 1) at: 'rootword'), (((grammarCase at: defaultCase) at: 'plural') at: key).
			text = correctWord ifTrue: [(pluralFeedback at: key) image: (self iconNamed: #thumbsUp) ] ifFalse: [(pluralFeedback at: key) image: (self iconNamed: #thumbsDown) ] ]
	]
"((((grammarCase at: 'female') at: 'wordlist') at: 1) at: 'rootword'), (((grammarCase at: 'female') at: 'singular') at: 'gen')"
" whenSubmitDo: [ :text | text = (grammarCase ) if Transcript show: 'hello!' ]"
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
