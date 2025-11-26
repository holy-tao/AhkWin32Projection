#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFClock.ahk
#Include .\IMFTopology.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Provides playback controls for protected and unprotected content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSession extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSession
     * @type {Guid}
     */
    static IID => Guid("{90377834-21d0-4dee-8214-ba2e3e6c1127}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTopology", "ClearTopologies", "Start", "Pause", "Stop", "Close", "Shutdown", "GetClock", "GetSessionCapabilities", "GetFullTopology"]

    /**
     * Sets a topology on the Media Session.
     * @param {Integer} dwSetTopologyFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfsession_settopology_flags">MFSESSION_SETTOPOLOGY_FLAGS</a> enumeration.
     * @param {IMFTopology} pTopology Pointer to the topology object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed in the Media Session's current state.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session has been shut down.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_TOPO_INVALID_TIME_ATTRIBUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The topology has invalid values for one or more of the following attributes:
     * 
     * <ul>
     * <li>
     * <a href="/windows/desktop/medfound/mf-toponode-mediastart-attribute">MF_TOPONODE_MEDIASTART</a>
     * </li>
     * <li>
     * <a href="/windows/desktop/medfound/mf-toponode-mediastop-attribute">MF_TOPONODE_MEDIASTOP</a>
     * </li>
     * <li>
     * <a href="/windows/desktop/medfound/mf-topology-projectstart-attribute">MF_TOPOLOGY_PROJECTSTART</a>
     * </li>
     * <li>
     * <a href="/windows/desktop/medfound/mf-topology-projectstop-attribute">MF_TOPOLOGY_PROJECTSTOP</a>
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_DEBUGGING_NOT_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protected content cannot be played while debugging.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-settopology
     */
    SetTopology(dwSetTopologyFlags, pTopology) {
        result := ComCall(7, this, "uint", dwSetTopologyFlags, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * Clears all of the presentations that are queued for playback in the Media Session.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed in the Media Session's current state.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session has been shut down.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-cleartopologies
     */
    ClearTopologies() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Starts the Media Session.
     * @param {Pointer<Guid>} pguidTimeFormat Pointer to a GUID that specifies the time format for the <i>pvarStartPosition</i> parameter. This parameter can be <b>NULL</b>. The value <b>NULL</b> is equivalent to passing in <b>GUID_NULL</b>.
     * 
     * The following time format GUIDs are defined:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_NULL"></a><a id="guid_null"></a><dl>
     * <dt><b>GUID_NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Presentation time. The <i>pvarStartPosition</i> parameter must have one of the following <b>PROPVARIANT</b> types.
     * 
     * <ul>
     * <li><b>VT_I8</b>: The <i>pvarStartPosition</i> parameter contains the starting position in 100-nanosecond units, relative to the start of the presentation.</li>
     * <li><b>VT_EMPTY</b>: Playback starts from the current position.</li>
     * </ul>
     * All media sources support this time format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_TIME_FORMAT_SEGMENT_OFFSET"></a><a id="mf_time_format_segment_offset"></a><dl>
     * <dt><b>MF_TIME_FORMAT_SEGMENT_OFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Segment offset. This time format is supported by the <a href="https://docs.microsoft.com/windows/desktop/medfound/sequencer-source">Sequencer Source</a>. The starting time is an offset within a segment.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatesequencersegmentoffset">MFCreateSequencerSegmentOffset</a> function to create the <b>PROPVARIANT</b> value for the 
     * <i>pvarStartPosition</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_TIME_FORMAT_ENTRY_RELATIVE"></a><a id="mf_time_format_entry_relative"></a><dl>
     * <dt><b>MF_TIME_FORMAT_ENTRY_RELATIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * Skip to a playlist entry. The <i>pvarStartPosition</i> parameter specifies the index of the playlist entry, relative to the current entry. For example, the value 2 skips forward two entries. To skip backward, pass a negative value. The <b>PROPVARIANT</b> type is <b>VT_I4</b>.
     * 
     * If a media source supports this time format, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-getcharacteristics">IMFMediaSource::GetCharacteristics</a> method returns one or both of the following flags:
     * 
     * <ul>
     * <li><b>MFMEDIASOURCE_CAN_SKIPFORWARD</b></li>
     * <li><b>MFMEDIASOURCE_CAN_SKIPBACKWARD</b></li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PROPVARIANT>} pvarStartPosition Pointer to a <b>PROPVARIANT</b> that specifies the starting position for playback. The meaning and data type of this parameter are indicated by the <i>pguidTimeFormat</i> parameter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed in the Media Session's current state.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session has been shut down.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-start
     */
    Start(pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "HRESULT")
        return result
    }

    /**
     * Pauses the Media Session.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed in the Media Session's current state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session has been shut down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SESSION_PAUSEWHILESTOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session cannot pause while stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-pause
     */
    Pause() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Stops the Media Session.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed in the Media Session's current state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-stop
     */
    Stop() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Closes the Media Session and releases all of the resources it is using.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-close
     */
    Close() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Shuts down the Media Session and releases all the resources used by the Media Session.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-shutdown
     */
    Shutdown() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the Media Session's presentation clock.
     * @returns {IMFClock} Receives a pointer to the presentation clock's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclock">IMFClock</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-getclock
     */
    GetClock() {
        result := ComCall(14, this, "ptr*", &ppClock := 0, "HRESULT")
        return IMFClock(ppClock)
    }

    /**
     * Retrieves the capabilities of the Media Session, based on the current presentation.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFSESSIONCAP_PAUSE"></a><a id="mfsessioncap_pause"></a><dl>
     * <dt><b>MFSESSIONCAP_PAUSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session can be paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFSESSIONCAP_RATE_FORWARD"></a><a id="mfsessioncap_rate_forward"></a><dl>
     * <dt><b>MFSESSIONCAP_RATE_FORWARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session supports forward playback at rates faster than 1.0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFSESSIONCAP_RATE_REVERSE"></a><a id="mfsessioncap_rate_reverse"></a><dl>
     * <dt><b>MFSESSIONCAP_RATE_REVERSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session supports reverse playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFSESSIONCAP_SEEK"></a><a id="mfsessioncap_seek"></a><dl>
     * <dt><b>MFSESSIONCAP_SEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session can be seeked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFSESSIONCAP_START"></a><a id="mfsessioncap_start"></a><dl>
     * <dt><b>MFSESSIONCAP_START</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Media Session can be started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-getsessioncapabilities
     */
    GetSessionCapabilities() {
        result := ComCall(15, this, "uint*", &pdwCaps := 0, "HRESULT")
        return pdwCaps
    }

    /**
     * Gets a topology from the Media Session.
     * @param {Integer} dwGetFullTopologyFlags Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfsession_getfulltopology_flags">MFSESSION_GETFULLTOPOLOGY_FLAGS</a> enumeration.
     * @param {Integer} TopoId The identifier of the topology. This parameter is ignored if the <i>dwGetFullTopologyFlags</i> parameter contains the <b>MFSESSION_GETFULLTOPOLOGY_CURRENT</b> flag. To get the identifier of a topology, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopology-gettopologyid">IMFTopology::GetTopologyID</a>.
     * @returns {IMFTopology} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfmediasession-getfulltopology
     */
    GetFullTopology(dwGetFullTopologyFlags, TopoId) {
        result := ComCall(16, this, "uint", dwGetFullTopologyFlags, "uint", TopoId, "ptr*", &ppFullTopology := 0, "HRESULT")
        return IMFTopology(ppFullTopology)
    }
}
