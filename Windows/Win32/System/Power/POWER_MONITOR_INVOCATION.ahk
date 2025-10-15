#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
    Console{
        get {
            if(!this.HasProp("__Console"))
                this.__Console := BOOLEAN(this.ptr + 0)
            return this.__Console
        }
    }

    /**
     * @type {Integer}
     */
    RequestReason {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
