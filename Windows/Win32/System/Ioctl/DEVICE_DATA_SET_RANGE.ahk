#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides data set range information for use with the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_data_set_range
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_RANGE {
    #StructPack 8

    /**
     * Starting offset of the data set range in bytes, relative to the start of the volume. Must align to disk 
     *       logical sector size.
     */
    StartingOffset : Int64

    /**
     * Length of the data set range, in bytes. Must be a multiple of disk logical sector size.
     */
    LengthInBytes : Int64

}
