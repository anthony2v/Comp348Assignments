# Comp348Assignments
All the assignments that Anthony completed while taking the course Principles of Programming Languages in Winter 2020. 

## Assignment 1
### Question 1: Knowledge Representation in Prolog
Create a prolog database capturing the information about your family. The information must be created in terms of a procedure named individual which should have the below mentioned syntax:

```Prolog
individual(tom, male, adam, eve).
individual(sandra, female, john, jenny).
```

The facts comprise of individuals' name, sex, and parents' names. Create a minimum of 15 facts to make the database large enough.

Create the below mentioned rules to query useful information from the database:

1. offspring(X, Y)
2. niblings(X, Y)
3. puncle(X, Y)
4. modridge(X, Y)
5. avuncle(X, Y)

### Question 2: Unifications and Resolutions in Prolog
Determine which pairs of unifications can be unified together. If unification is not possible, explain why. If it is possible, provide the variable instantiations that lead to successful unification.

### Question 3: Queries in Prolog
With a given knowledge base, determine the type of each of the given queries (ground/non-ground), and explain how Prolog will respond to each query.

### Question 4: Lists and Backtracking
Consider the database from the previous question and answer the following:

1. Write a prolog rule totalIncome/2 to compute the total income of a family.
2. Write a prolog query to print the total income of each family.
3. Write a prolog query to print family details of each family that has an income per family member that is less than $2000.
4. Write a prolog query to print family details of each family where the children's total income is more than their parents.

## Assignment 2
### Question 1
Write a lisp function called triangle that takes an argument (n) and shows a triangle of printed numbers as shown below. If the input is a decimal or string, then it should print an appropriate message.

```Lisp
1
1 2
1 2 3
1 2 3 4
```

```Lisp
(triangle 2.5) ;;; "decimal numbers are not valid input, please enter an integer"
```

### Question 2
Write a lisp program that calculates the distance between two arbitrary points, P1(x1, y1) and P2(x2, y2) based on the formula distance(P1, P2) = sqrt((x1 - x2)^2 + (y1 - y2)^2).

Implement your program in two different ways:

1. Using anonymous functions (lambda).
2. Without applying the anonymous function.

Which method is more efficient in terms of memory allocation?

### Question 3
Write a list function that accepts a list as the input argument (the list is mixed up integers, decimals, characters and nested lists) and creates a list including all the characters in the original list.

### Question 4
Write a list function called f-l-swap that swaps the first and last elements of a list.

### Question 5
Write a lisp program to check whether a binary tree is a Binary Search Tree.

### Question 6
Write a lisp program to compute the serise for the sin(x) and cos(x) functions depending on the value of n.

### Question 7
Write a lisp program that computes the Pell numbers for in input argument, n, using:

1. An iterative approach
2. A recursive approach

## Assignment 3
### Question 1
Write a C fuinction called matrixTranspose that takes a two-dimensional array as its input argument and then transposes its elements.

### Question 2
Using the output file created using your Ruby program in Q3, write a C program that output file and works according to the following description:

1. It uses structs instead of classes.
2. Each struct will contain a pointer to the next struct of the same type.
3. The top-level struct will contain a pointer the first struct in the level below it.
4. It reads the file and starts populating variables of the corresponding struct type and updates the linked list pointers accordingly.
5. It also has the three functions explained in Q3: searchInventory, add2Inventory, and saveCatalogue2File.

### Question 3
Write a Ruby method that takes an array of strings as an argument, sorts it alphabetically, iterates and uses a code block to display each string element along with its characters count.

### Question 4
Write a Ruby method that can read any document file, count the number of characters, words, and sentences and then apply the Automated Readability Index formula to find out the grade level required for a person to read the opened document.

### Question 5
Create an auto showroom inventory catalogue using Ruby. Your program should read a car listings file which contains all available inventory details where each line contains the following features: mileage, type, transmission, stock number, drivetrain, status, fuel economy, car maker, model, year, trim, and set of features.