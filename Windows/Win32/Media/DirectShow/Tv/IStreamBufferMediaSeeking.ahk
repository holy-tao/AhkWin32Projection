#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IMediaSeeking.ahk

/**
 * The IStreamBufferMediaSeeking interface controls seeking in a stream buffer source graph. The Stream Buffer Source filter exposes this interface.
 * @remarks
 * 
 * When the Stream Buffer Source plays a recording created by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/recording-object">Recording</a> object or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/reccomp-object">RecComp</a> object, it can seek anywhere within the file. When it plays a live stream from the Stream Buffer Sink, it can seek anywhere within the sink filter's buffer. This might include recorded content or temporary backing files. Transitions across files are seamless.
 * 
 * Live content from the Stream Buffer Sink grows on one end, as new content is recorded, and shrinks on the other end, as stale backing files are deleted. Therefore, the positioning information for this interface differs somewhat from the regular <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaseeking">IMediaSeeking</a> interface. The following definitions are used.
 * 
 * <table>
 * <tr>
 * <th>Value
 *             </th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td>Content start</td>
 * <td>
 * The time of the earliest available content. For live content, the value starts at zero and increases whenever the Stream Buffer Engine deletes an old file.
 * 
 * For example, if there are six backing files, each 15 minutes long, then after 60 minutes the content start jumps to 15 minutes, as the first file is deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Content stop</td>
 * <td>The time of the latest available content. For live content, this value starts at zero and increases continuously.</td>
 * </tr>
 * <tr>
 * <td>Segment stop</td>
 * <td>
 * The time when the Stream Buffer Source filter will stop playback. This value starts at positive infinity, but it can be set to arbitrary times by the application.
 * 
 * The segment stop time can be later than the content stop time, so it may not be possible to seek to this position. If playback reaches the end of the content before reaching the segment stop time, the graph sends an end-of-stream (EOS) event.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Stream position</td>
 * <td>
 * The current playback position, relative to the content start.
 * 
 * For example, if the source graph runs for 15 seconds and pauses for 10 seconds, the stream position remains at 15 seconds until the source graph runs again.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * Given these definition, the following <b>IStreamBufferMediaSeeking</b> methods have special behaviors:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getavailable">GetAvailable</a>: Returns content start and content stop.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getcurrentposition">GetCurrentPosition</a>: Returns stream position.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getduration">GetDuration</a>: Returns (content start –content stop).</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getpositions">GetPositions</a>: Returns stream position and segment stop.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getstopposition">GetStopPosition</a>: Returns segment stop.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setpositions">SetPositions</a>: Sets stream position and segment stop.</li>
 * </ul>
 * The only time format supported by this interface is reference time (TIME_FORMAT_MEDIA_TIME). The Stream Buffer Engine does not support frame-accurate seeking.
 * 
 * <h3><a id="Rate_Changes"></a><a id="rate_changes"></a><a id="RATE_CHANGES"></a>Rate Changes</h3>
 * For rate changes, the playback speed must be greater than 0.1 or less than -0.1. Negative rates indicate reverse playback. If the capture source is an MPEG-2 source, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg-2-video-analyzer-filter">MPEG-2 Video Analyzer</a> filter is required to support playback faster than 4x or reverse playback. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/creating-stream-buffer-graphs">Creating Stream Buffer Graphs</a>.
 * 
 * The <b>IStreamBufferMediaSeeking::SetRate</b> method may return VFW_E_DVD_WRONG_SPEED if the requested rate is too high for very short content. This error is caused when the Stream Buffer Engine cannot get I frames for the available content at the requested rate.
 * 
 * The <b>SetRate</b> method may also return E_NOTIMPL. This error code can happen if several decoders are registered on the user's system. If so, use the standard <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setrate">IMediaSeeking::SetRate</a> method on the source graph to set the playback rate. The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaseeking">IMediaSeeking</a> version of <b>SetRate</b> may return VFW_E_UNSUPPORTED_AUDIO, which indicates that the audio decoder does not support trick mode. It is safe to ignore this error code.
 * 
 * The <b>IStreamBufferMediaSeeking</b> version of <b>SetRate</b> may also fail if the decoder does not support rates other than 1x speed.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferMediaSeeking)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffermediaseeking
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferMediaSeeking extends IMediaSeeking{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferMediaSeeking
     * @type {Guid}
     */
    static IID => Guid("{f61f5c26-863d-4afa-b0ba-2f81dc978596}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
