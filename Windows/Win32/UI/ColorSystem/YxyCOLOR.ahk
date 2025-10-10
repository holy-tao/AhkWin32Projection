#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-yxycolor
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class YxyCOLOR extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * TBD
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * TBD
     * @type {Integer}
     */
    x {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * TBD
     * @type {Integer}
     */
    y1 {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
