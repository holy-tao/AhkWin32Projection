#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1600 extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    sv1598_disabledos {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
