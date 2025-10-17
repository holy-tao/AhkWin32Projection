#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the output for the FSCTL_GET_BOOT_AREA_INFO control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-boot_area_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class BOOT_AREA_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Number of elements in the <b>BootSectors</b> array.
     * @type {Integer}
     */
    BootSectorCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
