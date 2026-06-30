#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSP_NODE.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_RF_TUNER_SCAN_STATUS_S extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSP_NODE(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    CurrentFrequency {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    FrequencyRangeMin {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    FrequencyRangeMax {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    MilliSecondsLeft {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
