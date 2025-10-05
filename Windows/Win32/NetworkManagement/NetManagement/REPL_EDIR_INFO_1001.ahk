#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_EDIR_INFO_1001 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    rped1001_extent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
