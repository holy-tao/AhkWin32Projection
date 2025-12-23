#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Power\SYSTEM_BATTERY_STATE.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SYSTEM_POWER_SOURCE_STATE extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {SYSTEM_BATTERY_STATE}
     */
    BatteryState{
        get {
            if(!this.HasProp("__BatteryState"))
                this.__BatteryState := SYSTEM_BATTERY_STATE(0, this)
            return this.__BatteryState
        }
    }

    /**
     * @type {Integer}
     */
    InstantaneousPeakPower {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    InstantaneousPeakPeriod {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    SustainablePeakPower {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    SustainablePeakPeriod {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    PeakPower {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaxOutputPower {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    MaxInputPower {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    BatteryRateInCurrent {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    BatteryVoltage {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
