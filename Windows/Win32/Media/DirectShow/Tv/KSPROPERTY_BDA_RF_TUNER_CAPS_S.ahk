#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSP_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_RF_TUNER_CAPS_S extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSP_NODE(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    AnalogStandardsSupported {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DigitalStandardsSupported {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MinFrequency {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MaxFrequency {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    SettlingTime {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    AnalogSensingRange {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    DigitalSensingRange {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    MilliSecondsPerMHz {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
