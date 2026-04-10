#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICE_POWER_STATE.ahk
#Include .\SYSTEM_POWER_STATE.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class CM_POWER_DATA extends Win32Struct {
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
     * @type {DEVICE_POWER_STATE}
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
     * @type {Array<DEVICE_POWER_STATE>}
     */
    PD_PowerStateMapping {
        get {
            if(!this.HasProp("__PD_PowerStateMappingProxyArray"))
                this.__PD_PowerStateMappingProxyArray := Win32FixedArray(this.ptr + 24, 7, Primitive, "int")
            return this.__PD_PowerStateMappingProxyArray
        }
    }

    /**
     * @type {SYSTEM_POWER_STATE}
     */
    PD_DeepestSystemWake {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
