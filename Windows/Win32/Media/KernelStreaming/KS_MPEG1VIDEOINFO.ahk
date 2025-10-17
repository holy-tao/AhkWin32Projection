#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_MPEG1VIDEOINFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {KS_VIDEOINFOHEADER}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := KS_VIDEOINFOHEADER(0, this)
            return this.__hdr
        }
    }

    /**
     * @type {Integer}
     */
    dwStartTimeCode {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    cbSequenceHeader {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Array<Byte>}
     */
    bSequenceHeader{
        get {
            if(!this.HasProp("__bSequenceHeaderProxyArray"))
                this.__bSequenceHeaderProxyArray := Win32FixedArray(this.ptr + 96, 1, Primitive, "char")
            return this.__bSequenceHeaderProxyArray
        }
    }
}
