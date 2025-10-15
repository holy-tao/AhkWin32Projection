#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_SESSION_CONNECT extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    Connected{
        get {
            if(!this.HasProp("__Connected"))
                this.__Connected := BOOLEAN(this.ptr + 0)
            return this.__Connected
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Console{
        get {
            if(!this.HasProp("__Console"))
                this.__Console := BOOLEAN(this.ptr + 1)
            return this.__Console
        }
    }
}
