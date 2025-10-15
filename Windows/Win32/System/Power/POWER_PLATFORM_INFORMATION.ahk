#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_PLATFORM_INFORMATION extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    AoAc{
        get {
            if(!this.HasProp("__AoAc"))
                this.__AoAc := BOOLEAN(this.ptr + 0)
            return this.__AoAc
        }
    }
}
