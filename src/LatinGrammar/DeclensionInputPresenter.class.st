Class {
	#name : #DeclensionInputPresenter,
	#superclass : #SpPresenter,
	#category : #LatinGrammar
}

{ #category : #layout }
DeclensionInputPresenter >> defaultLayout [ 
	^ SpGridLayout new
			beColumnNotHomogeneous;
         column:3 withConstraints: #beExpand;
			add: 'Declension' at: 1@1; add: 'singular' at: 2@1; 		add: 'plural' at: 3@1;
			add: '1st' at: 1@2; 		add: firstInput at: 2@2; 		add: plural1input  at: 3@2; 
			add: '2nd' at: 1@3; 		add: secondInput at: 2@3; 		add: plural2input  at: 3@3;
			add: '3rd' at: 1@4; 		add: thirdInput at: 2@4; 		add: plural3input  at: 3@4;
			add: '*3rd' at: 1@5; 		add: thirdIstemInput at: 2@5; add: plural3iInput   at: 3@5; 
			add: '4th' at: 1@6; 		add: fourthInput at: 2@6; 		add: plural4input  at: 3@6; 
			add: '5th' at: 1@7; 		add: fifthInput  at: 2@7;		add: plural5input   at: 3@7.
			
"	Alternate builder
	^ SpGridLayout build: [ :builder |
        builder
			beColumnNotHomogeneous;
         column:2 withConstraints: #beExpand;
			add: 'First'; add: firstInput; nextRow; 
			add: 'Second'; add: secondInput; nextRow; 
			add: 'Third'; add: thirdInput;  nextRow; 
			add: 'i-stem'; add: thirdIstemInput; nextRow; 
			add: 'Fourth'; add: fourthInput; nextRow; 
			add: 'Fifth'; add: fifthInput]
"
					
]

{ #category : #initialization }
DeclensionInputPresenter >> initializePresenters [ 
	firstInput := self newTextInput.
	secondInput := self newTextInput.
	thirdInput := self newTextInput.
	thirdIstemInput := self newTextInput.
	fourthInput := self newTextInput.
	fifthInput := self newTextInput.
	
	plural1input := self newTextInput.
	plural2input := self newTextInput.
	plural3input := self newTextInput.
	plural3iInput := self newTextInput.
	plural4input := self newTextInput.
	plural5input := self newTextInput.
]
