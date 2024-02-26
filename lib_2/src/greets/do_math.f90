module do_math_mod

contains

subroutine do_sum(a,b,c)

  integer, intent(in) :: a, b
  integer, intent(out) :: c

  c = a + b

end subroutine do_sum

end module do_math_mod
