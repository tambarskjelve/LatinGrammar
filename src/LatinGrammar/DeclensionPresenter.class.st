Class {
	#name : #DeclensionPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tabContentPresenters'
	],
	#category : #LatinGrammar
}

{ #category : #layout }
DeclensionPresenter >> defaultLayout [ 
	^ SpTabLayout new
		add: (tabContentPresenters at: 1) label:'1st';
		add: (tabContentPresenters at: 2) label:'2nd';
		add: (tabContentPresenters at: 3) label:'3rd';
		add: (tabContentPresenters at: 4) label:'3rd i';
		add: (tabContentPresenters at: 5) label:'4th';
		add: (tabContentPresenters at: 6) label:'5th'. 
]

{ #category : #initialization }
DeclensionPresenter >> initializePresenters [ 

	tabContentPresenters := { 
		(DeclensionTabContentPresenter new) .
		(DeclensionTabContentPresenter new) .
		(DeclensionTabContentPresenter new) .
		(DeclensionTabContentPresenter new) .
		(DeclensionTabContentPresenter new) .
		(DeclensionTabContentPresenter new) 
	}
]

{ #category : #initialization }
DeclensionPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Latin Declensions';
		initialExtent: 400@300.
]

{ #category : #initialization }
DeclensionPresenter >> tabContentPresenters [
	^ tabContentPresenters 
]
