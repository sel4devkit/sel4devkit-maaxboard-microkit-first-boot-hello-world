# Introduction

This Package forms part of the seL4 Developer Kit. It provides a fully
coordinated build of MaaXBoard Microkit Hello World.

Its main purpose is to confirm first boot, demonstrating that the overall
environment is functioning as intended.

# Usage

Must be invoked inside the following:
* sel4devkit-maaxboard-microkit-docker-dev-env

Show usage instructions:
```
make
```

Build program:
```
make all
```

Expected output where executed on target:
```
Load address: 0x50000000
Loading: #################################################################
         #################################################################
         #################################################
         11 MiB/s
done
Bytes transferred = 2626228 (2812b4 hex)
Step 3: Execute from Address (0x50000000)
## Starting application at 0x50000000 ...
LDR|INFO: altloader for seL4 starting
LDR|INFO: Flags:                0x0000000000000001
             seL4 configured as hypervisor
LDR|INFO: Kernel:      entry:   0x0000008040000000
LDR|INFO: Root server: physmem: 0x0000000040270000 -- 0x0000000040277000
LDR|INFO:              virtmem: 0x000000008a000000 -- 0x000000008a007000
LDR|INFO:              entry  : 0x000000008a000000
LDR|INFO: region: 0x00000000   addr: 0x0000000040000000   size: 0x000000000024c000   offset: 0x0000000000000000   type: 0x01
LDR|INFO: region: 0x00000001   addr: 0x0000000040270000   size: 0x0000000000006b40   offset: 0x000000000024c000   type: 0x01
LDR|INFO: region: 0x00000002   addr: 0x000000004024c000   size: 0x00000000000011a8   offset: 0x0000000000252b40   type: 0x01
LDR|INFO: region: 0x00000003   addr: 0x000000004024e000   size: 0x000000000000046c   offset: 0x0000000000253ce8   type: 0x01
LDR|INFO: region: 0x00000004   addr: 0x000000004024f000   size: 0x0000000000020070   offset: 0x0000000000254154   type: 0x01
LDR|INFO: copying region 0x00000000
LDR|INFO: copying region 0x00000001
LDR|INFO: copying region 0x00000002
LDR|INFO: copying region 0x00000003
LDR|INFO: copying region 0x00000004
LDR|INFO: CurrentEL=EL2
LDR|INFO: Resetting CNTVOFF
LDR|INFO: enabling MMU
LDR|INFO: jumping to kernel
Warning:  gpt_cntfrq 8333333, expected 8000000
Bootstrapping kernel
available phys memory regions: 1
  [40000000..c0000000]
reserved virt address space regions: 3
  [8040000000..804024c000]
  [804024c000..8040270000]
  [8040270000..8040277000]
Booting all finished, dropped to user space
MON|INFO: Microkit Bootstrap
MON|INFO: bootinfo untyped list matches expected list
MON|INFO: Number of bootstrap invocations: 0x00000009
MON|INFO: Number of system invocations:    0x0000003f
MON|INFO: completed bootstrap invocations
MON|INFO: completed system invocations
hello, world
```
