#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk
#Include .\WMVIDEOINFOHEADER2.ahk

/**
 * The WMMPEG2VIDEOINFO structure describes an MPEG-2 video stream.
 * @remarks
 * This structure is identical to the <b>MPEG2VIDEOINFO</b> structure defined in Dvdmedia.h. For more information, see the DirectShow documentation in the DirectX SDK.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmmpeg2videoinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMMPEG2VIDEOINFO extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmvideoinfoheader2">WMVIDEOINFOHEADER2</a> structure giving header information.
     * @type {WMVIDEOINFOHEADER2}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := WMVIDEOINFOHEADER2(0, this)
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
     * <b>AM_MPEG2Profile</b> enumeration type that specifies the MPEG-2 profile.
     * @type {Integer}
     */
    dwProfile {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * <b>AM_MPEG2Level</b> enumeration type that specifies the MPEG-2 level.
     * @type {Integer}
     */
    dwLevel {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Flag indicating preferences. Flags are defined in Dvdmedia.h.
     * 
     * Set undefined bits to zero or the connection will be rejected.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Address of a buffer that contains the sequence header, including quantization matrices and the sequence extension, if required. This field is typed as a <b>DWORD</b> array to preserve the 32-bit alignment.
     * @type {Array<UInt32>}
     */
    dwSequenceHeader{
        get {
            if(!this.HasProp("__dwSequenceHeaderProxyArray"))
                this.__dwSequenceHeaderProxyArray := Win32FixedArray(this.ptr + 132, 1, Primitive, "uint")
            return this.__dwSequenceHeaderProxyArray
        }
    }
}
