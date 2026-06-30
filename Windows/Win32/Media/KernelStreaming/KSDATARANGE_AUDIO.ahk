#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDATARANGE_AUDIO extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange {
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(0, this)
            return this.__DataRange
        }
    }

    /**
     * @type {Integer}
     */
    MaximumChannels {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    MinimumBitsPerSample {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    MaximumBitsPerSample {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MinimumSampleFrequency {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    MaximumSampleFrequency {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
