// Also run this test in optimize test modes.
// REQUIRES: optimize_test

// RUN: rm -rf %t
// RUN: mkdir %t
// RUN: cp %s %t/main.swift
// RUN: %target-build-swift -Xfrontend -playground -Xfrontend -disable-playground-transform -Xfrontend -debugger-support -o %t/main %S/Inputs/PlaygroundsRuntime.swift %t/main.swift
// RUN: %target-run %t/main | FileCheck %s -allow-empty

var a = 2
var b = 3
a + b
// CHECK-NOT: $builtin_log
