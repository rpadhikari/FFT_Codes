program test
  implicit none
  include 'fftw3.f'
  integer :: n, i
  integer(4) :: plan
  real(8), allocatable :: in(:), out(:)

  open(1,file='sine.dat',action='read')
  open(2,file='out.dat',action='write')
  n=361
  allocate(in(n))
  allocate(out(n))
  do i=1,n
    read(1,*) in(i)
  enddo
  close(1)
! Forward Fourier transform
  call dfftw_plan_dft_1d(plan,n,in,out,FFTW_FORWARD,FFTW_ESTIMATE)
  call dfftw_execute(plan)
  call dfftw_destroy_plan(plan)

  do i=1,n
    write(2,*) out(i)
  enddo
  close(2)
end program test

