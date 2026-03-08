#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaSeeking interface contains methods for seeking to a position within a stream, and for setting the playback rate.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imediaseeking
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSeeking extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSeeking
     * @type {Guid}
     */
    static IID => Guid("{36b73880-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "CheckCapabilities", "IsFormatSupported", "QueryPreferredFormat", "GetTimeFormat", "IsUsingTimeFormat", "SetTimeFormat", "GetDuration", "GetStopPosition", "GetCurrentPosition", "ConvertTimeFormat", "SetPositions", "GetPositions", "GetAvailable", "SetRate", "GetRate", "GetPreroll"]

    /**
     * The GetCapabilities method retrieves all the seeking capabilities of the stream.
     * @remarks
     * This method returns information on all the seeking capabilities of the stream. Examine <i>pCapabilities</i> by performing a separate bitwise-AND operation on each AM_SEEKING_SEEKING_CAPABILITIES value you are interested in.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * DWORD dwCaps = 0;
     * pMediaSeeking-&gt;GetCapabilities(&amp;dwCaps);
     * 
     * if (dwCaps &amp; AM_SEEKING_CanGetCurrentPos) 
     * {
     *     // The stream can seek to the current position.
     * }
     * if (dwCaps &amp; AM_SEEKING_CanPlayBackwards) 
     * {
     *     // The stream can play backward.
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities">AM_SEEKING_SEEKING_CAPABILITIES</a> flags.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pCapabilities := 0, "HRESULT")
        return pCapabilities
    }

    /**
     * The CheckCapabilities method queries whether a stream has specified seeking capabilities.
     * @remarks
     * If you are only interested in a few specific capabilities, calling this method is more efficient than calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getcapabilities">IMediaSeeking::GetCapabilities</a>, which checks all the stream's seeking capabilities.
     * 
     * To call this method, declare a <b>DWORD</b> variable and set the value to the bitwise-<b>OR</b> combination of the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities">AM_SEEKING_SEEKING_CAPABILITIES</a> flags that you want to test. Pass the address of this value in the <i>pCapabilities</i> parameter. When the method returns, <i>pCapabilities</i> contains a subset of the original bits, indicating which capabilities are present. The return value indicates whether some, none, or all of the requested capabilities are present.
     * 
     * The following code example shows how to find out whether the stream supports forward seeking, backward seeking, and absolute seeking.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * // Set flags for the capabilities you want to check.
     * 
     * DWORD dwCaps = AM_SEEKING_CanSeekAbsolute | 
     *                AM_SEEKING_CanSeekForwards |
     *                AM_SEEKING_CanSeekBackwards;
     * 
     * HRESULT hr = pMediaSeeking-&gt;CheckCapabilities(&amp;dwCaps);
     * if(FAILED(hr)) 
     * {
     *     // The stream cannot seek.
     * }
     * else if (hr == S_OK) 
     * {   
     *     // The stream can seek forward, backward, and to an absolute position.
     * }
     * else if (hr == S_FALSE) // The stream has some of the capabilities.
     * {
     *     if (dwCaps &amp; AM_SEEKING_CanSeekAbsolute)
     *     {
     *         // The stream can seek to an absolute position.
     *     }
     *     if (dwCaps &amp; AM_SEEKING_CanSeekForwards)
     *     {
     *         // The stream can seek forward.
     *     }
     *     if (dwCaps &amp; AM_SEEKING_CanSeekBackwards)
     *     {
     *         // The stream can seek backward.
     *     }
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Pointer<Integer>} pCapabilities On input, a pointer to a variable that contains a bitwise <b>OR</b> of one or more <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities">AM_SEEKING_SEEKING_CAPABILITIES</a> attributes. When the method returns, the value indicates which of those attributes are available.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some but not all of the capabilities in <i>pCapabilities</i> are present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All capabilities in <i>pCapabilities</i> are present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No capabilities in <i>pCapabilities</i> are present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-checkcapabilities
     */
    CheckCapabilities(pCapabilities) {
        pCapabilitiesMarshal := pCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pCapabilitiesMarshal, pCapabilities, "HRESULT")
        return result
    }

    /**
     * The IsFormatSupported method determines whether a specified time format is supported for seek operations.
     * @param {Pointer<Guid>} pFormat Pointer to a GUID that specifies the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-isformatsupported
     */
    IsFormatSupported(pFormat) {
        result := ComCall(5, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The QueryPreferredFormat method retrieves the preferred time format for seeking.
     * @returns {Guid} Pointer to a variable that receives a GUID specifying the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-querypreferredformat
     */
    QueryPreferredFormat() {
        pFormat := Guid()
        result := ComCall(6, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * The GetTimeFormat method retrieves the time format that is currently being used for seek operations.
     * @returns {Guid} Pointer to a variable that receives a GUID specifying the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-gettimeformat
     */
    GetTimeFormat() {
        pFormat := Guid()
        result := ComCall(7, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * The IsUsingTimeFormat method determines whether seek operations are currently using a specified time format.
     * @remarks
     * This method is slightly more efficient than the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-gettimeformat">IMediaSeeking::GetTimeFormat</a> method, because it does not require copying the GUID.
     * @param {Pointer<Guid>} pFormat Pointer to a GUID that specifies the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified format is not the current format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified format is the current format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-isusingtimeformat
     */
    IsUsingTimeFormat(pFormat) {
        result := ComCall(8, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The SetTimeFormat method sets the time format for subsequent seek operations.
     * @remarks
     * This method specifies the time units used by other <b>IMediaSeeking</b> methods, such as <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getpositions">IMediaSeeking::GetPositions</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setpositions">IMediaSeeking::SetPositions</a>. Whenever you call one of these other methods, any parameters that express time values are given in units of the current time format.
     * 
     * The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). Other time formats include frames, samples, and bytes. To determine if a given format is supported, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-isformatsupported">IMediaSeeking::IsFormatSupported</a> method. If a format is supported, you can switch to that format by calling <c>SetTimeFormat</c>. Only one time format is active at any one time.
     * @param {Pointer<Guid>} pFormat Pointer to a GUID that specifies the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-settimeformat
     */
    SetTimeFormat(pFormat) {
        result := ComCall(9, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The GetDuration method gets the duration of the stream.
     * @remarks
     * This method gets the duration of the stream at normal playback speed. Changing the playback rate does not affect the duration.
     *       
     * 
     * The duration is expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method.
     *       
     * 
     * Depending on the source format, the duration might not be exact. For example, if the source contains a variable bit-rate (VBR) stream, the method might return an estimated duration.
     * @returns {Integer} Receives the duration, in units of the current time format.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getduration
     */
    GetDuration() {
        result := ComCall(10, this, "int64*", &pDuration := 0, "HRESULT")
        return pDuration
    }

    /**
     * The GetStopPosition method retrieves the time at which the playback will stop, relative to the duration of the stream.
     * @remarks
     * The playback rate does not affect the value returned by this method.
     * 
     * The returned value is expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method.
     * @returns {Integer} Pointer to a variable that receives the stop time, in units of the current time format.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getstopposition
     */
    GetStopPosition() {
        result := ComCall(11, this, "int64*", &pStop := 0, "HRESULT")
        return pStop
    }

    /**
     * The GetCurrentPosition method retrieves the current position, relative to the total duration of the stream.
     * @remarks
     * This method returns the current position that playback has reached. The value includes adjustments for the playback rate and starting time. For example, if the start time is 5 seconds, the playback rate is 2.0, and you run the graph for four seconds, the current position is 5 + (4 x 2.0) = 13.0 seconds.
     * 
     * The returned value is expressed in units of the current time format. To determine the current time format, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-gettimeformat">GetTimeFormat</a> method.
     * 
     * If the graph is paused or stopped, the current position is the point at which playback will resume.
     * 
     * The Filter Graph Manager calculates the position from the current stream time; it does not query the filters in the graph. For file playback, this yields an accurate result, because playback is synchronized to the stream time. For file writing, the results are not accurate. To get the current position in a file-writing graph, query the multiplexer filter. (Position is not relevant for live capture, however.)
     * 
     * The returned value is expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method.
     * @returns {Integer} Pointer to a variable that receives the current position, in units of the current time format.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getcurrentposition
     */
    GetCurrentPosition() {
        result := ComCall(12, this, "int64*", &pCurrent := 0, "HRESULT")
        return pCurrent
    }

    /**
     * The ConvertTimeFormat method converts from one time format to another.
     * @param {Pointer<Guid>} pTargetFormat Pointer to a GUID that specifies the target format. If <b>NULL</b>, the current format is used. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @param {Integer} Source Time value to be converted.
     * @param {Pointer<Guid>} pSourceFormat Pointer to a GUID that specifies the format to convert. If <b>NULL</b>, the current format is used. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @returns {Integer} Pointer to a variable that receives the converted time.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-converttimeformat
     */
    ConvertTimeFormat(pTargetFormat, Source, pSourceFormat) {
        result := ComCall(13, this, "int64*", &pTarget := 0, "ptr", pTargetFormat, "int64", Source, "ptr", pSourceFormat, "HRESULT")
        return pTarget
    }

    /**
     * The SetPositions method sets the current position and the stop position.
     * @remarks
     * The <i>dwCurrentFlags</i> and <i>dwStopFlags</i> parameters define the type of seek. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Positioning Flags
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_NoPositioning</td>
     * <td>No change in position. (The time parameter can be <b>NULL</b>.)</td>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_AbsolutePositioning</td>
     * <td>The specified position is absolute.</td>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_RelativePositioning</td>
     * <td>The specified position is relative to the previous value.</td>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_IncrementalPositioning</td>
     * <td>The stop position (<i>pStop</i>) is relative to the current position (<i>pCurrent</i>).</td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Modifier Flags
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_SeekToKeyFrame</td>
     * <td>Seek to the nearest key frame. This might be faster, but less accurate. None of the filters that ship with DirectShow support this flag. Decoders are the most likely type of filter to support it.</td>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_ReturnTime</td>
     * <td>Return the equivalent reference times.</td>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_Segment</td>
     * <td>Use segment seeking.</td>
     * </tr>
     * <tr>
     * <td>AM_SEEKING_NoFlush</td>
     * <td>Do not flush.</td>
     * </tr>
     * </table>
     *  
     * 
     * For each parameter, use one positioning flag. Optionally, include one or more modifier flags.
     * 
     * If the AM_SEEKING_ReturnTime flag is specified, the method converts the position value to a reference time and returns it in the <i>pCurrent</i> or <i>pStop</i> variable. This flag is useful if you are using another time format, such as frames.
     * 
     * The AM_SEEKING_Segment and AM_SEEKING_NoFlush flags support seamless looping:
     * 
     * <ul>
     * <li>If the AM_SEEKING_Segment flag is present, the source filter sends an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-end-of-segment">EC_END_OF_SEGMENT</a> event when it reaches the stop position, instead of calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-endofstream">IPin::EndOfStream</a>. The application can wait for this event and then issue another seek command.</li>
     * <li>If the AM_SEEKING_NoFlush flag is present, the graph does not flush data during the seek. Use this flag with AM_SEEKING_Segment.</li>
     * </ul>
     * To perform looping, the graph must report AM_SEEKING_CanDoSegments in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getcapabilities">IMediaSeeking::GetCapabilities</a> method. Currently, only the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wave-parser-filter">WAVE Parser Filter</a> supports this feature.
     * 
     * The incoming values of <i>pCurrent</i> and <i>pStop</i> are expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method. If the AM_SEEKING_ReturnTime flag is present, the method converts the outgoing value to <b>REFERENCE_TIME</b> units.
     * 
     * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
     * If you implement this method, you can check whether the caller is requesting a change in the current or stop position, by using the value AM_SEEKING_PositioningBitsMask to mask out the modifier flags. For example:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th></th>
     * </tr>
     * <tr>
     * <td>
     * <pre>DWORD dwCurrentPos = dwCurrentFlags &amp; AM_SEEKING_PositioningBitsMask
     * if (dwCurrentPos == AM_SEEKING_AbsolutePositioning)
     * { 
     *     // Set new position to pCurrent.
     *     m_rtStart = *pCurrent;
     * }
     * else if (dwCurrentPos == AM_SEEKING_RelativePositioning)
     * {
     *     // Increment current position by pCurrent.
     *     m_rtStart += *pCurrent;
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * For more information, see the source code for the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/csourceseeking-setpositions">CSourceSeeking::SetPositions</a> method in the base class library.
     * @param {Pointer<Integer>} pCurrent [in,out] Pointer to a variable that specifies the current position, in units of the current time format.
     * @param {Integer} dwCurrentFlags Bitwise combination of flags. See Remarks.
     * @param {Pointer<Integer>} pStop [in,out] Pointer to a variable that specifies the stop time, in units of the current time format.
     * @param {Integer} dwStopFlags Bitwise combination of flags. See Remarks.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No position change. (Both flags specify no seeking.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-setpositions
     */
    SetPositions(pCurrent, dwCurrentFlags, pStop, dwStopFlags) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, pCurrentMarshal, pCurrent, "uint", dwCurrentFlags, pStopMarshal, pStop, "uint", dwStopFlags, "HRESULT")
        return result
    }

    /**
     * The GetPositions method retrieves the current position and the stop position, relative to the total duration of the stream.
     * @remarks
     * The current position and the stop position are both relative to the original stream, and are independent of the playback rate.
     * 
     * The returned values are expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method.
     * @param {Pointer<Integer>} pCurrent Pointer to a variable that receives the current position, in units of the current time format.
     * @param {Pointer<Integer>} pStop Pointer to a variable that receives the stop position, in units of the current time format.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getpositions
     */
    GetPositions(pCurrent, pStop) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(15, this, pCurrentMarshal, pCurrent, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * The GetAvailable method retrieves the range of times in which seeking is efficient.
     * @remarks
     * This method is intended primarily for seeking in media streams that might have excessive latency, such as streams being sent over a network. The returned values indicate cached data that has already arrived, which can be easily seeked. It is assumed that seeking to values beyond these returned parameters will cause a delay while the application waits for the data to arrive.
     * 
     * All time values are expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method.
     * @param {Pointer<Integer>} pEarliest Pointer to a variable that receives the earliest time for efficient seeking.
     * @param {Pointer<Integer>} pLatest Pointer to a variable that receives the latest time for efficient seeking.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getavailable
     */
    GetAvailable(pEarliest, pLatest) {
        pEarliestMarshal := pEarliest is VarRef ? "int64*" : "ptr"
        pLatestMarshal := pLatest is VarRef ? "int64*" : "ptr"

        result := ComCall(16, this, pEarliestMarshal, pEarliest, pLatestMarshal, pLatest, "HRESULT")
        return result
    }

    /**
     * The SetRate method sets the playback rate.
     * @remarks
     * The playback rate is expressed as a ratio of the normal speed. Thus, 1.0 is normal playback speed, 0.5 is half speed, and 2.0 is twice speed. For audio streams, changing the rate also changes the pitch.
     * 
     * Negative values indicate reverse playback. Most filters do not support negative playback, but instead return an error code if the <i>dRate</i> parameter is negative.
     * 
     * When an application calls this method on the Filter Graph Manager, the Filter Graph Manager does the following:
     * 
     * <ol>
     * <li>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getcurrentposition">IMediaSeeking::GetCurrentPosition</a> method. This call returns the current position as calculated by the Filter Graph Manager.</li>
     * <li>Stops the filter graph (if the graph is paused or running).</li>
     * <li>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setpositions">IMediaSeeking::SetPositions</a> method on the filters, with the current position as the start time. This has the effect of resetting the stream time to zero.</li>
     * <li>Calls the <c>SetRate</c> method on the filters, with the new rate.</li>
     * <li>Resumes the filter graph, if it was paused or running.</li>
     * </ol>
     * If an error occurs in step 4, the Filter Graph Manager tries to restore the previous rate.
     * 
     * Filters should respond to rate changes as follows:
     * 
     * <b>Parser and source filters: </b>The filter that originates the timestamps responds to the <c>SetRate</c> call. This is usually a parser filter, such as the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-splitter-filter">AVI Splitter Filter</a>, but it might be a source filter. After any seek or rate change, the filter should call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-newsegment">IPin::NewSegment</a> method with the new settings. After a rate change, it should adjust its timestamps accordingly. Because a rate change is preceded by a seek, timestamps restart from zero, so the filter can simply divide by the rate to calculate the new timestamps.
     * 
     * <b>Decoder filters: </b>Decoders should not act on <c>SetRate</c> calls other than to pass them upstream. Instead, they should respond to the <b>NewSegment</b> call that the upstream parser issues. When a decoder filter receives new segment information, it should store the values and pass the <b>NewSegment</b> call downstream. Some decoders need to generate extra timestamps by interpolating their input; they should take rate changes into account when doing so.
     * 
     * <b>Renderers: </b>Video renderers can typically ignore rate changes, because the incoming frames already have the correct time stamp. Audio renderers must modify their playback rate, because audio decoders typically do not make rate-change conversions.
     * @param {Float} dRate Playback rate. Must not be zero.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified rate was zero or a negative value. (See Remarks.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_UNSUPPORTED_AUDIO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio device or filter does not support this rate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-setrate
     */
    SetRate(dRate) {
        result := ComCall(17, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * The GetRate method retrieves the playback rate.
     * @remarks
     * The playback rate is expressed as a ratio of the normal speed. Thus, 1.0 is normal playback speed, 0.5 is half speed, and 2.0 is twice speed.
     * @returns {Float} Pointer to a variable that receives the playback rate.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getrate
     */
    GetRate() {
        result := ComCall(18, this, "double*", &pdRate := 0, "HRESULT")
        return pdRate
    }

    /**
     * The GetPreroll method retrieves the amount of data that will be queued before the start position.
     * @remarks
     * The <i>preroll</i> is the time prior to the start position at which nonrandom access devices, such as tape players, should start rolling.
     * 
     * The returned value is expressed in the current time format. The default time format is <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> units (100 nanoseconds). To change time formats, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-settimeformat">IMediaSeeking::SetTimeFormat</a> method.
     * @returns {Integer} Pointer to a variable that receives the preroll time, in units of the current time format.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getpreroll
     */
    GetPreroll() {
        result := ComCall(19, this, "int64*", &pllPreroll := 0, "HRESULT")
        return pllPreroll
    }
}
