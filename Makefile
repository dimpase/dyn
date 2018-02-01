CC=cc
LFLAGS = -L. -Wl,-rpath=. -lcmean

# uncomment the following for building universal libraries on MacOSX
#CFLAGS = -arch ppc -arch i386
# (strictly speaking, not needed, but prevents a warning being shown)

# the following might be .out, or .exe, or still something esle, but usually empty...
EXE=

all:	dyn.so

# building a shared C library libcmean.so 
libcmean.so: cmean.c 
	$(CC) $(CFLAGS) -fPIC -shared cmean.c -o libcmean.so

# building python extension calling a function from shared C library 
dyn.so:	m.pyx libcmean.so setup.py
	python setup.py build_ext --inplace --rpath=.

# running a Python test
runpy:	dyn.so	
	python test.py

# the following is just for comparison
# buiding a C test calling a function from C library 
dync: main.c libcmean.so
	$(CC) $(CFLAGS) main.c -o dync$(EXE) $(LFLAGS)

# running a C test
runc: dync libcmean.so
	./dync$(EXE)

clean:
	rm -rf core *.out *.o *.so *.pyc *.dSYM dync$(EXE) m.c *~ build/


