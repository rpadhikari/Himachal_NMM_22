function distance(a, b)
  implicit none
  real(8) distance
  integer(2) :: i
  integer(2), parameter :: n=3
  real(8) a(n), b(n)
  distance=sqrt((b(1)-a(1))**2 + (b(2)-a(2))**2 + (b(3)-a(3))**2)
end function distance

