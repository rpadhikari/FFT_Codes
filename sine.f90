program sine
  implicit none
  integer(2) i
  real(8) :: x, r
  integer(4), parameter :: n = 16384
  real(8), parameter :: pi = 3.14159265358979320d0 ! value of Pi
! angular frequencies
  real(8), parameter :: w1=50.0d0, w2=100.0d0, w3=150.0d0, w4=200.0d0 
  open(1, file='sine.dat', action='write')
  do i = 0, n
    call RANDOM_NUMBER(r)
    x=dble(i)*0.0050d0
    write(1,10) x, 40.0d0*sin(w1*pi*x/180.0d0) + 20.0d0*sin(w2*pi*x/180.0d0) &
    + 79.0d0*sin(w3*pi*x/180.0d0)+5.0d0*sin(w4*pi*x/180.0d0)&
    + (2.0d0*r-1.0d0)*0.05
  end do
  10 format(f8.4, f15.8)
  close(1)
end program sine

