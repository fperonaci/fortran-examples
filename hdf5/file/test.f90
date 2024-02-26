program test

  use hdf5
  implicit none

  character(20)  :: filename
  integer        :: error
  integer(hid_t) :: file_id

  filename = 'test.h5'

  call h5open_f    (error)
  call h5fcreate_f (filename,h5f_acc_trunc_f,file_id,error)
  call h5fclose_f  (file_id,error)
  call h5close_f   (error)

end
