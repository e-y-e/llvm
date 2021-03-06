; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=x86-64 -mattr=+sse4.2,+pclmul | FileCheck %s --check-prefix=CHECK --check-prefix=GENERIC
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=slm | FileCheck %s --check-prefix=CHECK --check-prefix=SLM
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=sandybridge | FileCheck %s --check-prefix=CHECK --check-prefix=SANDY
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=ivybridge | FileCheck %s --check-prefix=CHECK --check-prefix=SANDY
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=haswell | FileCheck %s --check-prefix=CHECK --check-prefix=HASWELL
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=skylake | FileCheck %s --check-prefix=CHECK --check-prefix=HASWELL
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=btver2 | FileCheck %s --check-prefix=CHECK --check-prefix=BTVER2
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -print-schedule -mcpu=znver1 | FileCheck %s --check-prefix=CHECK --check-prefix=ZNVER1

define i32 @crc32_32_8(i32 %a0, i8 %a1, i8 *%a2) {
; GENERIC-LABEL: crc32_32_8:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; GENERIC-NEXT:    crc32b (%rdx), %edi # sched: [8:1.00]
; GENERIC-NEXT:    movl %edi, %eax # sched: [1:0.33]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: crc32_32_8:
; SLM:       # BB#0:
; SLM-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; SLM-NEXT:    crc32b (%rdx), %edi # sched: [6:1.00]
; SLM-NEXT:    movl %edi, %eax # sched: [1:0.50]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: crc32_32_8:
; SANDY:       # BB#0:
; SANDY-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; SANDY-NEXT:    crc32b (%rdx), %edi # sched: [8:1.00]
; SANDY-NEXT:    movl %edi, %eax # sched: [1:0.33]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: crc32_32_8:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; HASWELL-NEXT:    crc32b (%rdx), %edi # sched: [7:1.00]
; HASWELL-NEXT:    movl %edi, %eax # sched: [1:0.25]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: crc32_32_8:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; BTVER2-NEXT:    crc32b (%rdx), %edi # sched: [8:1.00]
; BTVER2-NEXT:    movl %edi, %eax # sched: [1:0.17]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: crc32_32_8:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; ZNVER1-NEXT:    crc32b (%rdx), %edi # sched: [10:1.00]
; ZNVER1-NEXT:    movl %edi, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i32 @llvm.x86.sse42.crc32.32.8(i32 %a0, i8 %a1)
  %2 = load i8, i8 *%a2
  %3 = call i32 @llvm.x86.sse42.crc32.32.8(i32 %1, i8 %2)
  ret i32 %3
}
declare i32 @llvm.x86.sse42.crc32.32.8(i32, i8) nounwind

define i32 @crc32_32_16(i32 %a0, i16 %a1, i16 *%a2) {
; GENERIC-LABEL: crc32_32_16:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    crc32w %si, %edi # sched: [3:1.00]
; GENERIC-NEXT:    crc32w (%rdx), %edi # sched: [7:1.00]
; GENERIC-NEXT:    movl %edi, %eax # sched: [1:0.33]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: crc32_32_16:
; SLM:       # BB#0:
; SLM-NEXT:    crc32w %si, %edi # sched: [3:1.00]
; SLM-NEXT:    crc32w (%rdx), %edi # sched: [6:1.00]
; SLM-NEXT:    movl %edi, %eax # sched: [1:0.50]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: crc32_32_16:
; SANDY:       # BB#0:
; SANDY-NEXT:    crc32w %si, %edi # sched: [3:1.00]
; SANDY-NEXT:    crc32w (%rdx), %edi # sched: [7:1.00]
; SANDY-NEXT:    movl %edi, %eax # sched: [1:0.33]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: crc32_32_16:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    crc32w %si, %edi # sched: [3:1.00]
; HASWELL-NEXT:    crc32w (%rdx), %edi # sched: [7:1.00]
; HASWELL-NEXT:    movl %edi, %eax # sched: [1:0.25]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: crc32_32_16:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    crc32w %si, %edi # sched: [3:1.00]
; BTVER2-NEXT:    crc32w (%rdx), %edi # sched: [8:1.00]
; BTVER2-NEXT:    movl %edi, %eax # sched: [1:0.17]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: crc32_32_16:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    crc32w %si, %edi # sched: [3:1.00]
; ZNVER1-NEXT:    crc32w (%rdx), %edi # sched: [10:1.00]
; ZNVER1-NEXT:    movl %edi, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i32 @llvm.x86.sse42.crc32.32.16(i32 %a0, i16 %a1)
  %2 = load i16, i16 *%a2
  %3 = call i32 @llvm.x86.sse42.crc32.32.16(i32 %1, i16 %2)
  ret i32 %3
}
declare i32 @llvm.x86.sse42.crc32.32.16(i32, i16) nounwind

define i32 @crc32_32_32(i32 %a0, i32 %a1, i32 *%a2) {
; GENERIC-LABEL: crc32_32_32:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    crc32l %esi, %edi # sched: [3:1.00]
; GENERIC-NEXT:    crc32l (%rdx), %edi # sched: [7:1.00]
; GENERIC-NEXT:    movl %edi, %eax # sched: [1:0.33]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: crc32_32_32:
; SLM:       # BB#0:
; SLM-NEXT:    crc32l %esi, %edi # sched: [3:1.00]
; SLM-NEXT:    crc32l (%rdx), %edi # sched: [6:1.00]
; SLM-NEXT:    movl %edi, %eax # sched: [1:0.50]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: crc32_32_32:
; SANDY:       # BB#0:
; SANDY-NEXT:    crc32l %esi, %edi # sched: [3:1.00]
; SANDY-NEXT:    crc32l (%rdx), %edi # sched: [7:1.00]
; SANDY-NEXT:    movl %edi, %eax # sched: [1:0.33]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: crc32_32_32:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    crc32l %esi, %edi # sched: [3:1.00]
; HASWELL-NEXT:    crc32l (%rdx), %edi # sched: [7:1.00]
; HASWELL-NEXT:    movl %edi, %eax # sched: [1:0.25]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: crc32_32_32:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    crc32l %esi, %edi # sched: [3:1.00]
; BTVER2-NEXT:    crc32l (%rdx), %edi # sched: [8:1.00]
; BTVER2-NEXT:    movl %edi, %eax # sched: [1:0.17]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: crc32_32_32:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    crc32l %esi, %edi # sched: [3:1.00]
; ZNVER1-NEXT:    crc32l (%rdx), %edi # sched: [10:1.00]
; ZNVER1-NEXT:    movl %edi, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i32 @llvm.x86.sse42.crc32.32.32(i32 %a0, i32 %a1)
  %2 = load i32, i32 *%a2
  %3 = call i32 @llvm.x86.sse42.crc32.32.32(i32 %1, i32 %2)
  ret i32 %3
}
declare i32 @llvm.x86.sse42.crc32.32.32(i32, i32) nounwind

define i64 @crc32_64_8(i64 %a0, i8 %a1, i8 *%a2) nounwind {
; GENERIC-LABEL: crc32_64_8:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; GENERIC-NEXT:    crc32b (%rdx), %edi # sched: [8:1.00]
; GENERIC-NEXT:    movq %rdi, %rax # sched: [1:0.33]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: crc32_64_8:
; SLM:       # BB#0:
; SLM-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; SLM-NEXT:    crc32b (%rdx), %edi # sched: [6:1.00]
; SLM-NEXT:    movq %rdi, %rax # sched: [1:0.50]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: crc32_64_8:
; SANDY:       # BB#0:
; SANDY-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; SANDY-NEXT:    crc32b (%rdx), %edi # sched: [8:1.00]
; SANDY-NEXT:    movq %rdi, %rax # sched: [1:0.33]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: crc32_64_8:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; HASWELL-NEXT:    crc32b (%rdx), %edi # sched: [7:1.00]
; HASWELL-NEXT:    movq %rdi, %rax # sched: [1:0.25]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: crc32_64_8:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; BTVER2-NEXT:    crc32b (%rdx), %edi # sched: [8:1.00]
; BTVER2-NEXT:    movq %rdi, %rax # sched: [1:0.17]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: crc32_64_8:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    crc32b %sil, %edi # sched: [3:1.00]
; ZNVER1-NEXT:    crc32b (%rdx), %edi # sched: [10:1.00]
; ZNVER1-NEXT:    movq %rdi, %rax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i64 @llvm.x86.sse42.crc32.64.8(i64 %a0, i8 %a1)
  %2 = load i8, i8 *%a2
  %3 = call i64 @llvm.x86.sse42.crc32.64.8(i64 %1, i8 %2)
  ret i64 %3
}
declare i64 @llvm.x86.sse42.crc32.64.8(i64, i8) nounwind

define i64 @crc32_64_64(i64 %a0, i64 %a1, i64 *%a2) {
; GENERIC-LABEL: crc32_64_64:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    crc32q %rsi, %rdi # sched: [3:1.00]
; GENERIC-NEXT:    crc32q (%rdx), %rdi # sched: [8:1.00]
; GENERIC-NEXT:    movq %rdi, %rax # sched: [1:0.33]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: crc32_64_64:
; SLM:       # BB#0:
; SLM-NEXT:    crc32q %rsi, %rdi # sched: [3:1.00]
; SLM-NEXT:    crc32q (%rdx), %rdi # sched: [6:1.00]
; SLM-NEXT:    movq %rdi, %rax # sched: [1:0.50]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: crc32_64_64:
; SANDY:       # BB#0:
; SANDY-NEXT:    crc32q %rsi, %rdi # sched: [3:1.00]
; SANDY-NEXT:    crc32q (%rdx), %rdi # sched: [8:1.00]
; SANDY-NEXT:    movq %rdi, %rax # sched: [1:0.33]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: crc32_64_64:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    crc32q %rsi, %rdi # sched: [3:1.00]
; HASWELL-NEXT:    crc32q (%rdx), %rdi # sched: [7:1.00]
; HASWELL-NEXT:    movq %rdi, %rax # sched: [1:0.25]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: crc32_64_64:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    crc32q %rsi, %rdi # sched: [3:1.00]
; BTVER2-NEXT:    crc32q (%rdx), %rdi # sched: [8:1.00]
; BTVER2-NEXT:    movq %rdi, %rax # sched: [1:0.17]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: crc32_64_64:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    crc32q %rsi, %rdi # sched: [3:1.00]
; ZNVER1-NEXT:    crc32q (%rdx), %rdi # sched: [10:1.00]
; ZNVER1-NEXT:    movq %rdi, %rax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i64 @llvm.x86.sse42.crc32.64.64(i64 %a0, i64 %a1)
  %2 = load i64, i64 *%a2
  %3 = call i64 @llvm.x86.sse42.crc32.64.64(i64 %1, i64 %2)
  ret i64 %3
}
declare i64 @llvm.x86.sse42.crc32.64.64(i64, i64) nounwind

define i32 @test_pcmpestri(<16 x i8> %a0, <16 x i8> %a1, <16 x i8> *%a2) {
; GENERIC-LABEL: test_pcmpestri:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    movl $7, %eax # sched: [1:0.33]
; GENERIC-NEXT:    movl $7, %edx # sched: [1:0.33]
; GENERIC-NEXT:    pcmpestri $7, %xmm1, %xmm0 # sched: [4:2.67]
; GENERIC-NEXT:    movl %ecx, %esi # sched: [1:0.33]
; GENERIC-NEXT:    movl $7, %eax # sched: [1:0.33]
; GENERIC-NEXT:    movl $7, %edx # sched: [1:0.33]
; GENERIC-NEXT:    pcmpestri $7, (%rdi), %xmm0 # sched: [4:2.33]
; GENERIC-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; GENERIC-NEXT:    leal (%rcx,%rsi), %eax # sched: [1:0.50]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: test_pcmpestri:
; SLM:       # BB#0:
; SLM-NEXT:    movl $7, %eax # sched: [1:0.50]
; SLM-NEXT:    movl $7, %edx # sched: [1:0.50]
; SLM-NEXT:    pcmpestri $7, %xmm1, %xmm0 # sched: [21:21.00]
; SLM-NEXT:    movl $7, %eax # sched: [1:0.50]
; SLM-NEXT:    movl $7, %edx # sched: [1:0.50]
; SLM-NEXT:    movl %ecx, %esi # sched: [1:0.50]
; SLM-NEXT:    pcmpestri $7, (%rdi), %xmm0 # sched: [21:21.00]
; SLM-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; SLM-NEXT:    leal (%rcx,%rsi), %eax # sched: [1:1.00]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: test_pcmpestri:
; SANDY:       # BB#0:
; SANDY-NEXT:    movl $7, %eax # sched: [1:0.33]
; SANDY-NEXT:    movl $7, %edx # sched: [1:0.33]
; SANDY-NEXT:    vpcmpestri $7, %xmm1, %xmm0 # sched: [4:2.67]
; SANDY-NEXT:    movl %ecx, %esi # sched: [1:0.33]
; SANDY-NEXT:    movl $7, %eax # sched: [1:0.33]
; SANDY-NEXT:    movl $7, %edx # sched: [1:0.33]
; SANDY-NEXT:    vpcmpestri $7, (%rdi), %xmm0 # sched: [4:2.33]
; SANDY-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; SANDY-NEXT:    leal (%rcx,%rsi), %eax # sched: [1:0.50]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: test_pcmpestri:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    movl $7, %eax # sched: [1:0.25]
; HASWELL-NEXT:    movl $7, %edx # sched: [1:0.25]
; HASWELL-NEXT:    vpcmpestri $7, %xmm1, %xmm0 # sched: [18:4.00]
; HASWELL-NEXT:    movl %ecx, %esi # sched: [1:0.25]
; HASWELL-NEXT:    movl $7, %eax # sched: [1:0.25]
; HASWELL-NEXT:    movl $7, %edx # sched: [1:0.25]
; HASWELL-NEXT:    vpcmpestri $7, (%rdi), %xmm0 # sched: [18:4.00]
; HASWELL-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; HASWELL-NEXT:    leal (%rcx,%rsi), %eax # sched: [1:0.50]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: test_pcmpestri:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    movl $7, %eax # sched: [1:0.17]
; BTVER2-NEXT:    movl $7, %edx # sched: [1:0.17]
; BTVER2-NEXT:    vpcmpestri $7, %xmm1, %xmm0 # sched: [13:2.50]
; BTVER2-NEXT:    movl $7, %eax # sched: [1:0.17]
; BTVER2-NEXT:    movl $7, %edx # sched: [1:0.17]
; BTVER2-NEXT:    movl %ecx, %esi # sched: [1:0.17]
; BTVER2-NEXT:    vpcmpestri $7, (%rdi), %xmm0 # sched: [18:2.50]
; BTVER2-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; BTVER2-NEXT:    leal (%rcx,%rsi), %eax # sched: [1:0.50]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: test_pcmpestri:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    movl $7, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    movl $7, %edx # sched: [1:0.25]
; ZNVER1-NEXT:    vpcmpestri $7, %xmm1, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    movl $7, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    movl $7, %edx # sched: [1:0.25]
; ZNVER1-NEXT:    movl %ecx, %esi # sched: [1:0.25]
; ZNVER1-NEXT:    vpcmpestri $7, (%rdi), %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; ZNVER1-NEXT:    leal (%rcx,%rsi), %eax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i32 @llvm.x86.sse42.pcmpestri128(<16 x i8> %a0, i32 7, <16 x i8> %a1, i32 7, i8 7)
  %2 = load <16 x i8>, <16 x i8> *%a2, align 16
  %3 = call i32 @llvm.x86.sse42.pcmpestri128(<16 x i8> %a0, i32 7, <16 x i8> %2, i32 7, i8 7)
  %4 = add i32 %1, %3
  ret i32 %4
}
declare i32 @llvm.x86.sse42.pcmpestri128(<16 x i8>, i32, <16 x i8>, i32, i8) nounwind readnone

define <16 x i8> @test_pcmpestrm(<16 x i8> %a0, <16 x i8> %a1, <16 x i8> *%a2) {
; GENERIC-LABEL: test_pcmpestrm:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    movl $7, %eax # sched: [1:0.33]
; GENERIC-NEXT:    movl $7, %edx # sched: [1:0.33]
; GENERIC-NEXT:    pcmpestrm $7, %xmm1, %xmm0 # sched: [11:2.67]
; GENERIC-NEXT:    movl $7, %eax # sched: [1:0.33]
; GENERIC-NEXT:    movl $7, %edx # sched: [1:0.33]
; GENERIC-NEXT:    pcmpestrm $7, (%rdi), %xmm0 # sched: [11:2.33]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: test_pcmpestrm:
; SLM:       # BB#0:
; SLM-NEXT:    movl $7, %eax # sched: [1:0.50]
; SLM-NEXT:    movl $7, %edx # sched: [1:0.50]
; SLM-NEXT:    pcmpestrm $7, %xmm1, %xmm0 # sched: [17:17.00]
; SLM-NEXT:    movl $7, %eax # sched: [1:0.50]
; SLM-NEXT:    movl $7, %edx # sched: [1:0.50]
; SLM-NEXT:    pcmpestrm $7, (%rdi), %xmm0 # sched: [17:17.00]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: test_pcmpestrm:
; SANDY:       # BB#0:
; SANDY-NEXT:    movl $7, %eax # sched: [1:0.33]
; SANDY-NEXT:    movl $7, %edx # sched: [1:0.33]
; SANDY-NEXT:    vpcmpestrm $7, %xmm1, %xmm0 # sched: [11:2.67]
; SANDY-NEXT:    movl $7, %eax # sched: [1:0.33]
; SANDY-NEXT:    movl $7, %edx # sched: [1:0.33]
; SANDY-NEXT:    vpcmpestrm $7, (%rdi), %xmm0 # sched: [11:2.33]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: test_pcmpestrm:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    movl $7, %eax # sched: [1:0.25]
; HASWELL-NEXT:    movl $7, %edx # sched: [1:0.25]
; HASWELL-NEXT:    vpcmpestrm $7, %xmm1, %xmm0 # sched: [19:4.00]
; HASWELL-NEXT:    movl $7, %eax # sched: [1:0.25]
; HASWELL-NEXT:    movl $7, %edx # sched: [1:0.25]
; HASWELL-NEXT:    vpcmpestrm $7, (%rdi), %xmm0 # sched: [19:4.00]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: test_pcmpestrm:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    movl $7, %eax # sched: [1:0.17]
; BTVER2-NEXT:    movl $7, %edx # sched: [1:0.17]
; BTVER2-NEXT:    vpcmpestrm $7, %xmm1, %xmm0 # sched: [13:2.50]
; BTVER2-NEXT:    movl $7, %eax # sched: [1:0.17]
; BTVER2-NEXT:    movl $7, %edx # sched: [1:0.17]
; BTVER2-NEXT:    vpcmpestrm $7, (%rdi), %xmm0 # sched: [18:2.50]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: test_pcmpestrm:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    movl $7, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    movl $7, %edx # sched: [1:0.25]
; ZNVER1-NEXT:    vpcmpestrm $7, %xmm1, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    movl $7, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    movl $7, %edx # sched: [1:0.25]
; ZNVER1-NEXT:    vpcmpestrm $7, (%rdi), %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call <16 x i8> @llvm.x86.sse42.pcmpestrm128(<16 x i8> %a0, i32 7, <16 x i8> %a1, i32 7, i8 7)
  %2 = load <16 x i8>, <16 x i8> *%a2, align 16
  %3 = call <16 x i8> @llvm.x86.sse42.pcmpestrm128(<16 x i8> %1, i32 7, <16 x i8> %2, i32 7, i8 7)
  ret <16 x i8> %3
}
declare <16 x i8> @llvm.x86.sse42.pcmpestrm128(<16 x i8>, i32, <16 x i8>, i32, i8) nounwind readnone

define i32 @test_pcmpistri(<16 x i8> %a0, <16 x i8> %a1, <16 x i8> *%a2) {
; GENERIC-LABEL: test_pcmpistri:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    pcmpistri $7, %xmm1, %xmm0 # sched: [11:3.00]
; GENERIC-NEXT:    movl %ecx, %eax # sched: [1:0.33]
; GENERIC-NEXT:    pcmpistri $7, (%rdi), %xmm0 # sched: [17:3.00]
; GENERIC-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; GENERIC-NEXT:    leal (%rcx,%rax), %eax # sched: [1:0.50]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: test_pcmpistri:
; SLM:       # BB#0:
; SLM-NEXT:    pcmpistri $7, %xmm1, %xmm0 # sched: [17:17.00]
; SLM-NEXT:    movl %ecx, %eax # sched: [1:0.50]
; SLM-NEXT:    pcmpistri $7, (%rdi), %xmm0 # sched: [17:17.00]
; SLM-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; SLM-NEXT:    leal (%rcx,%rax), %eax # sched: [1:1.00]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: test_pcmpistri:
; SANDY:       # BB#0:
; SANDY-NEXT:    vpcmpistri $7, %xmm1, %xmm0 # sched: [11:3.00]
; SANDY-NEXT:    movl %ecx, %eax # sched: [1:0.33]
; SANDY-NEXT:    vpcmpistri $7, (%rdi), %xmm0 # sched: [17:3.00]
; SANDY-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; SANDY-NEXT:    leal (%rcx,%rax), %eax # sched: [1:0.50]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: test_pcmpistri:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    vpcmpistri $7, %xmm1, %xmm0 # sched: [11:3.00]
; HASWELL-NEXT:    movl %ecx, %eax # sched: [1:0.25]
; HASWELL-NEXT:    vpcmpistri $7, (%rdi), %xmm0 # sched: [11:3.00]
; HASWELL-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; HASWELL-NEXT:    leal (%rcx,%rax), %eax # sched: [1:0.50]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: test_pcmpistri:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    vpcmpistri $7, %xmm1, %xmm0 # sched: [6:1.00]
; BTVER2-NEXT:    movl %ecx, %eax # sched: [1:0.17]
; BTVER2-NEXT:    vpcmpistri $7, (%rdi), %xmm0 # sched: [11:1.00]
; BTVER2-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; BTVER2-NEXT:    leal (%rcx,%rax), %eax # sched: [1:0.50]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: test_pcmpistri:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    vpcmpistri $7, %xmm1, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    movl %ecx, %eax # sched: [1:0.25]
; ZNVER1-NEXT:    vpcmpistri $7, (%rdi), %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    # kill: %ECX<def> %ECX<kill> %RCX<def>
; ZNVER1-NEXT:    leal (%rcx,%rax), %eax # sched: [1:0.25]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call i32 @llvm.x86.sse42.pcmpistri128(<16 x i8> %a0, <16 x i8> %a1, i8 7)
  %2 = load <16 x i8>, <16 x i8> *%a2, align 16
  %3 = call i32 @llvm.x86.sse42.pcmpistri128(<16 x i8> %a0, <16 x i8> %2, i8 7)
  %4 = add i32 %1, %3
  ret i32 %4
}
declare i32 @llvm.x86.sse42.pcmpistri128(<16 x i8>, <16 x i8>, i8) nounwind readnone

define <16 x i8> @test_pcmpistrm(<16 x i8> %a0, <16 x i8> %a1, <16 x i8> *%a2) {
; GENERIC-LABEL: test_pcmpistrm:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    pcmpistrm $7, %xmm1, %xmm0 # sched: [11:3.00]
; GENERIC-NEXT:    pcmpistrm $7, (%rdi), %xmm0 # sched: [17:3.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: test_pcmpistrm:
; SLM:       # BB#0:
; SLM-NEXT:    pcmpistrm $7, %xmm1, %xmm0 # sched: [13:13.00]
; SLM-NEXT:    pcmpistrm $7, (%rdi), %xmm0 # sched: [13:13.00]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: test_pcmpistrm:
; SANDY:       # BB#0:
; SANDY-NEXT:    vpcmpistrm $7, %xmm1, %xmm0 # sched: [11:3.00]
; SANDY-NEXT:    vpcmpistrm $7, (%rdi), %xmm0 # sched: [17:3.00]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: test_pcmpistrm:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    vpcmpistrm $7, %xmm1, %xmm0 # sched: [11:3.00]
; HASWELL-NEXT:    vpcmpistrm $7, (%rdi), %xmm0 # sched: [11:3.00]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: test_pcmpistrm:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    vpcmpistrm $7, %xmm1, %xmm0 # sched: [7:1.00]
; BTVER2-NEXT:    vpcmpistrm $7, (%rdi), %xmm0 # sched: [12:1.00]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: test_pcmpistrm:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    vpcmpistrm $7, %xmm1, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    vpcmpistrm $7, (%rdi), %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = call <16 x i8> @llvm.x86.sse42.pcmpistrm128(<16 x i8> %a0, <16 x i8> %a1, i8 7)
  %2 = load <16 x i8>, <16 x i8> *%a2, align 16
  %3 = call <16 x i8> @llvm.x86.sse42.pcmpistrm128(<16 x i8> %1, <16 x i8> %2, i8 7)
  ret <16 x i8> %3
}
declare <16 x i8> @llvm.x86.sse42.pcmpistrm128(<16 x i8>, <16 x i8>, i8) nounwind readnone

define <2 x i64> @test_pcmpgtq(<2 x i64> %a0, <2 x i64> %a1, <2 x i64> *%a2) {
; GENERIC-LABEL: test_pcmpgtq:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    pcmpgtq %xmm1, %xmm0 # sched: [5:1.00]
; GENERIC-NEXT:    pcmpgtq (%rdi), %xmm0 # sched: [11:1.00]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: test_pcmpgtq:
; SLM:       # BB#0:
; SLM-NEXT:    pcmpgtq %xmm1, %xmm0 # sched: [1:0.50]
; SLM-NEXT:    pcmpgtq (%rdi), %xmm0 # sched: [4:1.00]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: test_pcmpgtq:
; SANDY:       # BB#0:
; SANDY-NEXT:    vpcmpgtq %xmm1, %xmm0, %xmm0 # sched: [5:1.00]
; SANDY-NEXT:    vpcmpgtq (%rdi), %xmm0, %xmm0 # sched: [11:1.00]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: test_pcmpgtq:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    vpcmpgtq %xmm1, %xmm0, %xmm0 # sched: [5:1.00]
; HASWELL-NEXT:    vpcmpgtq (%rdi), %xmm0, %xmm0 # sched: [5:1.00]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: test_pcmpgtq:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    vpcmpgtq %xmm1, %xmm0, %xmm0 # sched: [1:0.50]
; BTVER2-NEXT:    vpcmpgtq (%rdi), %xmm0, %xmm0 # sched: [6:1.00]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: test_pcmpgtq:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    vpcmpgtq %xmm1, %xmm0, %xmm0 # sched: [1:0.25]
; ZNVER1-NEXT:    vpcmpgtq (%rdi), %xmm0, %xmm0 # sched: [8:0.50]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = icmp sgt <2 x i64> %a0, %a1
  %2 = sext <2 x i1> %1 to <2 x i64>
  %3 = load <2 x i64>, <2 x i64>*%a2, align 16
  %4 = icmp sgt <2 x i64> %2, %3
  %5 = sext <2 x i1> %4 to <2 x i64>
  ret <2 x i64> %5
}

define <2 x i64> @test_pclmulqdq(<2 x i64> %a0, <2 x i64> %a1, <2 x i64> *%a2) {
; GENERIC-LABEL: test_pclmulqdq:
; GENERIC:       # BB#0:
; GENERIC-NEXT:    pclmulqdq $0, %xmm1, %xmm0 # sched: [14:6.00]
; GENERIC-NEXT:    pclmulqdq $0, (%rdi), %xmm0 # sched: [14:5.67]
; GENERIC-NEXT:    retq # sched: [1:1.00]
;
; SLM-LABEL: test_pclmulqdq:
; SLM:       # BB#0:
; SLM-NEXT:    pclmulqdq $0, %xmm1, %xmm0 # sched: [10:10.00]
; SLM-NEXT:    pclmulqdq $0, (%rdi), %xmm0 # sched: [10:10.00]
; SLM-NEXT:    retq # sched: [4:1.00]
;
; SANDY-LABEL: test_pclmulqdq:
; SANDY:       # BB#0:
; SANDY-NEXT:    vpclmulqdq $0, %xmm1, %xmm0, %xmm0 # sched: [14:6.00]
; SANDY-NEXT:    vpclmulqdq $0, (%rdi), %xmm0, %xmm0 # sched: [14:5.67]
; SANDY-NEXT:    retq # sched: [1:1.00]
;
; HASWELL-LABEL: test_pclmulqdq:
; HASWELL:       # BB#0:
; HASWELL-NEXT:    vpclmulqdq $0, %xmm1, %xmm0, %xmm0 # sched: [11:2.00]
; HASWELL-NEXT:    vpclmulqdq $0, (%rdi), %xmm0, %xmm0 # sched: [11:2.00]
; HASWELL-NEXT:    retq # sched: [2:1.00]
;
; BTVER2-LABEL: test_pclmulqdq:
; BTVER2:       # BB#0:
; BTVER2-NEXT:    vpclmulqdq $0, %xmm1, %xmm0, %xmm0 # sched: [2:1.00]
; BTVER2-NEXT:    vpclmulqdq $0, (%rdi), %xmm0, %xmm0 # sched: [7:1.00]
; BTVER2-NEXT:    retq # sched: [4:1.00]
;
; ZNVER1-LABEL: test_pclmulqdq:
; ZNVER1:       # BB#0:
; ZNVER1-NEXT:    vpclmulqdq $0, %xmm1, %xmm0, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    vpclmulqdq $0, (%rdi), %xmm0, %xmm0 # sched: [100:?]
; ZNVER1-NEXT:    retq # sched: [5:0.50]
  %1 = load <2 x i64>, <2 x i64> *%a2, align 16
  %2 = call <2 x i64> @llvm.x86.pclmulqdq(<2 x i64> %a0, <2 x i64> %a1, i8 0)
  %3 = call <2 x i64> @llvm.x86.pclmulqdq(<2 x i64> %1, <2 x i64> %2, i8 0)
  ret <2 x i64> %3
}
declare <2 x i64> @llvm.x86.pclmulqdq(<2 x i64>, <2 x i64>, i8)
