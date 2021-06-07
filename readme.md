# Oystercard Pairing Challenge

This weekly pairing challenge revisits some concepts introduced in Boris Bikes, with some additional suggested refactoring syntax and, later, more advanced functionality.

The original repo with instructions [can be found here](https://github.com/makersacademy/course/tree/master/oystercard).

## User Story 1
```
In order to use public transport
As a customer
I want money on my card
```
### Analysis
Have a default balance of 0 on initialize

## User Story 2
```
In order to keep using public transport
As a customer
I want to add money to my card
```
### Analysis
Expect to be able to top_up(value) my balance

## User Story 3
```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```
### Analysis
Expect top_up to raise an error if top up would take balance over 90

## User Story 4
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
### Analysis
Expect deduct(fare) to reduce balance by the given amount

## User Story 5
```
In order to get through the barriers.
As a customer
I need to touch in and out.
```
### Analysis
Expect card to have a variable journey/location state

## User Story 6
```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```
### Analysis
Expect touch_in to raise an error if balance is less than the minimum fare

Last position: https://github.com/makersacademy/course/blob/master/oystercard/10_charge_on_touch_out.md
