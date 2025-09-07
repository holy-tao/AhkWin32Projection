#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk
#Include .\VIDEOINFOHEADER2.ahk

/**
 * The MPEG2VIDEOINFO structure describes an MPEG-2 video stream.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure contained in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure (<b>hdr</b>) cannot be followed by any palette entries or color masks, because this structure is immediately followed by the <b>dwStartTimeCode</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-mpeg2videoinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MPEG2VIDEOINFO extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     * @type {VIDEOINFOHEADER2}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := VIDEOINFOHEADER2(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * 25-bit group-of-pictures (GOP) time code at start of data. This field is not used for DVD.
     * @type {Integer}
     */
    dwStartTimeCode {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Length of the sequence header, in bytes. For DVD, set this field to zero. The sequence header is given in the <b>dwSequenceHeader</b> field.
     * @type {Integer}
     */
    cbSequenceHeader {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Specifies the MPEG-2 profile as an <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_mpeg2profile">AM_MPEG2Profile</a> enumeration type.
     * @type {Integer}
     */
    dwProfile {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Specifies the MPEG-2 level as an <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_mpeg2level">AM_MPEG2Level</a> enumeration type.
     * @type {Integer}
     */
    dwLevel {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Start of an array that contains the sequence header, including quantization matrices and the sequence extension, if required. This field is typed as <b>DWORD</b> array to enforce 32-bit alignment. The size of the array, in bytes, is given in the <b>cbSequenceHeader</b> member.
     * @type {Array<UInt32>}
     */
    dwSequenceHeader{
        get {
            if(!this.HasProp("__dwSequenceHeaderProxyArray"))
                this.__dwSequenceHeaderProxyArray := Win32FixedArray(this.ptr + 132, 4, Primitive, "uint")
            return this.__dwSequenceHeaderProxyArray
        }
    }
}
