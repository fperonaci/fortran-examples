!====================================================================!
module my_type

  use, intrinsic :: iso_fortran_env, &
       ip => INT32, &
       wp => REAL64

  implicit none
  private
  public :: MyType

  !==================================================================!
  type MyType
     real (wp)              :: rank0
     real (wp), allocatable :: rank1(:)
     real (wp), allocatable :: rank2(:,:)
     real (wp), allocatable :: rank3(:,:,:)
   contains
     procedure :: create => create_my_type
     procedure :: destroy => destroy_my_type
  end type MyType
  !==================================================================!

contains

  !==================================================================!
  subroutine create_my_type(this,array)

    class (MyType), intent (inout) :: this
    real (wp),      intent (in)    :: array(..)
    integer (ip),   allocatable    :: r(:)

    select rank (array)
    rank (0)
       return
    rank (1)
       r = shape(array)
       allocate( this%rank1(r(1)) )
    rank (2)
       r = shape(array)
       allocate( this%rank2(r(1), r(2)) )
    rank (3)
       r = shape(array)
       allocate( this%rank3(r(1), r(2), r(3)) )
    end select

    if (allocated(r)) deallocate( r )

  end subroutine create_my_type
  !==================================================================!

  !==================================================================!
  subroutine destroy_my_type(this)

    class (MyType), intent (inout) :: this

    if (allocated(this%rank1)) deallocate( this%rank1 )
    if (allocated(this%rank2)) deallocate( this%rank2 )
    if (allocated(this%rank3)) deallocate( this%rank3 )

  end subroutine destroy_my_type
  !==================================================================!

end module my_type
!====================================================================!

!====================================================================!
program main

  use, intrinsic :: iso_fortran_env, only: &
       ip => INT32, &
       wp => REAL64

  use my_type, only: &
       MyType

  implicit none

  type (MyType) :: foo
  real (wp)     :: a0, a1(42), a2(42,42), a3(42,42,42)

  print *, rank(a0)
  print *, rank(a1)
  print *, rank(a2)
  print *, rank(a3)

  ! Allocate array of rank 3
  call foo%create(a3)

  print *, rank(foo%rank3)
  print *, shape(foo%rank3)
  print *, size(foo%rank3)

  ! Release memory
  call foo%destroy()

end program main
!====================================================================!
