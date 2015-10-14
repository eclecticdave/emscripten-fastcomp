// RUN: llvm-mc -arch=amdgcn -show-encoding %s | FileCheck %s
// RUN: llvm-mc -arch=amdgcn -mcpu=SI -show-encoding %s | FileCheck %s

//===----------------------------------------------------------------------===//
// VOPC Instructions
//===----------------------------------------------------------------------===//

// Test forced e64 encoding

v_cmp_lt_f32_e64 s[2:3], v4, -v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], v4, -v6 ; encoding: [0x02,0x00,0x02,0xd0,0x04,0x0d,0x02,0x40]

//
// Modifier tests:
//

v_cmp_lt_f32 s[2:3] -v4, v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], -v4, v6 ; encoding: [0x02,0x00,0x02,0xd0,0x04,0x0d,0x02,0x20] 

v_cmp_lt_f32 s[2:3]  v4, -v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], v4, -v6 ; encoding: [0x02,0x00,0x02,0xd0,0x04,0x0d,0x02,0x40]

v_cmp_lt_f32 s[2:3] -v4, -v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], -v4, -v6 ; encoding: [0x02,0x00,0x02,0xd0,0x04,0x0d,0x02,0x60]

v_cmp_lt_f32 s[2:3] |v4|, v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], |v4|, v6 ; encoding: [0x02,0x01,0x02,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_lt_f32 s[2:3] v4, |v6|
// CHECK: v_cmp_lt_f32_e64 s[2:3], v4, |v6| ; encoding: [0x02,0x02,0x02,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_lt_f32 s[2:3] |v4|, |v6|
// CHECK: v_cmp_lt_f32_e64 s[2:3], |v4|, |v6| ; encoding: [0x02,0x03,0x02,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_lt_f32 s[2:3] -|v4|, v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], -|v4|, v6 ; encoding: [0x02,0x01,0x02,0xd0,0x04,0x0d,0x02,0x20]

v_cmp_lt_f32 s[2:3] v4, -|v6|
// CHECK: v_cmp_lt_f32_e64 s[2:3], v4, -|v6| ; encoding: [0x02,0x02,0x02,0xd0,0x04,0x0d,0x02,0x40]

v_cmp_lt_f32 s[2:3] -|v4|, -|v6|
// CHECK: v_cmp_lt_f32_e64 s[2:3], -|v4|, -|v6| ; encoding: [0x02,0x03,0x02,0xd0,0x04,0x0d,0x02,0x60]

//
// Instruction tests:
//

v_cmp_f_f32 s[2:3], v4, v6
// CHECK: v_cmp_f_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x00,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_lt_f32 s[2:3], v4, v6
// CHECK: v_cmp_lt_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x02,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_eq_f32 s[2:3], v4, v6
// CHECK: v_cmp_eq_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x04,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_le_f32 s[2:3], v4, v6
// CHECK: v_cmp_le_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x06,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_gt_f32 s[2:3], v4, v6
// CHECK: v_cmp_gt_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x08,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_lg_f32 s[2:3], v4, v6
// CHECK: v_cmp_lg_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x0a,0xd0,0x04,0x0d,0x02,0x00]

v_cmp_ge_f32 s[2:3], v4, v6
// CHECK: v_cmp_ge_f32_e64 s[2:3], v4, v6 ; encoding: [0x02,0x00,0x0c,0xd0,0x04,0x0d,0x02,0x00]

// TODO: Finish VOPC

//===----------------------------------------------------------------------===//
// VOP1 Instructions
//===----------------------------------------------------------------------===//

//
// Modifier tests:
// 

v_fract_f32 v1, -v2
// CHECK: v_fract_f32_e64 v1, -v2 ; encoding: [0x01,0x00,0x40,0xd3,0x02,0x01,0x00,0x20]

v_fract_f32 v1, |v2|
// CHECK: v_fract_f32_e64 v1, |v2| ; encoding: [0x01,0x01,0x40,0xd3,0x02,0x01,0x00,0x00]

v_fract_f32 v1, -|v2|
// CHECK: v_fract_f32_e64 v1, -|v2| ; encoding: [0x01,0x01,0x40,0xd3,0x02,0x01,0x00,0x20]

v_fract_f32 v1, v2 clamp
// CHECK: v_fract_f32_e64 v1, v2 clamp ; encoding: [0x01,0x08,0x40,0xd3,0x02,0x01,0x00,0x00]

v_fract_f32 v1, v2 mul:2
// CHECK: v_fract_f32_e64 v1, v2 mul:2 ; encoding: [0x01,0x00,0x40,0xd3,0x02,0x01,0x00,0x08]

v_fract_f32 v1, v2, div:2 clamp
// CHECK: v_fract_f32_e64 v1, v2 clamp div:2 ; encoding: [0x01,0x08,0x40,0xd3,0x02,0x01,0x00,0x18]

// TODO: Finish VOP1

///===---------------------------------------------------------------------===//
// VOP2 Instructions
///===---------------------------------------------------------------------===//

// Test forced e64 encoding with e32 operands

v_ldexp_f32_e64 v1, v3, v5
// CHECK: v_ldexp_f32_e64 v1, v3, v5 ; encoding: [0x01,0x00,0x56,0xd2,0x03,0x0b,0x02,0x00]


// TODO: Modifier tests

v_cndmask_b32 v1, v3, v5, s[4:5]
// CHECK: v_cndmask_b32_e64 v1, v3, v5, s[4:5] ; encoding: [0x01,0x00,0x00,0xd2,0x03,0x0b,0x12,0x00]

//TODO: readlane, writelane

v_add_f32 v1, v3, s5
// CHECK: v_add_f32_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x06,0xd2,0x03,0x0b,0x00,0x00]

v_sub_f32 v1, v3, s5
// CHECK: v_sub_f32_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x08,0xd2,0x03,0x0b,0x00,0x00]

v_subrev_f32 v1, v3, s5
// CHECK: v_subrev_f32_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x0a,0xd2,0x03,0x0b,0x00,0x00]

v_mac_legacy_f32 v1, v3, s5
// CHECK: v_mac_legacy_f32_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x0c,0xd2,0x03,0x0b,0x00,0x00]

v_mul_legacy_f32 v1, v3, s5
// CHECK: v_mul_legacy_f32_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x0e,0xd2,0x03,0x0b,0x00,0x00]

v_mul_f32 v1, v3, s5
// CHECK: v_mul_f32_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x10,0xd2,0x03,0x0b,0x00,0x00]

v_mul_i32_i24 v1, v3, s5
// CHECK: v_mul_i32_i24_e64 v1, v3, s5 ; encoding: [0x01,0x00,0x12,0xd2,0x03,0x0b,0x00,0x00]

///===---------------------------------------------------------------------===//
// VOP3 Instructions
///===---------------------------------------------------------------------===//

// TODO: Modifier tests

v_mad_legacy_f32 v2, v4, v6, v8
// CHECK: v_mad_legacy_f32 v2, v4, v6, v8 ; encoding: [0x02,0x00,0x80,0xd2,0x04,0x0d,0x22,0x04]




