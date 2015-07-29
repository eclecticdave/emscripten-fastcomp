//===-- X86MCNaCl.h - Prototype for CustomExpandInstNaClX86   ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef X86MCNACL_H
#define X86MCNACL_H

namespace llvm {
class MCInst;
class MCStreamer;
struct X86MCNaClSFIState {
  unsigned PrefixSaved;
  bool EmitRaw;
};
bool CustomExpandInstNaClX86(const MCSubtargetInfo &STI, const MCInst &Inst,
                             MCStreamer &Out, X86MCNaClSFIState &State);
}

#endif
