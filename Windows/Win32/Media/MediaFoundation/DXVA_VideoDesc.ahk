#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA_Frequency.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_VideoDesc extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SampleWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SampleHeight {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SampleFormat {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    d3dFormat {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {DXVA_Frequency}
     */
    InputSampleFreq{
        get {
            if(!this.HasProp("__InputSampleFreq"))
                this.__InputSampleFreq := DXVA_Frequency(20, this)
            return this.__InputSampleFreq
        }
    }

    /**
     * @type {DXVA_Frequency}
     */
    OutputFrameFreq{
        get {
            if(!this.HasProp("__OutputFrameFreq"))
                this.__OutputFrameFreq := DXVA_Frequency(28, this)
            return this.__OutputFrameFreq
        }
    }
}
