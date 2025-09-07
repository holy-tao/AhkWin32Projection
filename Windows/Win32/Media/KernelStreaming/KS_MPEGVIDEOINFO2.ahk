#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk
#Include .\KS_VIDEOINFOHEADER2.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_MPEGVIDEOINFO2 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {KS_VIDEOINFOHEADER2}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := KS_VIDEOINFOHEADER2(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * @type {Integer}
     */
    dwStartTimeCode {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    cbSequenceHeader {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    dwProfile {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    dwLevel {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Array<UInt32>}
     */
    bSequenceHeader{
        get {
            if(!this.HasProp("__bSequenceHeaderProxyArray"))
                this.__bSequenceHeaderProxyArray := Win32FixedArray(this.ptr + 132, 4, Primitive, "uint")
            return this.__bSequenceHeaderProxyArray
        }
    }
}
