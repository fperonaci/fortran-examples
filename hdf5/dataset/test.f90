program test

  use hdf5
  implicit none

  integer        :: err
  integer(hid_t) :: file_id
  integer(hid_t) :: group_id
  integer(hid_t) :: dspace_id
  integer(hid_t) :: dset_id

  !  1. open interface
  !  2. create file
  !  3. create dataspace -- rank=1,dims=[2_8]
  !  4. create group
  !  5. create dataset
  !  6. write to dataset -- data=[1._8,2._8],dims=[2_8]
  !  7. close dataset
  !  8. close group
  !  9. close dataspace
  ! 10. close file
  ! 11. close interface

  call h5open_f (err)
  call h5fcreate_f ('test.h5',H5F_ACC_TRUNC_F,file_id,err)
  call h5screate_simple_f (1,[2_8],dspace_id,err)
  call h5gcreate_f (file_id,'letterati',group_id,err)
  call h5dcreate_f (group_id,'ariosto',H5T_NATIVE_DOUBLE,dspace_id,dset_id,err)
  call h5dwrite_f (dset_id,H5T_NATIVE_DOUBLE,[1._8,2._8],[2_8],err)
  call h5dclose_f (dset_id,err)
  call h5gclose_f (group_id,err)
  call h5sclose_f (dspace_id,err)
  call h5fclose_f (file_id,err)
  call h5close_f (err)

end
