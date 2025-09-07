#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk

/**
 * The WMVIDEOINFOHEADER2 structure describes the bitmap and color information for a video image, including interlace, copy protection, and aspect ratio.
 * @remarks
 * This structure is identical to the <b>VIDEOINFOHEADER2</b> structure defined in Dvdmedia.h. For more information, see the DirectShow documentation in the DirectX SDK.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmvideoinfoheader2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMVIDEOINFOHEADER2 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * <b>RECT</b> structure that specifies what part of the source stream should be used to fill the destination buffer. Renderers can use this field to ask the decoders to stretch or clip.
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(this.ptr + 0)
            return this.__rcSource
        }
    }

    /**
     * <b>RECT</b> structure that specifies that specifies what part of the destination buffer should be used
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(this.ptr + 16)
            return this.__rcTarget
        }
    }

    /**
     * Approximate data rate of the video stream, in bits per second.
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Data error rate of the video stream, in bits per second.
     * @type {Integer}
     */
    dwBitErrorRate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The video frame's average display time, in 100-nanosecond units.
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Bit-wise combination of zero or more flags that describe interlacing behavior. The flags are defined in Dvdmedia.h in the DirectX SDK. Undefined bits must be set to zero or else the connection will be rejected.
     * @type {Integer}
     */
    dwInterlaceFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Flag set with the AMCOPYPROTECT_RestrictDuplication value (0x00000001) to indicate that the duplication of the stream should be restricted. Undefined bits must be set to zero or else the connection will be rejected.
     * @type {Integer}
     */
    dwCopyProtectFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The X dimension of the video rectangle's aspect ratio. For example, 16 for a 16:9 rectangle.
     * @type {Integer}
     */
    dwPictAspectRatioX {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The Y dimension of the video rectangle's aspect ratio. For example, 9 for a 16:9 rectangle.
     * @type {Integer}
     */
    dwPictAspectRatioY {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Reserved for future use. Must be zero. (Note: this is different from the corresponding member of the <b>VIDEOINFOHEADER2</b> structure used in DirectShow.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Reserved for future use. Must be zero.
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * <b>BITMAPINFOHEADER</b> structure that contains color and dimension information for the video image bitmap.
     * @type {BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := BITMAPINFOHEADER(this.ptr + 72)
            return this.__bmiHeader
        }
    }
}
