CC=cc
LFLAGS = -L. -Wl,-rpath=. -lcmean

# uncomment the following for building universal libraries on MacOSX
#CFLAGS = -arch ppc -arch i386
# (strictly speaking, not needed, but prevents a warning being shown)

# the following might be .out, or .exe, or still something esle, but usually empty...
EXE=

all:	dyn

# building a shared C library libcmean.so 
libcmean.so: cmean.c 
	$(CC) $(CFLAGS) -fPIC -shared cmean.c -o libcmean.so


# building python extension calling a function from shared C library 
dyn:	m.cpp libcmean.so
	$(CXX) -O3 -Wall -shared -std=c++2b -fPIC $(shell python3 -m pybind11 --includes) m.cpp -o dyn$(shell python3-config --extension-suffix) $(LFLAGS)

# running a Python test
runpy:	dyn
	python test.py

# the following is just for comparison
# buiding a C test calling a function from C library 
dync: main.c libcmean.so
	$(CC) $(CFLAGS) main.c -o dync$(EXE) $(LFLAGS)

# buiding a C++ test calling a function from C library 
dyncpp: main.cpp libcmean.so
	$(CXX)  -std=c++2b $(CXXFLAGS) main.cpp -o dyncpp$(EXE) $(LFLAGS)

# running a C test
runc: dync libcmean.so
	./dync$(EXE)

# running a C++ test
runcpp: dyncpp libcmean.so
	./dyncpp$(EXE)

clean:
	rm -rf core *.out *.o *.so *.pyc *.dSYM dync$(EXE) dyncpp$(EXE) *~ build/ *.dylib
