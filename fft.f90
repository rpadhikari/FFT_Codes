! FFTW3 calling from fortran 90
! Author: Rajendra Adhikari
! Deartment of Physics, Kathmandu University
! date: 25th July, 2020

program main
  implicit none
  integer(4), parameter :: n=16384
  include 'fftw3.f'
  integer(4) i
   real(8) in(n), t(n)
  double complex out(n/2+1)
  integer(8) plan
  open(1,file='sine.dat',action='read')
  open(2,file='out.dat',action='write')
!  read input data from a file
  do i=1,n
    read(1,*) t(i), in(i) ! t(i) is time not used, in(i) is amplitude
  end do
  close(1)

!  Fourier transform starts
  call dfftw_plan_dft_r2c_1d(plan, n, in, out, FFTW_ESTIMATE)
  call dfftw_execute_dft_r2c(plan, in, out)
  call dfftw_destroy_plan(plan)

! writing output date
! division by scaling factor (dx*N), dx is defined in sine.f90
  do i = 1, n/2+1
    write (2, 11) dble(i)/3.27680d0, out(i)
  end do
  close(2)
  11 format(f12.6, 2g20.8)

end program main

