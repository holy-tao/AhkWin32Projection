#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_SESSION_RIT_STATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {BOOLEAN}
     */
    Active{
        get {
            if(!this.HasProp("__Active"))
                this.__Active := BOOLEAN(this.ptr + 0)
            return this.__Active
        }
    }

    /**
     * @type {Integer}
     */
    LastInputTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
