#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_SESSION_WINLOGON extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    Console{
        get {
            if(!this.HasProp("__Console"))
                this.__Console := BOOLEAN(this.ptr + 4)
            return this.__Console
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Locked{
        get {
            if(!this.HasProp("__Locked"))
                this.__Locked := BOOLEAN(this.ptr + 5)
            return this.__Locked
        }
    }
}
