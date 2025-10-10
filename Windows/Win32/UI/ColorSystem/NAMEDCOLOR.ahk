#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-namedcolor
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class NAMEDCOLOR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * TBD
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
