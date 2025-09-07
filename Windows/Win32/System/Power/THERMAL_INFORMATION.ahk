#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class THERMAL_INFORMATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ThermalStamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ThermalConstant1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ThermalConstant2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Processors {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SamplingPeriod {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CurrentTemperature {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    PassiveTripPoint {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    CriticalTripPoint {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ActiveTripPointCount {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Array<UInt32>}
     */
    ActiveTripPoint{
        get {
            if(!this.HasProp("__ActiveTripPointProxyArray"))
                this.__ActiveTripPointProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "uint")
            return this.__ActiveTripPointProxyArray
        }
    }
}
