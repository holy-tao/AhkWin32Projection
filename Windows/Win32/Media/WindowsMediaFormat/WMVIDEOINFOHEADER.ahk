#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The WMVIDEOINFOHEADER structure describes the bitmap and color information for a video image.
 * @remarks
 * This structure is identical to the DirectShow <b>VIDEOINFOHEADER</b> structure.
 * 
 * For uncompressed video of 16 or fewer bits per pixel (bpp), additional information is required. You must specify bit fields for 16 bpp and palette information for 8 or fewer bpp video. To convey this information, allocate enough consecutive memory to hold the additional information and copy the data to the memory directly following this structure. When you specify the address and size of this structure in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_media_type">WM_MEDIA_TYPE</a> structure for a stream, include the size of the palette or bit field data.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmvideoinfoheader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMVIDEOINFOHEADER {
    #StructPack 8

    /**
     * <b>RECT</b> structure that specifies the source video window.
     */
    rcSource : RECT

    /**
     * <b>RECT</b> structure that specifies the destination video window.
     */
    rcTarget : RECT

    /**
     * <b>DWORD</b> containing the approximate bit rate, in bits per second.
     */
    dwBitRate : UInt32

    /**
     * <b>DWORD</b> containing the error rate for this stream, in bits per second.
     */
    dwBitErrorRate : UInt32

    /**
     * When writing an ASF file, this member specifies the desired average time per frame in 100-nanosecond units. When reading an ASF file, this member is always zero.
     */
    AvgTimePerFrame : Int64

    /**
     * <b>BITMAPINFOHEADER</b> structure that contains color and dimension information for the video image bitmap. <b>BITMAPINFOHEADER</b> is a Windows GDI structure.
     */
    bmiHeader : BITMAPINFOHEADER

}
