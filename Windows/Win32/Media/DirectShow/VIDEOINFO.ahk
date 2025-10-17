#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk
#Include ..\..\Graphics\Gdi\RGBQUAD.ahk
#Include .\TRUECOLORINFO.ahk

/**
 * The VIDEOINFO structure is equivalent to a VIDEOINFOHEADER structure, but it contains enough memory to hold three color masks plus a color table with 256 colors.If you are writing a video filter, you can use this structure to guarantee that the format block always has enough memory to contain the largest possible VIDEOINFOHEADER structure.
 * @remarks
 * 
  * Never use this structure unless you are sure that you will use it only to store standard RGB formats. If you store anything other than standard RGB, the variable size of the <b>bmiHeader</b> structure will almost certainly cause problems, and you should use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure instead. If you find it absolutely necessary to use the <b>VIDEOINFO</b> structure, do not access the <b>TrueColorInfo</b>, <b>dwBitMasks</b>, or <b>bmiColors</b> members directly. Instead, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd407230(v=vs.85)">TRUECOLOR</a>, <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-colors">COLORS</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/amvideo/nf-amvideo-bitmasks">BITMASKS</a> macros to return the pointers to the color information. Which of these members is valid depends on the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure.
  * 
  * The first five data members are equivalent to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure. They are expanded in full simply to reduce the amount of dereferencing needed when dealing with a pointer to a <b>VIDEOINFO</b> structure.
  * 
  * For information about using the <b>rcSource</b> and <b>rcTarget</b> members, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/source-and-target-rectangles-in-video-renderers">Source and Target Rectangles in Video Renderers</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/ns-amvideo-videoinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VIDEOINFO extends Win32Struct
{
    static sizeof => 2152

    static packingSize => 8

    /**
     * Portion of the input video to use.
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
     * Where the video should be displayed.
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
     * Approximate data rate in bits per second.
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Bit error rate for this stream.
     * @type {Integer}
     */
    dwBitErrorRate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The desired average time per frame, in 100-nanosecond units. For more information, see the Remarks section for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure.
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains color and dimension information for a device-independent bitmap.
     * @type {BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := BITMAPINFOHEADER(48, this)
            return this.__bmiHeader
        }
    }

    /**
     * @type {Array<RGBQUAD>}
     */
    bmiColors{
        get {
            if(!this.HasProp("__bmiColorsProxyArray"))
                this.__bmiColorsProxyArray := Win32FixedArray(this.ptr + 88, 256, RGBQUAD, "")
            return this.__bmiColorsProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    dwBitMasks{
        get {
            if(!this.HasProp("__dwBitMasksProxyArray"))
                this.__dwBitMasksProxyArray := Win32FixedArray(this.ptr + 88, 3, Primitive, "uint")
            return this.__dwBitMasksProxyArray
        }
    }

    /**
     * @type {TRUECOLORINFO}
     */
    TrueColorInfo{
        get {
            if(!this.HasProp("__TrueColorInfo"))
                this.__TrueColorInfo := TRUECOLORINFO(88, this)
            return this.__TrueColorInfo
        }
    }
}
