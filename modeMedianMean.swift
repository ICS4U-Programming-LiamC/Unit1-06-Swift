//
//  modeMedianMean.swift
//
//  Created by Liam Csiffary
//  Created on 2022-03-10
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  The Mean Median Mode program calculates these three for a given
//  txt file of numbers

import Foundation

func Mean(array: [Int]) -> Int {
  var total = 0
  
  // adds all numbers in the array
  for each in array {
    total += each
  }
  
  // caculates and returns the median
  return (total / array.count)
}

func Median(array: [Int]) -> Int {
  var median = 0
  
  // if array has an even number of indexes
  if (array.count % 2 == 0) {
    median = (array[array.count/2 - 1] + array[array.count/2]) / 2
    
  } else { // if array has an odd number of indexes
    median = array[array.count / 2]
  }
  return median
}

func Mode(arrayMode: [Int]) -> [Int] {
  // creates array that is one larger and has -1 at the end of it
  var array = arrayMode
  array.append(-1)
  // defines vars
  var modes: [Int] = []
  var currentCounter = 0
  var highestCounter = 0
  var currentNum = array[0]
  var index = 0

  // counter how many of each number there is
  for each in array {
    if (currentNum == each) {
      currentCounter += 1
    } else {
      // once not true we check if its the number that has appeared the most
      // if it is empty the old list and add the current num
      if (currentCounter > highestCounter) {
        highestCounter = currentCounter
        modes = []
        modes.append(array[index-1])
      }
      // if it appears the same number of times then
      // add it to the list only 
      else if (currentCounter == highestCounter) {
        modes.append(array[index-1])
      }
      // set the new num to count for
      currentNum = array[index] // could also just write "each"
      // set the number of times that number has appeared to 1
      currentCounter = 1
    }
    index += 1
  }
  return modes
}

// reads the txt file
// code from
// https://forums.swift.org/t/read-text-file-line-by-line/28852/4
func readFile(_ path: String) -> [Int] {
  var arrayOfStrings: [Int] = []
  errno = 0
  if freopen(path, "r", stdin) == nil {
    perror(path)
    return []
  }
  while let line = readLine() {
    arrayOfStrings.append(Int(line) ?? -1)
    //do something with lines..
  }
  return arrayOfStrings
}

// function that sorts an array
func sortArray(unsortedArray: [Int]) -> [Int] {
  var sortedArray: [Int] = []
  var biggestNum = 0
  // finds the biggest num in the array
  for num in unsortedArray {
    if (num > biggestNum) {
      biggestNum = num
    }
  }

  // creates a new array in order from smallest to greatest
  var numToLookFor = 0
  while (numToLookFor <= biggestNum) {
    for num in unsortedArray {
      if (numToLookFor == num) {
        sortedArray.append(numToLookFor)
      }
    }
    numToLookFor += 1
  }
  
  return sortedArray
}

func main() {
  // create vars

  // defines file location
  let file = "set3.txt"
  // gets the array from the txt file then sorts it
  let arrayOfInts: [Int] = readFile(file)
  let sortedArray: [Int] = sortArray(unsortedArray: arrayOfInts)

  // gets mean, median, and mode
  let mean = Mean(array: sortedArray)
  let median = Median(array: sortedArray)
  let mode = Mode(arrayMode: sortedArray)

  // prints them to the user
  print("The mean is", mean)
  print("The median is", median)
  print("The mode(s) is/are", mode)
}

// calls main to start the program
main()
