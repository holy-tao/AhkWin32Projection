#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk
#Include .\VIDEOINFOHEADER.ahk

/**
 * The MPEG1VIDEOINFO structure describes an MPEG-1 video stream.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-mpeg1videoinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MPEG1VIDEOINFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure.
     * @type {VIDEOINFOHEADER}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := VIDEOINFOHEADER(0, this)
            return this.__hdr
        }
    }

    /**
     * 25-bit group-of-pictures (GOP) time code at start of data.
     * @type {Integer}
     */
    dwStartTimeCode {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Length of the <b>bSequenceHeader</b> member, in bytes.
     * @type {Integer}
     */
    cbSequenceHeader {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Start of an array that contains the sequence header, including quantization matrices, if any. The size of the array is given in the <b>cbSequenceHeader</b> member.
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
