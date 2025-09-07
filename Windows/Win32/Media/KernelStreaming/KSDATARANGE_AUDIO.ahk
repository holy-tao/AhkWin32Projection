#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSDATAFORMAT.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDATARANGE_AUDIO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {KSDATAFORMAT}
     */
    DataRange{
        get {
            if(!this.HasProp("__DataRange"))
                this.__DataRange := KSDATAFORMAT(this.ptr + 0)
            return this.__DataRange
        }
    }

    /**
     * @type {Integer}
     */
    MaximumChannels {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MinimumBitsPerSample {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    MaximumBitsPerSample {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    MinimumSampleFrequency {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    MaximumSampleFrequency {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
