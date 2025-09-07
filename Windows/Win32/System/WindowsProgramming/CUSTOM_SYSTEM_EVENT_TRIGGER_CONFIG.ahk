#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    TriggerId{
        get {
            if(!this.HasProp("__TriggerId"))
                this.__TriggerId := PWSTR(this.ptr + 8)
            return this.__TriggerId
        }
    }
}
