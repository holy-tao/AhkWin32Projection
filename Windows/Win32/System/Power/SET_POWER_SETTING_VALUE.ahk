#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SYSTEM_POWER_CONDITION.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class SET_POWER_SETTING_VALUE extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(4, this)
            return this.__Guid
        }
    }

    /**
     * @type {SYSTEM_POWER_CONDITION}
     */
    PowerCondition {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
