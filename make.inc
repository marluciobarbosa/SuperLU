############################################################################
#
#  Program:         SuperLU
#
#  Module:          make.inc
#
#  Purpose:         Top-level Definitions
#
#  Creation date:   May 10, 2015
#
#  Modified:	    
#		    
#
############################################################################
#
#  The name of the libraries to be created/linked to
#
# SuperLUroot	= X:/UFRJ/COPPETEC/LAMEMO/SuperLU/build
#
SuperLUroot	= C:/Program Files (x86)/SuperLU
SUPERLULIB   	= $(SuperLUroot)/SRC/libsuperlu.a

TMGLIB       	= libtmglib.a

XSDK_INDEX_SIZE = 
HAVE_METIS      = 

# BLASDEF 	= -DUSE_VENDOR_BLAS
BLASLIB		= C:/Program Files (x86)/SuperLU/CBLAS/libblas.a
LIBS		= $(SUPERLULIB) C:/Program Files (x86)/SuperLU/CBLAS/libblas.a
LIBS  += 

#
#  The archiver and the flag(s) to use when building archive (library)
#  If your system has no ranlib, set RANLIB = echo.
#
ARCH         = C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.35.32215/bin/Hostarm64/arm64/lib.exe
ARCHFLAGS    = cr
RANLIB       = :

CC           = C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.35.32215/bin/Hostarm64/arm64/cl.exe
CFLAGS 	     = /DWIN32 /D_WINDOWS /W3 
NOOPTS       = -O0
FORTRAN	     = 

LOADER       = $(CC)
LOADOPTS     =

#
# The directory in which Matlab is installed
#
MATLAB	     = /Applications/MATLAB_R2015b.app
