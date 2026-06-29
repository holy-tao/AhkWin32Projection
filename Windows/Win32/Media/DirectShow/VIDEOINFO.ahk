#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\TRUECOLORINFO.ahk" { TRUECOLORINFO }
#Import "..\..\Graphics\Gdi\RGBQUAD.ahk" { RGBQUAD }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The VIDEOINFO structure is equivalent to a VIDEOINFOHEADER structure, but it contains enough memory to hold three color masks plus a color table with 256 colors.If you are writing a video filter, you can use this structure to guarantee that the format block always has enough memory to contain the largest possible VIDEOINFOHEADER structure.
 * @remarks
 * Never use this structure unless you are sure that you will use it only to store standard RGB formats. If you store anything other than standard RGB, the variable size of the <b>bmiHeader</b> structure will almost certainly cause problems, and you should use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure instead. If you find it absolutely necessary to use the <b>VIDEOINFO</b> structure, do not access the <b>TrueColorInfo</b>, <b>dwBitMasks</b>, or <b>bmiColors</b> members directly. Instead, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd407230(v=vs.85)">TRUECOLOR</a>, <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-colors">COLORS</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-bitmasks">BITMASKS</a> macros to return the pointers to the color information. Which of these members is valid depends on the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure.
 * 
 * The first five data members are equivalent to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure. They are expanded in full simply to reduce the amount of dereferencing needed when dealing with a pointer to a <b>VIDEOINFO</b> structure.
 * 
 * For information about using the <b>rcSource</b> and <b>rcTarget</b> members, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/source-and-target-rectangles-in-video-renderers">Source and Target Rectangles in Video Renderers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-videoinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VIDEOINFO {
    #StructPack 8

    /**
     * Portion of the input video to use.
     */
    rcSource : RECT

    /**
     * Where the video should be displayed.
     */
    rcTarget : RECT

    /**
     * Approximate data rate in bits per second.
     */
    dwBitRate : UInt32

    /**
     * Bit error rate for this stream.
     */
    dwBitErrorRate : UInt32

    /**
     * The desired average time per frame, in 100-nanosecond units. For more information, see the Remarks section for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure.
     */
    AvgTimePerFrame : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains color and dimension information for a device-independent bitmap.
     */
    bmiHeader : BITMAPINFOHEADER

    bmiColors : RGBQUAD[256]

    static __New() {
        DefineProp(this.Prototype, 'dwBitMasks', { type: UInt32[3], offset: 88 })
        DefineProp(this.Prototype, 'TrueColorInfo', { type: TRUECOLORINFO, offset: 88 })
        this.DeleteProp("__New")
    }
}
