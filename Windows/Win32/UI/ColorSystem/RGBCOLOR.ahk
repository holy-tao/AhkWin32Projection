#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD (RGBCOLOR)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-rgbcolor
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class RGBCOLOR extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * TBD
     * @type {Integer}
     */
    red {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * TBD
     * @type {Integer}
     */
    green {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * TBD
     * @type {Integer}
     */
    blue {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
