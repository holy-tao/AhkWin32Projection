#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AM_DVD_GRAPH_FLAGS enumeration specifies how the DVD Navigator builds a DVD playback graph. These flags are used with the IDvdGraphBuilder::RenderDvdVideoVolume method.
 * @remarks
 * 
 * Do not combine more than one of the following flags:
 * 
 * <ul>
 * <li>AM_DVD_HWDEC_PREFER</li>
 * <li>AM_DVD_HWDEC_ONLY</li>
 * <li>AM_DVD_SWDEC_PREFER</li>
 * <li>AM_DVD_SWDEC_ONLY</li>
 * </ul>
 * If you have already selected a video renderer by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdgraphbuilder-getdvdinterface">IDvdGraphBuilder::GetDvdInterface</a>, do not set the <b>AM_DVD_VMR9_ONLY</b> or <b>AM_DVD_EVR_ONLY</b> flag.
 * 
 * To use the VMR-9, the decoder's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamdecodercaps-getdecodercaps">IAMDecoderCaps::GetDecoderCaps</a> method must return the <b>AM_GETDECODERCAP_QUERY_VMR9_SUPPORT</b> flag. To use the EVR, the decoder's <b>GetDecoderCaps</b> method must return the <b>AM_GETDECODERCAP_QUERY_EVR_SUPPORT</b> flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-am_dvd_graph_flags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVD_GRAPH_FLAGS{

    /**
     * Use a hardware decoder if possible. If none is available, use a software decoder. This is the default setting. Hardware DVD decoders are registered under the CLSID_DVDHWDecodersCategory filter category. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/filter-categories">Filter Categories</a>.
     * @type {Integer (Int32)}
     */
    static AM_DVD_HWDEC_PREFER => 1

    /**
     * Use a hardware decoder; do not use a software decoder. Do not combine this flag with the AM_DVD_VMR9_ONLY or AM_DVD_EVR_ONLY flag.
     * @type {Integer (Int32)}
     */
    static AM_DVD_HWDEC_ONLY => 2

    /**
     * Use a software decoder if possible. If none is available, use a hardware decoder.
     * @type {Integer (Int32)}
     */
    static AM_DVD_SWDEC_PREFER => 4

    /**
     * Use a software decoder; do not use a hardware decoder.
     * @type {Integer (Int32)}
     */
    static AM_DVD_SWDEC_ONLY => 8

    /**
     * Do not show video on the computer monitor. Use of this flag should be limited only to the combination of a hardware DVD-Video decoder and a display device with a port that can connect to a TV. A set-top box type of device that can play back DVD-Video could play DVD titles to be viewed on a TV set rather than a computer monitor.
     * @type {Integer (Int32)}
     */
    static AM_DVD_NOVPE => 256

    /**
     * Do not clear the filter graph before building the DVD playback graph. By default, the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdgraphbuilder-renderdvdvideovolume">RenderDvdVideoVolume</a> method removes any existing filters from the graph before it builds the DVD playback graph. <div class="alert"><b>Note</b>  Applies to Windows Vista and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static AM_DVD_DO_NOT_CLEAR => 512

    /**
     * Use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-mixing-renderer-filter-9">Video Mixing Renderer Filter 9</a> (VMR-9) for rendering; fail if the VMR-9 is not available. Do not combine this flag with the AM_DVD_EVR_ONLY flag.
     * @type {Integer (Int32)}
     */
    static AM_DVD_VMR9_ONLY => 2048

    /**
     * Use the Enhanced Video Renderer (EVR) for rendering; fail if the EVR is not available. <div class="alert"><b>Note</b>  Applies to Windows Vista and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static AM_DVD_EVR_ONLY => 4096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AM_DVD_EVR_QOS => 8192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AM_DVD_ADAPT_GRAPH => 16384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AM_DVD_MASK => 65535
}
