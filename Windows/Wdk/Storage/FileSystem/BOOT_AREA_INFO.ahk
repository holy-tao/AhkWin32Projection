#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the output for the FSCTL_GET_BOOT_AREA_INFO control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-boot_area_info
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct BOOT_AREA_INFO {
    #StructPack 8

    /**
     * Number of elements in the <b>BootSectors</b> array.
     */
    BootSectorCount : UInt32

    Offset : Int64

}
