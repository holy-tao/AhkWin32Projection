#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The WMVIDEOINFOHEADER2 structure describes the bitmap and color information for a video image, including interlace, copy protection, and aspect ratio.
 * @remarks
 * This structure is identical to the <b>VIDEOINFOHEADER2</b> structure defined in Dvdmedia.h. For more information, see the DirectShow documentation in the DirectX SDK.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmvideoinfoheader2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMVIDEOINFOHEADER2 {
    #StructPack 8

    /**
     * <b>RECT</b> structure that specifies what part of the source stream should be used to fill the destination buffer. Renderers can use this field to ask the decoders to stretch or clip.
     */
    rcSource : RECT

    /**
     * <b>RECT</b> structure that specifies that specifies what part of the destination buffer should be used
     */
    rcTarget : RECT

    /**
     * Approximate data rate of the video stream, in bits per second.
     */
    dwBitRate : UInt32

    /**
     * Data error rate of the video stream, in bits per second.
     */
    dwBitErrorRate : UInt32

    /**
     * The video frame's average display time, in 100-nanosecond units.
     */
    AvgTimePerFrame : Int64

    /**
     * Bit-wise combination of zero or more flags that describe interlacing behavior. The flags are defined in Dvdmedia.h in the DirectX SDK. Undefined bits must be set to zero or else the connection will be rejected.
     */
    dwInterlaceFlags : UInt32

    /**
     * Flag set with the AMCOPYPROTECT_RestrictDuplication value (0x00000001) to indicate that the duplication of the stream should be restricted. Undefined bits must be set to zero or else the connection will be rejected.
     */
    dwCopyProtectFlags : UInt32

    /**
     * The X dimension of the video rectangle's aspect ratio. For example, 16 for a 16:9 rectangle.
     */
    dwPictAspectRatioX : UInt32

    /**
     * The Y dimension of the video rectangle's aspect ratio. For example, 9 for a 16:9 rectangle.
     */
    dwPictAspectRatioY : UInt32

    /**
     * Reserved for future use. Must be zero. (Note: this is different from the corresponding member of the <b>VIDEOINFOHEADER2</b> structure used in DirectShow.
     */
    dwReserved1 : UInt32

    /**
     * Reserved for future use. Must be zero.
     */
    dwReserved2 : UInt32

    /**
     * <b>BITMAPINFOHEADER</b> structure that contains color and dimension information for the video image bitmap.
     */
    bmiHeader : BITMAPINFOHEADER

}
