# VHDL Vending Machine Project

## Overview

This VHDL project implements a vending machine simulation. The machine accepts inputs in the form of dollar, quarter, and dime pulses and allows users to select an item. The internal logic of the machine calculates the total inserted amount, dispenses the selected item if sufficient funds have been inserted, and returns change if necessary.

## Components

The project is composed of several VHDL modules, each responsible for a different aspect of the vending machine's operation:

- **Finite State Machine (FSM)**: Manages the overall state of the vending machine, including tracking the current amount of money inserted, the item selection process, and the change dispensation.
- **Memory for Item Selection**: Allows the item selection to be stored temporarily so that the user does not need to hold their selection.
- **Comparator**: Compares the total money inserted with the price of the selected item to determine if the item can be dispensed.
- **8-Bit MUX**: Used to select between adding money and dispensing change.
- **Adder**: Adds the value of inserted money to the total or subtracts change to be dispensed.
- **Money Value Component**: Converts input pulses (dollar, quarter, dime) into their monetary value.
- **Get Price Component**: Determines the price of the selected item.
- **JK Flip Flop, D Flip Flop**: Used for state management and item selection storage.

## Design Files

The project includes several VHDL files, each defining a component of the vending machine:

- `FSM.vhd`: Defines the Finite State Machine for managing the vending machine's states.
- `JK_FF.vhd`, `D_FF.vhd`: Define flip-flops for state and selection storage.
- `moneyValue.vhd`: Converts input pulses into monetary values.
- `getPrice.vhd`: Outputs the price of the selected item.
- `mux8bit.vhd`: Multiplexer for selecting between money input and change output.
- `adder.vhd`: Adds monetary values.
- `comparator.vhd`: Compares total inserted money against the item price.
- `vendMachine.vhd`: The top-level entity that integrates all components.

## Operation

1. The user inputs money (dollar, quarter, dime) and selects an item.
2. The FSM calculates the total inserted amount and compares it with the selected item's price.
3. If sufficient funds have been inserted, the machine dispenses the item and calculates the change.
4. The machine dispenses change a nickel at a time until the remaining amount equals the item price.
5. The item is dispensed, and the transaction is completed.

## Testing

The project includes a test bench that simulates various scenarios, such as inserting different amounts of money, selecting different items, and ensuring correct change dispensation.

- **Test Bench**: Simulates user interactions with the vending machine, including money insertion, item selection, and change dispensation.

## Implementation Notes

- The implementation uses code to design and simulate the operation of the vending machine.
- Components are designed modularly and integrated into the top-level `vendMachine` entity.
- The FSM plays a crucial role in managing the machine's state, including item dispensation and change calculation.

## Conclusion

This VHDL project provides a comprehensive simulation of a vending machine, demonstrating the use of Finite State Machines, component integration, and the handling of real-world scenarios such as money handling and item selection in digital design.
