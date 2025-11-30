#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class POWER_SESSION_CONNECT extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    Connected {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    Console {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
