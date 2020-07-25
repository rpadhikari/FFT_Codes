! Mixed sine waves with little noise
! Author: Rajendra Adhikari
! Deartment of Physics, Kathmandu University
! date: 25th July, 2020
program sine
  implicit none
  integer(2) i
  real(8) :: x, r
  integer(4), parameter :: n=16384
  real(8), parameter :: pi = 3.14159265358979320d0 ! value of Pi
  real(8) :: w1, w2, w3, w4
! Frequencies corresponding to 50, 100, 150 and 200 Hz 
  real(8), parameter :: f1=50.0d0, f2=100.0d0, f3=150.0d0, f4=200.0d0
  open(1, file='sine.dat', action='write')
! angular frequencies
  w1=2.0d0*pi*f1
  w2=2.0d0*pi*f2
  w3=2.0d0*pi*f3
  w4=2.0d0*pi*f4
  do i = 0, n
    call RANDOM_NUMBER(r)
    x=dble(i)*0.0002d0
    write(1,10) x, 20.0d0*sin(w1*x)+10.0d0*sin(w2*x)+5.0d0*sin(w3*x)&
         +2.50d0*sin(w4*x)+(2.0d0*r-1.0d0)*0.01
  end do
  10 format(f10.5 f20.15)
  close(1)
end program sine

