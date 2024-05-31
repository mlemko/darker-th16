# makefile

th16/th16.dat: original/th16.dat modified/th16dat/st01wl.anm modified/th16dat/st01.std modified/th16dat
	thdat -c16 ./th16/th16.dat ./modified/th16dat/*

original/th16.dat:
	mv ./th16/th16.dat ./original/th16.dat

modified/th16dat/st01wl.anm: original/th16dat/st01wl.anm modified/st01wlanm/spec.txt modified/st01wlanm
	cd ./modified/st01wlanm; \
	thanm -c16 ../th16dat/st01wl.anm spec.txt

modified/st01wlanm/spec.txt:
	thanm -l16 ./modified/th16dat/st01wl.anm > modified/st01wlanm/spec.txt

original/th16dat/st01wl.anm: original/th16.dat
	mkdir -p original/th16dat
	thdat -x16 ./original/th16.dat -C ./original/th16dat st01wl.anm

modified/th16dat/st01.std: original/th16dat/st01.std modified/st01std/script.txt
	cd ./modified/st01std; \
	thstd -c16 script.txt ../th16dat/st01.std

modified/st01std/script.txt:
	mkdir -p modified/st01std
	thstd -d16 ./modified/th16dat/st01.std ./modified/st01std/script.txt

original/th16dat/st01.std: original/th16.dat
	mkdir -p original/th16dat
	thdat -x16 ./original/th16.dat -C ./original/th16dat st01.std
