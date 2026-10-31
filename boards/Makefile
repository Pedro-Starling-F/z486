.PHONY: all sim kv260 kv260-sim kv260-package kv260-cpu kv260-cpu-x87 \
	de10nano de10nano-fmax de10nano-cpu de10nano-cpu-x87 tang138k clean

all: sim

sim:
	$(MAKE) -C common/sim

kv260:
	$(MAKE) -C kv260

kv260-sim:
	$(MAKE) -C kv260 sim

kv260-package:
	$(MAKE) -C kv260 package

kv260-cpu:
	$(MAKE) -C kv260 cpu $(if $(CPU_MHZ),CPU_MHZ=$(CPU_MHZ))

kv260-cpu-x87:
	$(MAKE) -C kv260 cpu-x87 $(if $(CPU_MHZ),CPU_MHZ=$(CPU_MHZ))

de10nano:
	$(MAKE) -C de10nano

de10nano-fmax:
	$(MAKE) -C de10nano fmax

de10nano-cpu:
	$(MAKE) -C de10nano cpu $(if $(CPU_MHZ),CPU_MHZ=$(CPU_MHZ))

de10nano-cpu-x87:
	$(MAKE) -C de10nano cpu-x87 $(if $(CPU_MHZ),CPU_MHZ=$(CPU_MHZ))

tang138k:
	$(MAKE) -C tang138k

clean:
	$(MAKE) -C common/sim clean
	$(MAKE) -C kv260 clean
	$(MAKE) -C de10nano clean
	$(MAKE) -C tang138k clean
