#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_SESSION_ALLOW_EXTERNAL_DMA_DEVICES extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    IsAllowed{
        get {
            if(!this.HasProp("__IsAllowed"))
                this.__IsAllowed := BOOLEAN(this.ptr + 0)
            return this.__IsAllowed
        }
    }
}
