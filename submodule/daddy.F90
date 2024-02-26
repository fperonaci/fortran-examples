
module daddy

  integer, public, parameter :: a = 2

  public :: say_hello

  interface

  module subroutine say_hello()
  end subroutine

  end interface

end module
