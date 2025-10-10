#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Description of the CMYKCOLOR structure.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-cmykcolor
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class CMYKCOLOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * TBD
     * @type {Integer}
     */
    cyan {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * TBD
     * @type {Integer}
     */
    magenta {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * TBD
     * @type {Integer}
     */
    yellow {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * TBD
     * @type {Integer}
     */
    black {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
