#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_SCANLINES.ahk
#Include .\NABTS_BUFFER_LINE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class NABTS_BUFFER extends Win32Struct
{
    static sizeof => 224

    static packingSize => 1

    /**
     * @type {VBICODECFILTERING_SCANLINES}
     */
    ScanlinesRequested{
        get {
            if(!this.HasProp("__ScanlinesRequested"))
                this.__ScanlinesRequested := VBICODECFILTERING_SCANLINES(this.ptr + 0)
            return this.__ScanlinesRequested
        }
    }

    /**
     * @type {Integer}
     */
    PictureNumber {
        get => NumGet(this, 128, "int64")
        set => NumPut("int64", value, this, 128)
    }

    /**
     * @type {Array<NABTS_BUFFER_LINE>}
     */
    NabtsLines{
        get {
            if(!this.HasProp("__NabtsLinesProxyArray"))
                this.__NabtsLinesProxyArray := Win32FixedArray(this.ptr + 136, 8, NABTS_BUFFER_LINE, "")
            return this.__NabtsLinesProxyArray
        }
    }
}
