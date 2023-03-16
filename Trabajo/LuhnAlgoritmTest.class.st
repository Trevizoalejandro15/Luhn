Class {
	#name : #LuhnAlgoritmTest,
	#superclass : #TestCase,
	#category : #Trabajo
}

{ #category : #tests }
LuhnAlgoritmTest >> testCheckSum [
"Sumar los numeros del arreglo sumDigits para despues aplicar la funcion matematica
(10-(SUM mod10)) mod 10"
|luhn result|

luhn:= LuhnAlgorithm new.

luhn payload: 1234567.
luhn digits.
luhn multiples.
luhn sumDigits.
result:= luhn checksum. "Siempre un receptor"
"{7 . 12 . 5 . 8 . 3 . 4 . 1 }"
"{7 . 3 . 5 . 8 . 3 . 4 . 1 }"
self assert: result equals:  9.

]

{ #category : #tests }
LuhnAlgoritmTest >> testDigits [

|luhn result|

luhn:= LuhnAlgorithm new.

luhn payload: 123.

result:= luhn digits.

self assert: result equals:  { 3 . 2 . 1 }.

]

{ #category : #tests }
LuhnAlgoritmTest >> testMultiples [

|luhn result|

luhn:= LuhnAlgorithm new.

luhn payload: 12345.
luhn digits.
result:= luhn multiples.

self assert: result equals:  { 5 . 8 . 3 . 4 . 1 }.

]

{ #category : #tests }
LuhnAlgoritmTest >> testSumDigits [
"Test si el numero miembro del arreglo multipleArray es mayor a 10 hace suma de los digitos para poner la suma en la posicion de ese numero en el arreglo sumdigits"
|luhn result|

luhn:= LuhnAlgorithm new.

luhn payload: 1234567.
luhn digits.
luhn multiples.
result:= luhn sumDigits.
"{7 . 12 . 5 . 8 . 3 . 4 . 1 }"
"{7 . 3 . 5 . 8 . 3 . 4 . 1 }"
self assert: result equals:  {7 . 3 . 5 . 8 . 3 . 4 . 1 }.

]

{ #category : #tests }
LuhnAlgoritmTest >> testSumSingleEntry [

	| luhn result |
	luhn := LuhnAlgorithm new.

	result := luhn sumSingleEntry: 18.

	self assert: result equals: 9.
	result:= luhn sumSingleEntry: 15.
	self assert: result equals: 6.
	
	result:= luhn sumSingleEntry: 9.
	self assert: result equals: 9
]
