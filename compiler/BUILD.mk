
# include compiler/binutils/BUILD.mk
# include compiler/gcc-14.1-patched/BUILD.mk
# include compiler/gdb/BUILD.mk
include compiler/llvm/BUILD.mk

cosmocc: llvm
.PHONY: cosmocc
