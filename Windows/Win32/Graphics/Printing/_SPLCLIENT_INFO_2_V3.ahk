#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class _SPLCLIENT_INFO_2_V3 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hSplPrinter {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
