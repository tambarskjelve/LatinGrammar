"
The only thing I do is overriding #catTakeKeyboardFocus to deny the image presenter to ever take focus.
"
Class {
	#name : #DeclensionImagePresenter,
	#superclass : #SpImagePresenter,
	#category : #LatinGrammar
}

{ #category : #testing }
DeclensionImagePresenter >> canTakeKeyboardFocus [
	"Answer when the presenter can take keyboard focus."

	^ false
]
