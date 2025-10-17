#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_EDIR_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    rped0_dirname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
