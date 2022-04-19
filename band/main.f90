program main
  implicit none
  integer(2) :: i
  integer(2), parameter :: n=3
  real(8) :: a(n), b(n)
  real(8) :: dist
  real(8), external :: distance
  write(*,*) ' Type the coordinates of point A '
  read(*,*) (a(i), i=1,n)
  write(*,*) ' Type the coordinates of point B '
  read(*,*) (b(i), i=1,n)
  write(*,*) ' the distance is', distance(a,b)
end program main
