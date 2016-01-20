# hubot-jstips

A hubot script that grabs and displays the latest jstip from https://github.com/loverajoel/jstips.

See [`src/jstips.coffee`](src/jstips.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-jstips --save`

Then add **hubot-jstips** to your `external-scripts.json`:

```json
["hubot-jstips"]
```

## Sample Interaction

```
user1>> hubot jstip
hubot>> 
#18 - Rounding the fast way

2016-01-18 by pklinger

Today's tip is about performance. Ever came across the double tilde ~~ operator? It is sometimes also called the double NOT bitwise operator. You can use it as a faster substitute for Math.floor(). Why is that?
One bitwise shift ~ transforms the 32 bit converted input into -(input+1). The double bitwise shift therefore transforms the input into -(-(input + 1)+1) making it a great tool to round towards 0. For numeric input, it therefore mimics the Math.ceil() for negative and Math.floor() for positive input. On failure, 0 is being returned, which might come in handy sometimes instead of Math.floor() return value NaN on failure.
// single ~
console.log(~1337)    // -1338

// numeric input
console.log(~~47.11)  // -> 47
console.log(~~-12.88) // -> -12
console.log(~~1.9999) // -> 1
console.log(~~3)      // -> 3

// on failure
console.log(~~[]) // -> 0
console.log(~~NaN)  // -> 0
console.log(~~null) // -> 0

// greater than 32 bit integer fails
console.log(~~(2147483647 + 1) === (2147483647 + 1)) // -> 0
Although ~~ may perform better, for the sake of readability please use Math.floor().
```
