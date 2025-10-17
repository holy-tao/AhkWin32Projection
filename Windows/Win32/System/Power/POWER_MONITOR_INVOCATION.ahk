#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_MONITOR_INVOCATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    Console {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RequestReason {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
