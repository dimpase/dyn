from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
ext_modules=[
   Extension("dyn",
             ["m.pyx"],
	     library_dirs = ['.'],
             libraries=["cmean"]) # Unix-like specific
]
setup(
   name = "Demos",
   cmdclass = {"build_ext": build_ext},
   ext_modules = ext_modules
)
