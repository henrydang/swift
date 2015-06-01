// Also run this test in optimize test modes.
// REQUIRES: optimize_test

// RUN: rm -rf %t
// RUN: mkdir %t
// RUN: cp %s %t/main.swift
// RUN: %target-build-swift -Xfrontend -playground -Xfrontend -playground-high-performance -Xfrontend -debugger-support -o %t/main %S/Inputs/PlaygroundsRuntime.swift %t/main.swift
// RUN: %target-run %t/main | FileCheck %s

var a = true
if (a) {
  5
} else {
  7
}

for i in 0..<3 {
  i
}
// CHECK: [{{.*}}] $builtin_log[a='true']
// CHECK-NEXT: [{{.*}}] $builtin_log[='5']
// CHECK-NEXT: [{{.*}}] $builtin_log[='0']
// CHECK-NEXT: [{{.*}}] $builtin_log[='1']
// CHECK-NEXT: [{{.*}}] $builtin_log[='2']

var b = true
for i in 0..<3 {
  i
  continue
}
// CHECK-NEXT: [{{.*}}] $builtin_log[b='true']
// CHECK-NEXT: [{{.*}}] $builtin_log[='0']
// CHECK-NEXT: [{{.*}}] $builtin_log[='1']
// CHECK-NEXT: [{{.*}}] $builtin_log[='2']

var c = true
for i in 0..<3 {
  i
  break
}
// CHECK-NEXT: [{{.*}}] $builtin_log[c='true']
// CHECK-NEXT: [{{.*}}] $builtin_log[='0']
