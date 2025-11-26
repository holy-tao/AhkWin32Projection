#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\IReferenceClock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynth interface is used by DirectMusic to communicate with user-mode synthesizers.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/nn-dmusics-idirectmusicsynth
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicSynth extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicSynth
     * @type {Guid}
     */
    static IID => Guid("{09823661-5c85-11d2-afa6-00aa0024d8b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "SetNumChannelGroups", "Download", "Unload", "PlayBuffer", "GetRunningStats", "GetPortCaps", "SetMasterClock", "GetLatencyClock", "Activate", "SetSynthSink", "Render", "SetChannelPriority", "GetChannelPriority", "GetFormat", "GetAppend"]

    /**
     * The Open method opens a DirectMusic synthesizer &quot;port&quot;.
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams Pointer to a DMUS_PORTPARAMS structure (described in the Microsoft Windows SDK documentation) specifying a set of options for opening the DirectMusic "port". The structure contains setup parameters for the port, including sample rate, stereo mode, and number of voices. If this parameter is set to <b>NULL</b>, default settings are used.
     * @returns {HRESULT} <code>Open</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad pointer was passed in <i>pPortParams</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_ALREADYOPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the port was already opened.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NOSYNTHSINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that no sink is available for output.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-open
     */
    Open(pPortParams) {
        result := ComCall(3, this, "ptr", pPortParams, "HRESULT")
        return result
    }

    /**
     * The Close method closes a DirectMusic &quot;port&quot;, which is a DirectMusic term for a device that sends or receives music data.
     * @returns {HRESULT} <code>Close</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_ALREADYCLOSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the port was not open.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The SetNumChannelGroups method instructs the synthesizer to set its number of channel groups to a new value.
     * @param {Integer} dwGroups Specifies the number of channel groups requested.
     * @returns {HRESULT} <code>SetNumChannelGroups</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
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
     * Indicates that the method is unable to allocate the channel groups.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-setnumchannelgroups
     */
    SetNumChannelGroups(dwGroups) {
        result := ComCall(5, this, "uint", dwGroups, "HRESULT")
        return result
    }

    /**
     * The Download method downloads a wave or instrument definition to the synthesizer.
     * @param {Pointer<HANDLE>} phDownload Output pointer for the download handle. This parameter points to a caller-allocated variable into which the method writes a handle identifying the download data. The caller uses this handle later to unload the data.
     * @param {Pointer<Void>} pvData Pointer to a continuous memory segment containing download data. For an overview of the data format, see the description of low-level DLS in the DirectMusic section of the Microsoft Windows SDK documentation.
     * @param {Pointer<BOOL>} pbFree Output pointer for a status value indicating whether the memory for the download data can be freed. This parameter points to a caller-allocated variable into which the method writes a Boolean value indicating whether the caller can free the storage pointed to by <i>pvData</i>. If <b>TRUE</b>, the application can safely free the memory after the return. If <b>FALSE</b>, the caller must keep the memory pointed to by <i>pvData</i> allocated until it is unloaded.
     * @returns {HRESULT} <code>Download</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that one of the pointers is invalid.
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
     * Indicates that the method is unable to download the data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NOTMONO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the wave chunk has more than one interleaved channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_BADARTICULATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad articulation chunk or link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_BADINSTRUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad instrument chunk or link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_BADWAVELINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad link to the wave download data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NOARTICULATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the region in instrument has neither global nor local articulation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NOTPCM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the wave data is not PCM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_BADWAVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the wave header is corrupt.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_BADOFFSETTABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the offset table contains errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_UNKNOWNDOWNLOAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the download data is neither instrument nor wave.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-download
     */
    Download(phDownload, pvData, pbFree) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"
        pbFreeMarshal := pbFree is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", phDownload, pvDataMarshal, pvData, pbFreeMarshal, pbFree, "HRESULT")
        return result
    }

    /**
     * The Unload method unloads a DLS resource (waveform or articulation data for a MIDI instrument) that was previously downloaded by a call to IDirectMusicSynth::Download.
     * @param {HANDLE} hDownload Handle to the DLS resource, which was obtained from a previous call to the <b>IDirectMusicSynth::Download</b> method. If the <i>lpFreeHandle</i> parameter below is non-<b>NULL</b>, the synthesizer passes this handle as the first parameter to the <i>lpFreeHandle</i> callback routine.
     * @param {Pointer} lpFreeHandle Pointer to a callback routine that will be called when the memory containing the DLS resource is no longer in use. If the original call to <b>IDirectMusicSynth::Download</b> returned <b>FALSE</b> in <i>pbFree</i>, this means that the synthesizer continued accessing the caller-allocated memory in the download chunk after the return from <b>Download</b>. If so, the synthesizer notifies the caller as soon as the memory can be freed, but this might occur later than the return from <c>Unload</c> because the DLS resource might be currently in use. The callback function takes two handles as call parameters. The first of these two handles is the <i>hDownload</i> parameter (see above), and the second is the <i>hUserData</i> parameter (see below).
     * @param {HANDLE} hUserData Pointer to user data, which is passed as the second parameter to the <i>lpFreeHandle</i> callback function above. The meaning of this value is known only to the caller, but it is typically a pointer to context information describing the state of the memory that is to be freed.
     * @returns {HRESULT} <code>Unload</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method is unable to unload data (<i>hDownload</i> probably invalid).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-unload
     */
    Unload(hDownload, lpFreeHandle, hUserData) {
        hDownload := hDownload is Win32Handle ? NumGet(hDownload, "ptr") : hDownload
        hUserData := hUserData is Win32Handle ? NumGet(hUserData, "ptr") : hUserData

        result := ComCall(7, this, "ptr", hDownload, "ptr", lpFreeHandle, "ptr", hUserData, "HRESULT")
        return result
    }

    /**
     * The PlayBuffer method downloads a stream of MIDI messages to the synthesizer.
     * @param {Integer} rt Specifies the start time of the buffer. This value is specified in REFERENCE_TIME units, relative to the master clock, which was previously set with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-setmasterclock">IDirectMusicSynth::SetMasterClock</a>. Also, this value should be after the time returned by the clock in <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock">IDirectMusicSynth::GetLatencyClock</a>.
     * @param {Pointer<Integer>} pbBuffer Pointer to a memory buffer containing the time-stamped MIDI messages that the <b>IDirectMusicBuffer</b> object generates
     * @param {Integer} cbBuffer Specifies the size of the buffer in bytes.
     * @returns {HRESULT} <code>PlayBuffer</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad buffer pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NOSYNTHSINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the <b>IDirectMusicSynthSink</b> object was not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHINACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method was called when the synth is inactive, which is not valid.
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
     * Indicates that the method is unable to queue the messages.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-playbuffer
     */
    PlayBuffer(rt, pbBuffer, cbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "int64", rt, pbBufferMarshal, pbBuffer, "uint", cbBuffer, "HRESULT")
        return result
    }

    /**
     * The GetRunningStats method retrieves current information about the state of the synthesizer so that an application can tell how the synth is performing.
     * @param {Pointer<DMUS_SYNTHSTATS>} pStats Pointer to a DMUS_SYNTHSTATS structure (described in Microsoft Windows SDK documentation). The method writes the synth's statistics into this structure.
     * @returns {HRESULT} <code>GetRunningStats</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method is unable to get the stats.
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
     * Indicates a bad <i>pStats</i> pointer.
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
     * Indicates that the synthesizer has not implemented this method (so expect the worst!).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-getrunningstats
     */
    GetRunningStats(pStats) {
        result := ComCall(9, this, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * The GetPortCaps method retrieves the capabilities of a DirectMusic &quot;port&quot;, which is a DirectMusic term for a device that sends or receives music data.
     * @param {Pointer<DMUS_PORTCAPS>} pCaps Pointer to a DMUS_PORTCAPS structure (described in the Microsoft Windows SDK documentation). The method writes the capabilities of the DirectMusic "port" into this structure.
     * @returns {HRESULT} <code>GetPortCaps</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad <i>pCaps</i> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-getportcaps
     */
    GetPortCaps(pCaps) {
        result := ComCall(10, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * The SetMasterClock method provides the synthesizer with a master time source, which the synthesizer requires to synchronize itself with the rest of DirectMusic.
     * @param {IReferenceClock} pClock Pointer to the master <b>IReferenceClock</b> (defined in Microsoft Windows SDK documentation) object, which is used by all devices in the current instance of DirectMusic.
     * @returns {HRESULT} <code>SetMasterClock</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a bad interface pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-setmasterclock
     */
    SetMasterClock(pClock) {
        result := ComCall(11, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * The GetLatencyClock method retrieves a reference to the IReferenceClock interface (described in the Microsoft Windows SDK documentation) of the reference-clock object that tracks the current mix time.
     * @returns {IReferenceClock} Output pointer for the latency clock. This parameter points to a caller-allocated pointer variable into which the method writes a pointer to the latency-clock object's <b>IReferenceClock</b> interface. Through this interface, the synthesizer is able to get the current mix time. Specify a valid, non-NULL pointer value for this parameter.
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock
     */
    GetLatencyClock() {
        result := ComCall(12, this, "ptr*", &ppClock := 0, "HRESULT")
        return IReferenceClock(ppClock)
    }

    /**
     * The Activate method enables or disables the audio device under program control.
     * @param {BOOL} fEnable Specifies whether to enable or disable the audio device. If <b>TRUE</b>, the method enables the device. If <b>FALSE</b>, the method disables it.
     * @returns {HRESULT} <code>Activate</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * Indicates audio device is already inactive.
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
     * Indicates that the request failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that not enough memory is available to load the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not opened or not properly configured.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NOSYNTHSINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the <b>IDirectMusicSynthSink</b> object was not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is already active.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-activate
     */
    Activate(fEnable) {
        result := ComCall(13, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * The SetSynthSink method establishes the connection of the synth to the wave sink.
     * @param {IDirectMusicSynthSink} pSynthSink Pointer to the synth sink. This parameter either points to the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynthsink">IDirectMusicSynthSink</a> sink object to connect to the synth, or is <b>NULL</b> to disconnect the synth from its current synth sink.
     * @returns {HRESULT} <code>SetSynthSink</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a bad pointer was passed in <i>pSynthSink</i>.
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
     * Indicates that the method failed because it was unable to connect to the <b>IDirectMusicSynthSink</b> object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that not enough memory is available to establish the connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-setsynthsink
     */
    SetSynthSink(pSynthSink) {
        result := ComCall(14, this, "ptr", pSynthSink, "HRESULT")
        return result
    }

    /**
     * The Render method is called by the synth sink to render to a buffer in the audio stream.
     * @param {Pointer<Integer>} pBuffer Pointer to the buffer to write to
     * @param {Integer} dwLength Specifies the length of the buffer. The buffer length is expressed in samples, not bytes. The size in bytes of the buffer can vary, depending on the buffer's format, which the synth sets in response to an <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-activate">IDirectMusicSynth::Activate</a> command.
     * @param {Integer} llPosition Specifies the position in the audio stream. The position is expressed in samples, not bytes. The caller should always increment this value by <i>dwLength</i> after each call.
     * @returns {HRESULT} <code>Render</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method failed.
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
     * Indicates a bad buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or not properly configured.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHINACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method is not valid when synth is inactive.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-render
     */
    Render(pBuffer, dwLength, llPosition) {
        pBufferMarshal := pBuffer is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, pBufferMarshal, pBuffer, "uint", dwLength, "int64", llPosition, "HRESULT")
        return result
    }

    /**
     * The SetChannelPriority method sets the priority of a MIDI channel.
     * @param {Integer} dwChannelGroup Specifies the group the channel is in. This value must be one or greater.
     * @param {Integer} dwChannel Specifies a channel in the channel group. This parameter is an index in the range 0 to 15.
     * @param {Integer} dwPriority Specifies the priority ranking of the channel. For a list of the ranking values that are defined for this parameter, see the <b>IDirectMusicPort::GetChannelPriority</b> reference page in the Microsoft Windows SDK documentation.
     * @returns {HRESULT} <code>SetChannelPriority</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-setchannelpriority
     */
    SetChannelPriority(dwChannelGroup, dwChannel, dwPriority) {
        result := ComCall(16, this, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * The GetChannelPriority method outputs the priority of a MIDI channel.
     * @param {Integer} dwChannelGroup Specifies the channel group that the channel belongs to. This parameter must be one or greater.
     * @param {Integer} dwChannel Specifies the index of the channel in the channel group. This is a value in the range 0 to 15.
     * @param {Pointer<Integer>} pdwPriority Output pointer for the priority ranking. This parameter points to a caller-allocated variable into which the method writes the priority ranking value. For a list of the priority values that are defined for this parameter, see the <b>IDirectMusicPort::GetChannelPriority</b> reference page in the Microsoft Windows SDK documentation.
     * @returns {HRESULT} <code>GetChannelPriority</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-getchannelpriority
     */
    GetChannelPriority(dwChannelGroup, dwChannel, pdwPriority) {
        pdwPriorityMarshal := pdwPriority is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", dwChannelGroup, "uint", dwChannel, pdwPriorityMarshal, pdwPriority, "HRESULT")
        return result
    }

    /**
     * The GetFormat method retrieves information about the wave format.
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx Pointer to a caller-allocated <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure into which the method writes information about the format. This value can be <b>NULL</b>. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} pdwWaveFormatExSize Pointer to a caller-allocated DWORD variable specifying the size in bytes of the structure that <i>pWaveFormatEx</i> points to. For more information, see the following Remarks section.
     * @returns {HRESULT} <code>GetFormat</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that one of the pointers is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_SYNTHNOTCONFIGURED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the synth is not open or is not properly configured.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-getformat
     */
    GetFormat(pWaveFormatEx, pdwWaveFormatExSize) {
        pdwWaveFormatExSizeMarshal := pdwWaveFormatExSize is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pWaveFormatEx, pdwWaveFormatExSizeMarshal, pdwWaveFormatExSize, "HRESULT")
        return result
    }

    /**
     * The GetAppend method outputs the number of additional wave samples that the DirectMusic &quot;port&quot; needs to have appended to the end of a download buffer.
     * @param {Pointer<Integer>} pdwAppend Output pointer for the number of samples to append. This parameter points to a caller-allocated variable into which the method writes a count specifying the number of appended samples for which memory is required. The required memory in bytes can be calculated from the wave format.
     * @returns {HRESULT} <code>GetAppend</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the pointer buffer is invalid.
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
     * Indicates that the method is not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynth-getappend
     */
    GetAppend(pdwAppend) {
        pdwAppendMarshal := pdwAppend is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pdwAppendMarshal, pdwAppend, "HRESULT")
        return result
    }
}
