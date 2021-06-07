Oystercard Pairing Challenge

## User Story 1
‘‘’’
In order to use public transport
As a customer
I want money on my card
‘‘’’
### Analysis
Have a default balance of 0 on initialize

## User Story 2

In order to keep using public transport
As a customer
I want to add money to my card

### Analysis
Expect to be able to top_up(value) my balance

## User Story 3

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

### Analysis
Expect top_up to raise an error if top up would take balance over 90

## User Story 4

In order to pay for my journey
As a customer
I need my fare deducted from my card

### Analysis
Expect deduct(fare) to reduce balance by the given amount
