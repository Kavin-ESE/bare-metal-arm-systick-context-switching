# Cooperative Task Scheduler on ARM Cortex-M (Assembly)

This project implements a minimal cooperative task scheduler on an ARM Cortex-M processor using pure assembly language. It demonstrates how context switching works internally by manually saving and restoring CPU registers, programming the SysTick timer, and managing multiple task stacks.

# Overview

Modern embedded systems run multiple tasks by switching CPU context between them.  
This project manually builds the core of an RTOS-like scheduler:

- Separate stacks for each task  
- Manual register context saving (r4–r11)  
- SysTick-based periodic interrupts  
- Context restoration using the Process Stack Pointer (PSP)  
- Switching between `main1`, `main2`, and `main3` tasks

This allows each task to run independently as if it had its own processor.

# Key Concepts Demonstrated

# SysTick Timer  
Configured to generate periodic interrupts, triggering a context switch.

# Interrupt Handling  
Inside the `systick_handler`, the CPU automatically saves:
- r0–r3  
- r12  
- lr  
- pc  
- xPSR  

The handler manually saves:
- r4–r11 (high registers)

This forms the full context of the running task.

# Task Switching  
Each task has its own **pre-filled stack** representing a "fake" initial state:

- Program Counter → points to `main1`, `main2`, or `main3`
- xPSR correctly set
- r4–r11, r0–r3 initialized with unique values  
- Scheduler loads a new stack pointer to switch tasks

# Returning From Interrupt  
`bx lr` restores the CPU state from the selected task’s stack, effectively switching execution to another task.

# 📂 Project Structure
.
├── main.S      Assembly source
├── linker.ld   Memory mapping
├── Makefile    Build rules
└── README.md   Documentation
