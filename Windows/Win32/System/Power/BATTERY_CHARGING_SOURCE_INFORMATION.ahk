#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_CHARGING_SOURCE_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    SourceOnline{
        get {
            if(!this.HasProp("__SourceOnline"))
                this.__SourceOnline := BOOLEAN(this.ptr + 4)
            return this.__SourceOnline
        }
    }
}
