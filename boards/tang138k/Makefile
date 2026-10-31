GW_SH ?= gw_sh

.PHONY: all firmware clean

all: firmware
	$(GW_SH) scripts/build.tcl

firmware:
	$(MAKE) -C ../firmware

clean:
	rm -rf build
