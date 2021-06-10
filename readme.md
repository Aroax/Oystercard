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

## User Story 7
```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
### Analysis
Expect touch_in to store entry station

## User Story 8
```
In order to know where I have been
As a customer
I want to see all my previous trips
```
### Analysis
card.print_journeys
=> {entry_station, exit_station}

Expect card.print_journeys to output an array

## User Story 9
```
In order to know how far I have travelled
As a customer
I want to know what zone a station is in
```

### Analysis

station = Station.new
zones = {zone => station}
zones[include?(station)] = zone
station.zone
> zone

Expect station.zone to return zone

## User Story 10
```
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out
```

### Analysis

We now need to track journey state. Worth creating a new Journey class and adapting tests accordingly.

touch_in(entry_station)
touch_in(new_entry_station)
expect(card.penalty) to deduct from card.balance


Last position: https://github.com/makersacademy/course/blob/master/oystercard/14_no_touch_in_or_out.md


Oystercard owns:
- Card limits (min fare, max balance, default balance)
- Balance
- touch_in
- touch_out
- top_up
- journey history
INTERFACE

Journey owns:
- entry_station
- exit_station
- on_journey
- zone-fare lookup table (hash)
- calculate_fare
RETURNS: fare

Station owns:
- station_name
- station_zone
- station-zone lookup table (hash)
RETURNS: zone
