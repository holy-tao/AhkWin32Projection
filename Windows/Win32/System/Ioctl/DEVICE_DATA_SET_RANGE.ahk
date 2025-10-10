#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides data set range information for use with the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-device_data_set_range
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DATA_SET_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Starting offset of the data set range in bytes, relative to the start of the volume. Must align to disk 
     *       logical sector size.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Length of the data set range, in bytes. Must be a multiple of disk logical sector size.
     * @type {Integer}
     */
    LengthInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
