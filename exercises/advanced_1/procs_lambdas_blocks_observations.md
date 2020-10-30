# Exploring Procs, Lambdas, and Blocks: Definition and Arity

## Group 1

This group shows the behavior of procs. We know this because 1) the `proc` method is called when creating the object and 2) when the code is ran, the `class` method reveals that the object we created is of the `Proc` class. Running the code also shows that procs will not complain about not being provided with enough arguments. 

## Group 2

This group shows the behavior of lambdas. We know this because 1) the `lambda` method is called when creating the object and 2) when we `puts` the object, the response has `(lamdba)` in the object description. The interesting thing we learn here is that lambdas are actually a form of proc. We see this in the object description when we `puts` the objects and when the `class` method is called on the lambda object and responds with `Proc`. Running the code shows that lambda objects require an argument if it is defined to take one (it throws an ArgumentError when we attempt to call it without an argument). The code in this group attempts to create three lambda objects in three different ways, but we learn that there are only two valid ways to initialize a lambda object: 1) using the `Kernel#lambda` method and 2) using the "Lambda literal systax" of `->(arg)`. The third attempted method of creating lambdas `Lambda.new` does not work.

## Group 3

This group shows the behavior of methods using implicit blocks. We have a method defined to take an argument and inside the method it yields to a block. When we try to call the method without a block, it fails. This shows that when the `yield` keyword is reached in code, there must be a block to call. If you might call a given method without a block, the yield should be wrapped in a conditional controlled by the `block_given?` method so you don't get an error when calling the method without a block.

## Group 4

This group also shows the behavior of methods using implicit blocks, but it focuses more on the usage of parameters/arguments of the methods and the blocks. The first example shows that you can write a method to take an argument and then pass that argument to the block through the yield keyword (`yield(argument)`). The second example shows that blocks do not care how many arguments they recieve: if the block is defined to have multiple parameters but doesn't receive an argument for every parameter, it will still run; it will not throw an error. The third example shows that the block must have a parameter defined and has to be passed an argument to be able to access objects inside the method.

## Summary

Blocks and Procs behave similarly in that they will run regardless of the number of arguments passed to them. The main difference between them is that Procs are objects whereas Blocks are not. Procs and lambdas are both objects. In fact, a lambda is a form of proc. Procs don't care how many arguments they receive whereas lambdas do: a lambda will throw an error if it does not receive the exact number of arguments defined by its parameters.
