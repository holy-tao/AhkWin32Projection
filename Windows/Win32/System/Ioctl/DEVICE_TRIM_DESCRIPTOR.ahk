#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY request to retrieve the trim descriptor data for a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_trim_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_TRIM_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * Specifies whether trim is enabled for the device.
     */
    TrimEnabled : BOOLEAN

}
