Class {
	#name : #LuhnAlgorithm,
	#superclass : #Object,
	#instVars : [
		'payload',
		'digitsArray',
		'multiplesArray',
		'sumDigitsArray',
		'chechsum'
	],
	#category : #Trabajo
}

{ #category : #'as yet unclassified' }
LuhnAlgorithm >> checksum [

|sumAll sumFuction|
sumAll := 0.
1 to: sumDigitsArray size do: [ :i | sumAll := (sumDigitsArray at: i) + sumAll].

sumFuction := ((10- (sumAll\\10))\\10).

^sumFuction 
]

{ #category : #accessing }
LuhnAlgorithm >> digits [
	"|arregloTemp|"
	digitsArray  := Array new: payload numberOfDigits .
	"arregloTemp = Array new: payload."
	"56789"
	1 to: payload numberOfDigits do: [ :i | 
		
		digitsArray  at: i put: (payload digitAt: i base: 10)
		
		 ].
	
	
	
	^ digitsArray 
	
	

]

{ #category : #accessing }
LuhnAlgorithm >> multiples [

multiplesArray := Array new: digitsArray size.

1 to: digitsArray size do: [ :i | 
	
	(i \\ 2 = 0) ifTrue: [ multiplesArray at: i put: ((digitsArray at: i) * 2)] 
					 ifFalse: [ multiplesArray at: i put: (digitsArray at: i) ] ].

^ multiplesArray 



]

{ #category : #accessing }
LuhnAlgorithm >> payload [

^ payload
]

{ #category : #accessing }
LuhnAlgorithm >> payload: aSmallInteger [

payload := aSmallInteger 
]

{ #category : #accessing }
LuhnAlgorithm >> sumDigits [

	sumDigitsArray := Array new: multiplesArray size.

	1 to: multiplesArray size do: [ :i |
		| sumEntry |
		sumEntry := self sumSingleEntry: (multiplesArray at: i).

		sumDigitsArray at: i put: sumEntry ].
	^ sumDigitsArray
]

{ #category : #'as yet unclassified' }
LuhnAlgorithm >> sumSingleEntry: aNumber [
|sum|

(aNumber numberOfDigits = 1) ifTrue: [ ^ aNumber ].

sum:= 0.

1 to: 2 do: [ :i | sum:= sum + (aNumber digitAt: i base: 10) ].

^ sum
]
