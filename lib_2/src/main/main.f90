program main

  use english_mod
  use french_mod
  use italian_mod
  use do_math_mod

  implicit none

  integer :: c

  call say_hello()
  call dis_bonjour()
  call di_buongiorno()

  call do_sum(1,2,c)

  print*, 'this is 1+2 ', c

end program main
