#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * STORAGE_HW_FIRMWARE_INFO_QUERY structure - This structure contains information about the device firmware.
 * @see https://learn.microsoft.com/windows/win32/FileIO/storage-hw-firmware-info-query
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_FIRMWARE_INFO_QUERY {
    #StructPack 4

    /**
     * The version of this structure. This should be set to sizeof(STORAGE\_HW\_FIRMWARE\_INFO\_QUERY)
     */
    Version : UInt32

    /**
     * The size of this structure as a buffer.
     */
    Size : UInt32

    /**
     * The flags associated with the query. The following are flags that can be set in this member.
     * 
     * 
     * 
     * | Flag                                             | Description                                                                        |
     * |--------------------------------------------------|------------------------------------------------------------------------------------|
     * | STORAGE\_HW\_FIRMWARE\_REQUEST\_FLAG\_CONTROLLER | Indicates that the target of the request other than the device hand/object itself. |
     */
    Flags : UInt32

    /**
     * Reserved for future use.
     */
    Reserved : UInt32

}
