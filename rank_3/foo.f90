!====================================================================!
module my_type

  use, intrinsic :: iso_fortran_env, &
       ip => INT32, &
       wp => REAL64

  implicit none

contains

  !==================================================================!
  subroutine what_is_me(array)

    real (wp),      intent (in)    :: array(..)

    print*, rank(array)

  end subroutine
  !==================================================================!

  !==================================================================!
  subroutine yeah(a,b)

    real (wp),      intent (in)    :: a(..)
    real (wp),      intent (in)    :: b(..)
    real (wp)                      :: c

    print*, a

!   print*, abs(a)

  end subroutine
  !==================================================================!

end module my_type
!====================================================================!

!====================================================================!
program main

  use, intrinsic :: iso_fortran_env, only: &
       ip => INT32, &
       wp => REAL64

  use my_type

  implicit none

  real (wp)     :: a0, a1(42), a2(42,42), a3(42,42,42)

  call what_is_me(a0)
  call what_is_me(a1)
  call what_is_me(a2)
  call what_is_me(a3)

end program main
!====================================================================!
