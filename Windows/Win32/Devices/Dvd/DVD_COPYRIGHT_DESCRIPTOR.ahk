#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_COPYRIGHT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    CopyrightProtectionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RegionManagementInformation {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
