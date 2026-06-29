#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The VIDEO_STREAM_CONFIG_CAPS structure describes a range of video formats. Video compression and video capture filters use this structure to describe what formats they can produce.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getstreamcaps">IAMStreamConfig::GetStreamCaps</a> method returns this structure. An application can use this information to modify the output format on a video compression filter or video capture filter.
 *       
 * 
 * For example, assume that filter returns the following values for the source rectangle:
 *         
 * 
 * <ul>
 * <li>MinCroppingSize = (160, 120)</li>
 * <li>MaxCroppingSize = (320, 240)</li>
 * <li>CropGranularityX = 4</li>
 * <li>CropGranularityY = 8</li>
 * <li>CropAlignX = 2</li>
 * <li>CropAlignY = 4</li>
 * </ul>
 * These numbers define the set of rectangles that are valid for the <b>rcSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure. In this example, the minimum source rectangle is 160 pixels wide x 120 pixels high. The width can be increased in steps of 4 pixels, to a maximum of 320. The height can be increased in steps of 8 pixels, to a maximum of 240. In other words, the valid widths are 160, 164, 168 ... 320; and the valid heights are 120, 128, 136 ... 240.
 * 
 * The <b>CropAlignX</b> and <b>CropAlignY</b> members define where the top-left corner of the source rectangle can sit. For example, the following rectangles are valid, given the previous values:
 * 
 * <ul>
 * <li>(0, 0, 160, 120)</li>
 * <li>(2, 0, 162, 120)</li>
 * <li>(2, 8, 162, 128)</li>
 * </ul>
 * In a similar way, the <b>MinOutputSize</b>, <b>MaxOutputSize</b>, <b>OutputGranularityX</b>, and <b>OutputGranularityY</b> members define what values are supported for the <b>biWidth</b> and <b>biHeight</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfoheader">BITMAPINFOHEADER</a> structure.
 * 
 * For capture filters, the <b>MinFrameInterval</b> and <b>MaxFrameInterval</b> members define the minimum and maximum duration of each frame, as given in the <b>AvgTimePerFrame</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure. The filter may not support every frame rate that falls between these two values. The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-setformat">IAMStreamConfig::SetFormat</a> method will set the frame rate to the closest value that the filter supports. If <b>SetFormat</b> succeeds, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getformat">IAMStreamConfig::GetFormat</a> to determine the actual frame rate.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-video_stream_config_caps
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VIDEO_STREAM_CONFIG_CAPS {
    #StructPack 8

    /**
     * <b>GUID</b> that identifies the format type. For example, <b>FORMAT_VideoInfo</b> or <b>FORMAT_VideoInfo2</b>. For more information, see the <b>formattype</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure.
     */
    guid : Guid

    /**
     * The analog video standard supported. The value is a bitwise combination of flags from the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration type, or zero.
     */
    VideoStandard : UInt32

    /**
     * Native size of the incoming video signal. For a compressor, the size is taken from the input pin. For a capture filter, the size is the largest signal the filter can digitize with every pixel remaining unique.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    InputSize : SIZE

    /**
     * Smallest source rectangle allowed. The source rectangle is defined in the <b>rcSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    MinCroppingSize : SIZE

    /**
     * Largest source rectangle allowed.
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    MaxCroppingSize : SIZE

    /**
     * Horizontal granularity of the source rectangle. This value specifies the increments that are valid between <b>MinCroppingSize</b> and <b>MaxCroppingSize</b>.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    CropGranularityX : Int32

    /**
     * Vertical granularity of the source rectangle. This value specifies the increments that are valid between <b>MinCroppingSize</b> and <b>MaxCroppingSize</b>.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    CropGranularityY : Int32

    /**
     * Required horizontal alignment of the source rectangle.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    CropAlignX : Int32

    /**
     * Required vertical alignment of the source rectangle.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    CropAlignY : Int32

    /**
     * Minimum output size.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    MinOutputSize : SIZE

    /**
     * Maximum output size.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    MaxOutputSize : SIZE

    /**
     * Granularity of the output width. This value specifies the increments that are valid between <b>MinOutputSize</b> and <b>MaxOutputSize</b>.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    OutputGranularityX : Int32

    /**
     * Granularity of output height. This value specifies the increments that are valid between <b>MinOutputSize</b> and <b>MaxOutputSize</b>.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    OutputGranularityY : Int32

    /**
     * Indicates how well the filter can stretch the image horizontally.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    StretchTapsX : Int32

    /**
     * Indicates how well the filter can stretch the image vertically.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    StretchTapsY : Int32

    /**
     * Indicates how well the filter can shrink the image horizontally.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    ShrinkTapsX : Int32

    /**
     * Indicates how well the filter can shrink the image vertically.
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     * The previous four structure members use the following values:
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Does not support stretching/shrinking. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="1"></a><dl>
     * <dt><b>1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses pixel doubling (stretching) or eliminates pixels (shrinking) 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="2"></a><dl>
     * <dt><b>2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses interpolation (2 taps) 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="3_and_higher"></a><a id="3_AND_HIGHER"></a><dl>
     * <dt><b>3 and higher</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses interpolation (&gt;2 taps) 
     * 
     * </td>
     * </tr>
     * </table>
     */
    ShrinkTapsY : Int32

    /**
     * The minimum frame duration, in 100-nanosecond units. This value applies only to capture filters.
     */
    MinFrameInterval : Int64

    /**
     * The maximum frame duration, in 100-nanosecond units. This value applies only to capture filters.
     */
    MaxFrameInterval : Int64

    /**
     * Minimum data rate this pin can produce.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    MinBitsPerSecond : Int32

    /**
     * Maximum data rate this pin can produce.
     *           
     * 
     * <div class="alert"><b>Note</b>  Deprecated.</div>
     * <div> </div>
     */
    MaxBitsPerSecond : Int32

}
