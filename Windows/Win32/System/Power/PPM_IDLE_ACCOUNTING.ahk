#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PPM_IDLE_STATE_ACCOUNTING.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PPM_IDLE_ACCOUNTING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    StateCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TotalTransitions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ResetCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<PPM_IDLE_STATE_ACCOUNTING>}
     */
    State{
        get {
            if(!this.HasProp("__StateProxyArray"))
                this.__StateProxyArray := Win32FixedArray(this.ptr + 24, 1, PPM_IDLE_STATE_ACCOUNTING, "")
            return this.__StateProxyArray
        }
    }
}
