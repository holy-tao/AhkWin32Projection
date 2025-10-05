#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Description of the GRAYCOLOR structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-graycolor
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class GRAYCOLOR extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * TBD
     * @type {Integer}
     */
    gray {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
