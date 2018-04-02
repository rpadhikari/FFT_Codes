program test
  implicit none
   integer :: n, i
  real(8) , allocatable :: t(:), in(:)
  double complex , allocatable :: out(:)
  integer*8 plan
  include 'fftw3.f90'
  open(1,file='sine.dat', action='read',status='old')
  open(2,file='out.dat', action='write')
  n=1000
  allocate(t(n),in(n),out(n/2+1))
  do i=1,n
    read(1,*) t(i), in(i)
  enddo
  close(1)
! do fourier transformation  
  call dfftw_plan_dft_r2c_1d_(plan,n,in,out,FFTW_ESTIMATE)
  call dfftw_execute_dft_r2c_(plan, in, out)
  call dfftw_destroy_plan_(plan)  
  
  do i=1,n/2+1
    write(2,10) i, out(i)
  end do
  close(2)
  10 format(i6,2g24.15)
  deallocate(t,in,out)
end program test

