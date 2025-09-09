#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VBICODECFILTERING_SCANLINES.ahk
#Include .\CC_BYTE_PAIR.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class CC_HW_FIELD extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

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
    fieldFlags {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    PictureNumber {
        get => NumGet(this, 136, "int64")
        set => NumPut("int64", value, this, 136)
    }

    /**
     * @type {Array<CC_BYTE_PAIR>}
     */
    Lines{
        get {
            if(!this.HasProp("__LinesProxyArray"))
                this.__LinesProxyArray := Win32FixedArray(this.ptr + 144, 12, CC_BYTE_PAIR, "")
            return this.__LinesProxyArray
        }
    }
}
