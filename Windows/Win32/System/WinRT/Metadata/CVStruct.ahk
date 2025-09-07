#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CVStruct extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Major {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Minor {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Sub {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Build {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }
}
