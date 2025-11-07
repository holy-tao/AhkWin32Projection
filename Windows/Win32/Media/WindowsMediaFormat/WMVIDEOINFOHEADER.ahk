#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk

/**
 * The WMVIDEOINFOHEADER structure describes the bitmap and color information for a video image.
 * @remarks
 * 
 * This structure is identical to the DirectShow <b>VIDEOINFOHEADER</b> structure.
 * 
 * For uncompressed video of 16 or fewer bits per pixel (bpp), additional information is required. You must specify bit fields for 16 bpp and palette information for 8 or fewer bpp video. To convey this information, allocate enough consecutive memory to hold the additional information and copy the data to the memory directly following this structure. When you specify the address and size of this structure in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_media_type">WM_MEDIA_TYPE</a> structure for a stream, include the size of the palette or bit field data.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmvideoinfoheader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMVIDEOINFOHEADER extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * <b>RECT</b> structure that specifies the source video window.
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(0, this)
            return this.__rcSource
        }
    }

    /**
     * <b>RECT</b> structure that specifies the destination video window.
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(16, this)
            return this.__rcTarget
        }
    }

    /**
     * <b>DWORD</b> containing the approximate bit rate, in bits per second.
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * <b>DWORD</b> containing the error rate for this stream, in bits per second.
     * @type {Integer}
     */
    dwBitErrorRate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * When writing an ASF file, this member specifies the desired average time per frame in 100-nanosecond units. When reading an ASF file, this member is always zero.
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * <b>BITMAPINFOHEADER</b> structure that contains color and dimension information for the video image bitmap. <b>BITMAPINFOHEADER</b> is a Windows GDI structure.
     * @type {BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := BITMAPINFOHEADER(48, this)
            return this.__bmiHeader
        }
    }
}
