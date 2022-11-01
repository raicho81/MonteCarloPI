Class {
	#name : #TestEstimate,
	#superclass : #TestCase,
	#category : #'MonteCarloPI-Test'
}

{ #category : #tests }
TestEstimate >> testInitializationIsOk [

	| inst |
	inst := MonteCarloPiEstimator new.
	self assert: inst ~= nil.
	self assert: inst pi equals: 0.
	self assert: inst hits equals: 0.
	self assert: inst shots equals: 0.
	self assert: inst epsilon equals: Float infinity.
]

{ #category : #tests }
TestEstimate >> testWorking [

	"Try to estimate PI"

	| inst pi_estimate |
	inst := MonteCarloPiEstimator new.
	pi_estimate := inst estimate: 0.0000000001 inner_iterations: 1000.
	Transcript
		show: 'PI (estimated): ';
		show: pi_estimate;
		cr.
	self
		assert: (pi_estimate roundDownTo: 10)
		equals: (Float pi roundTo: 10)
]
