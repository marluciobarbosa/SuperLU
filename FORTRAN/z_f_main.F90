!
! Copyright (c) 2003, The Regents of the University of California, through
! Lawrence Berkeley National Laboratory (subject to receipt of any required 
! approvals from U.S. Dept. of Energy) 
! 
! All rights reserved. 
! 
! The source code is distributed under BSD license, see the file License.txt
! at the top-level directory.
!

#include "superlu_config.fh"

      program z_f_main
      integer maxn, maxnz
      parameter ( maxn = 10000, maxnz = 100000 )
#if (XSDK_INDEX_SIZE==64)
      integer*8 rowind(maxnz), colptr(maxn)
#else      
      integer rowind(maxnz), colptr(maxn)
#endif      
      complex*16  values(maxnz), b(maxn)
      integer n, nnz, nrhs, ldb, info, iopt
      integer*8 factors

      call zhbcode1(n, n, nnz, values, rowind, colptr)

      nrhs = 1
      ldb = n
      do i = 1, n
         b(i) = (1,2) + i*(3,4)
      enddo

! First, factorize the matrix. The factors are stored in *factors* handle.
      iopt = 1
      call c_fortran_zgssv( iopt, n, nnz, nrhs, values, rowind, colptr, &
           b, ldb, factors, info )
      
      if (info .eq. 0) then
         write (*,*) 'Factorization succeeded'
      else
         write(*,*) 'INFO from factorization = ', info
      endif
      
! Second, solve the system using the existing factors.
      iopt = 2
      call c_fortran_zgssv( iopt, n, nnz, nrhs, values, rowind, colptr, &
                           b, ldb, factors, info )

      if (info .eq. 0) then
         write (*,*) 'Solve succeeded'
         write (*,*) (b(i), i=1, 10)
      else
         write(*,*) 'INFO from triangular solve = ', info
      endif

! Last, free the storage allocated inside SuperLU
      iopt = 3
      call c_fortran_zgssv( iopt, n, nnz, nrhs, values, rowind, colptr, &
                           b, ldb, factors, info )
!
      stop
      end


