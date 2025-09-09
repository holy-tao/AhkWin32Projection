#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class CM_POWER_DATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PD_Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PD_MostRecentPowerState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PD_Capabilities {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PD_D1Latency {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    PD_D2Latency {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PD_D3Latency {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Int32>}
     */
    PD_PowerStateMapping{
        get {
            if(!this.HasProp("__PD_PowerStateMappingProxyArray"))
                this.__PD_PowerStateMappingProxyArray := Win32FixedArray(this.ptr + 24, 7, Primitive, "int")
            return this.__PD_PowerStateMappingProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PD_DeepestSystemWake {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
