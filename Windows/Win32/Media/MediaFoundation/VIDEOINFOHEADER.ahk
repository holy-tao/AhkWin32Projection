#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk

/**
 * The VIDEOINFOHEADER structure describes the bitmap and color information for a video image.
 * @remarks
 * For information about using the <b>rcSource</b> and <b>rcTarget</b> members, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/source-and-target-rectangles-in-video-renderers">Source and Target Rectangles in Video Renderers</a>.
 * 
 * <h3><a id="Frame_Rates"></a><a id="frame_rates"></a><a id="FRAME_RATES"></a>Frame Rates</h3>
 * The value of <b>AvgTimePerFrame</b> is usually set by the source filter, which obtains the value from the media stream. This value can be used to calculate the authored frame rate, which is the intended frame rate for the video to be rendered. During playback, the system may not be able to render the stream at the authored rate, so the actual frame rate may be less. This can happen if the machine's resources become over-committed. Also, the monitor's refresh rate can interfere with the playback rate of the video. For example, if the intended rate is 60,000/1001 (NTSC TV) and the monitor's refresh rate is 60Hz, the intended rate and the actual rate will never match. To retrieve the actual frame rate achieved during playback, use the <a href="https://docs.microsoft.com/previous-versions/ms786607(v=vs.85)">IQualProp::get_AvgFrameRate</a> method on the video renderer.
 * 
 * During playback, applications can retrieve the authored frame rate as follows: 
 * 
 * <ul>
 * <li>If the old <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-renderer-filter">Video Renderer</a> filter is rendering, call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ibasicvideo-get_avgtimeperframe">IBasicVideo::get_AvgTimePerFrame</a> method.</li>
 * <li>If the Video Mixing Renderer (VMR) is rendering, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-connectionmediatype">IPin::ConnectionMediaType</a> on the input pin and examine the format block. The VMR supports multiple input streams, and they are not required to have the same frame rates.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-videoinfoheader
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class VIDEOINFOHEADER extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the source video window. This structure can be a clipping rectangle, to select a portion of the source video stream.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination video window.
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
     * Approximate data rate of the video stream, in bits per second.
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Data error rate, in bit errors per second.
     * @type {Integer}
     */
    dwBitErrorRate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The desired average display time of the video frames, in 100-nanosecond units. The actual time per frame may be longer. See Remarks.
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure that contains color and dimension information for the video image bitmap. If the format block contains a color table or color masks, they immediately follow the <b>bmiHeader</b> member. You can get the first color entry by casting the address of member to a <b>BITMAPINFO</b> pointer.
     * 
     * When used inside a <b>VIDEOINFOHEADER</b> structure, the semantics of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure differ slightly from how the structure is used in GDI. For more information, refer to the topic <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER Structure</a>.
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
