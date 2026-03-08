#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\IReferenceClock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynth interface is used by DirectMusic to communicate with user-mode synthesizers.
 * @see https://learn.microsoft.com/windows/win32/api/dmusics/nn-dmusics-idirectmusicsynth
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
     * @remarks
     * The DirectMusic synthesizer "port" can be opened only once. A second attempt to open the port will fail.
     * 
     * However, DirectMusic does support multiple instances of a synthesizer port. It does this by calling <b>CoCreateInstance</b> (described in the Windows SDK documentation) to create multiple <b>IDirectMusicSynth</b> objects.
     * 
     * The port is valid until it is closed by the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-close">IDirectMusicSynth::Close</a> method.
     * 
     * When opening the port, some of the parameters asked for in DMUS_PORTPARAMS might not be supported or the port might "upgrade" a parameter request (that is, return the maximum number of voices supported instead of just what was asked for). In either of these cases, the Microsoft Software Synthesizer will return S_FALSE and modify DMUS_PORTPARAMS accordingly, to show what is actually supported. Custom synths should emulate this behavior to ensure compatibility with existing code.
     * 
     * Opening a port is not enough to enable the synthesizer. The synthesizer is enabled by opening the port and enabling audio output through <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-activate">IDirectMusicSynth::Activate</a>.
     * 
     * Avoid confusing the term DirectMusic "port" with a DMus port driver. A DirectMusic port corresponds to a render or capture pin on a DirectMusic filter. For more information about DirectMusic ports, see the description of the <b>IDirectMusicPort</b> interface in the Windows SDK documentation.
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams Pointer to a DMUS_PORTPARAMS structure (described in the Microsoft Windows SDK documentation) specifying a set of options for opening the DirectMusic "port". The structure contains setup parameters for the port, including sample rate, stereo mode, and number of voices. If this parameter is set to <b>NULL</b>, default settings are used.
     * @returns {HRESULT} <c>Open</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-open
     */
    Open(pPortParams) {
        result := ComCall(3, this, "ptr", pPortParams, "HRESULT")
        return result
    }

    /**
     * The Close method closes a DirectMusic &quot;port&quot;, which is a DirectMusic term for a device that sends or receives music data.
     * @remarks
     * This method closes a DirectMusic "port" that was previously opened by a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-open">IDirectMusicSynth::Open</a>.
     * 
     * When the DirectMusic "port" closes, it automatically releases all instruments and waves that were previously downloaded to the port. However, a good practice for applications is to explicitly free these objects before closing the port.
     * 
     * Avoid confusing the term DirectMusic "port" with a DMus port driver. A DirectMusic port corresponds to a render or capture pin on a DirectMusic filter. For more information about DirectMusic ports, see the description of the <b>IDirectMusicPort</b> interface in the Microsoft Windows SDK documentation.
     * @returns {HRESULT} <c>Close</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The SetNumChannelGroups method instructs the synthesizer to set its number of channel groups to a new value.
     * @remarks
     * Even though <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-open">IDirectMusicSynth::Open</a> tells the DirectMusic "port" how many channel groups to create, the application might later need to dynamically increase or reduce that number with a call to <c>SetNumChannelGroups</c>.
     * 
     * Each channel group supports a set of 16 MIDI channels. For example, if <i>dwChannelGroups</i> is set to three, the synthesizer creates 48 channels.
     * 
     * For more information, see the description of the <b>IDirectMusic</b> interface in the Microsoft Windows SDK documentation.
     * @param {Integer} dwGroups Specifies the number of channel groups requested.
     * @returns {HRESULT} <c>SetNumChannelGroups</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setnumchannelgroups
     */
    SetNumChannelGroups(dwGroups) {
        result := ComCall(5, this, "uint", dwGroups, "HRESULT")
        return result
    }

    /**
     * The Download method downloads a wave or instrument definition to the synthesizer.
     * @remarks
     * The data is stored in a continuous chunk of memory, pointed to by <i>pvData</i>. However, at the head of the chunk are two data structures, which define the nature of the data to follow. These are the DMUS_DOWNLOADINFO and DMUS_OFFSETTABLE structures (described in Microsoft Windows SDK documentation). DMUS_DOWNLOADINFO is a header that describes how to parse the data, including its size and intention (wave or instrument.) DMUS_OFFSETTABLE provides a set of byte offsets into the data segment that follows. All parsing through the data is managed through this table. 
     * 
     * Whenever a structure in the data references another structure, it describes it by an index into the offset table. The offset table then converts it into a byte offset into the data. This allows the synthesizer to do bounds checking on all references, making the implementation more robust. In kernel-mode implementations, the driver can make its own private copy of the offset table, and so ensure that an application in user mode cannot alter its referencing and cause a crash.
     * 
     * The <b>dwDLType</b> member of DMUS_DOWNLOADINFO specifies the type of data being downloaded. It is set to DMUS_DOWNLOADINFO_INSTRUMENT for an instrument, DMUS_DOWNLOADINFO_WAVE for a wave. As new data types emerge, identifiers will be allocated for them. <b>dwDLId</b> holds a unique 32-bit identifier for the object. This identifier is used to connect objects together. In the case of level-1 DLS, the identifier is used to connect waves to instruments. The <b>dwNumOffsetTableEntries</b> member of DMUS_DOWNLOADINFO describes the number of entries in the DMUS_OFFSETTABLE structure, which follows. Finally, the <b>cbSize</b> member specifies the total size of the memory chunk that consists of DMUS_DOWNLOADINFO + DMUS_OFFSETTABLE + data chunk.
     * 
     * Note that the download memory is always padded with an extra 32 bytes. This allows synthesizer implementations that require additional padding at the end of loops for multipoint interpolation to fill the space after the end of a wave chunk with additional data, up to 32 bytes. This additional padding is reflected by <b>cbSize</b>.
     * 
     * Depending on the synthesizer implementation, the synthesizer might decide to use the memory in the download chunk. After all, if enough memory has been allocated to store a wave, that same memory can be used by the synthesizer to store it for playback. So the synthesizer has the option of retaining the memory, and it returns its decision in the <i>pbFree</i> parameter. If it does keep the memory, then the caller must not free it. Later, the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-unload">IDirectMusicSynth::Unload</a> method has a callback mechanism to handle asynchronous freeing of the memory once the unload request has been made.
     * @param {Pointer<HANDLE>} phDownload Output pointer for the download handle. This parameter points to a caller-allocated variable into which the method writes a handle identifying the download data. The caller uses this handle later to unload the data.
     * @param {Pointer<Void>} pvData Pointer to a continuous memory segment containing download data. For an overview of the data format, see the description of low-level DLS in the DirectMusic section of the Microsoft Windows SDK documentation.
     * @param {Pointer<BOOL>} pbFree Output pointer for a status value indicating whether the memory for the download data can be freed. This parameter points to a caller-allocated variable into which the method writes a Boolean value indicating whether the caller can free the storage pointed to by <i>pvData</i>. If <b>TRUE</b>, the application can safely free the memory after the return. If <b>FALSE</b>, the caller must keep the memory pointed to by <i>pvData</i> allocated until it is unloaded.
     * @returns {HRESULT} <c>Download</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-download
     */
    Download(phDownload, pvData, pbFree) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"
        pbFreeMarshal := pbFree is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", phDownload, pvDataMarshal, pvData, pbFreeMarshal, pbFree, "HRESULT")
        return result
    }

    /**
     * The Unload method unloads a DLS resource (waveform or articulation data for a MIDI instrument) that was previously downloaded by a call to IDirectMusicSynth::Download.
     * @remarks
     * When the caller downloads a DLS resource to the synthesizer by calling <b>IDirectMusicSynth::Download</b>, the synthesizer has the option of either making its own copy of the DLS resource or continuing to use the caller's copy of the DLS resource. The <b>Download</b> method specifies one of these options by the value that it outputs through its <i>pbFree</i> parameter:
     * 
     * <ul>
     * <li>
     * *<i>pbFree</i>=<b>TRUE</b> if the synthesizer makes its own copy. In this case, the caller can free the DLS memory on return from <b>Download</b>. Also, the caller can specify the values for the <c>Unload</c> method's <i>lpFreeHandle</i> and <i>hUserData</i> parameters as <b>NULL</b>.
     * 
     * </li>
     * <li>
     * *<i>pbFree</i>=<b>FALSE</b> if the synthesizer keeps a pointer to the caller's copy. In this case, the caller must maintain its allocation of the memory containing the DLS resource until the synthesizer has finished using that memory.
     * 
     * </li>
     * </ul>
     * In the latter case, the caller must not release the memory for the DLS resource immediately on return from the <c>Unload</c> call because the synthesizer might still be in the process of rendering a note that uses the DLS resource. Instead, the caller must wait for the synthesizer to call the <i>lpFreeHandle</i> callback routine, which the synthesizer will do as soon as the note finishes and the memory is no longer needed.
     * 
     * For more information, see the descriptions of the <b>IDirectMusic</b> and <b>IDirectMusicPort</b> interfaces and the <b>IDirectMusicPort::UnloadInstrument</b> method in the Microsoft Windows SDK documentation.
     * @param {HANDLE} hDownload Handle to the DLS resource, which was obtained from a previous call to the <b>IDirectMusicSynth::Download</b> method. If the <i>lpFreeHandle</i> parameter below is non-<b>NULL</b>, the synthesizer passes this handle as the first parameter to the <i>lpFreeHandle</i> callback routine.
     * @param {Pointer} lpFreeHandle Pointer to a callback routine that will be called when the memory containing the DLS resource is no longer in use. If the original call to <b>IDirectMusicSynth::Download</b> returned <b>FALSE</b> in <i>pbFree</i>, this means that the synthesizer continued accessing the caller-allocated memory in the download chunk after the return from <b>Download</b>. If so, the synthesizer notifies the caller as soon as the memory can be freed, but this might occur later than the return from <c>Unload</c> because the DLS resource might be currently in use. The callback function takes two handles as call parameters. The first of these two handles is the <i>hDownload</i> parameter (see above), and the second is the <i>hUserData</i> parameter (see below).
     * @param {HANDLE} hUserData Pointer to user data, which is passed as the second parameter to the <i>lpFreeHandle</i> callback function above. The meaning of this value is known only to the caller, but it is typically a pointer to context information describing the state of the memory that is to be freed.
     * @returns {HRESULT} <c>Unload</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-unload
     */
    Unload(hDownload, lpFreeHandle, hUserData) {
        hDownload := hDownload is Win32Handle ? NumGet(hDownload, "ptr") : hDownload
        hUserData := hUserData is Win32Handle ? NumGet(hUserData, "ptr") : hUserData

        result := ComCall(7, this, "ptr", hDownload, "ptr", lpFreeHandle, "ptr", hUserData, "HRESULT")
        return result
    }

    /**
     * The PlayBuffer method downloads a stream of MIDI messages to the synthesizer.
     * @remarks
     * This is the software synthesizer's implementation of the <b>IDirectMusicPort::PlayBuffer</b> method. For details on the buffer format, see the description of <b>IDirectMusicPort::PlayBuffer</b> in the Microsoft Windows SDK documentation.
     * 
     * In order to properly associate the time stamp of each MIDI message in the buffer, the synth needs to convert from the REFERENCE_TIME format to its internal sample-based time. Because the wave-output stream is actually managed by <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynthsink">IDirectMusicSynthSink</a>, the synth calls <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-reftimetosample">IDirectMusicSynthSink::RefTimeToSample</a> for each MIDI message to convert its time stamp into sample time.
     * 
     * Typically, the synthesizer pulls each MIDI message from the buffer, stamps it in sample time, and places it in its own internal queue. The queue is emptied later by the rendering process, which is managed by <b>IDirectMusicPort::Render</b> and called by the <b>IDirectMusicSynthSink</b> object.
     * 
     * For more information, see the descriptions of the <b>IDirectMusic</b>, <b>IDirectMusicPort</b>, and <b>IDirectMusicBuffer</b> interfaces in the Windows SDK documentation.
     * @param {Integer} rt Specifies the start time of the buffer. This value is specified in REFERENCE_TIME units, relative to the master clock, which was previously set with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-setmasterclock">IDirectMusicSynth::SetMasterClock</a>. Also, this value should be after the time returned by the clock in <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock">IDirectMusicSynth::GetLatencyClock</a>.
     * @param {Pointer<Integer>} pbBuffer Pointer to a memory buffer containing the time-stamped MIDI messages that the <b>IDirectMusicBuffer</b> object generates
     * @param {Integer} cbBuffer Specifies the size of the buffer in bytes.
     * @returns {HRESULT} <c>PlayBuffer</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-playbuffer
     */
    PlayBuffer(rt, pbBuffer, cbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "int64", rt, pbBufferMarshal, pbBuffer, "uint", cbBuffer, "HRESULT")
        return result
    }

    /**
     * The GetRunningStats method retrieves current information about the state of the synthesizer so that an application can tell how the synth is performing.
     * @remarks
     * The <c>GetRunningStats</c> method returns current information about the state of the synthesizer, including CPU loading, peak volume, and how many notes were stolen (from changing priority levels; see <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-setchannelpriority">IDirectMusicSynth::SetChannelPriority</a>). The method outputs these statistics into a DMUS_SYNTHSTATS structure.
     * 
     * An application can call <c>GetRunningStats</c> periodically to get the status of the synthesizer as it runs. All of the running status parameters, with the exception of <i>dwFreeMemory</i>, are refreshed every second.
     * 
     * An application typically accesses <c>GetRunningStats</c> indirectly by calling <b>IDirectMusicPort::GetRunningStats</b>, which is described in the Windows SDK documentation.
     * @param {Pointer<DMUS_SYNTHSTATS>} pStats Pointer to a DMUS_SYNTHSTATS structure (described in Microsoft Windows SDK documentation). The method writes the synth's statistics into this structure.
     * @returns {HRESULT} <c>GetRunningStats</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getrunningstats
     */
    GetRunningStats(pStats) {
        result := ComCall(9, this, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * The GetPortCaps method retrieves the capabilities of a DirectMusic &quot;port&quot;, which is a DirectMusic term for a device that sends or receives music data.
     * @remarks
     * When an application enumerates the available DirectMusic "ports" with a call to <b>IDirectMusic::EnumPort</b> (described in the Windows SDK documentation), DirectMusic calls each registered device's <c>GetPortCaps</c> method.
     * 
     * This means that the additional overhead of creating and initializing the synthesizer occurs with this call. It is a good idea to keep the overhead of simply creating a synthesizer to a minimum, because there is a chance that it is being created only so that its capabilities can be obtained, and then it will be released.
     * 
     * Avoid confusing the term DirectMusic "port" with a DMus port driver. A DirectMusic port corresponds to a render or capture pin on a DirectMusic filter. For more information about DirectMusic ports, see the description of the <b>IDirectMusicPort</b> interface in the Windows SDK documentation.
     * @param {Pointer<DMUS_PORTCAPS>} pCaps Pointer to a DMUS_PORTCAPS structure (described in the Microsoft Windows SDK documentation). The method writes the capabilities of the DirectMusic "port" into this structure.
     * @returns {HRESULT} <c>GetPortCaps</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getportcaps
     */
    GetPortCaps(pCaps) {
        result := ComCall(10, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * The SetMasterClock method provides the synthesizer with a master time source, which the synthesizer requires to synchronize itself with the rest of DirectMusic.
     * @remarks
     * The synthesizer wave-output device, which is managed by <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynthsink">IDirectMusicSynthSink</a>, cannot function until it has received a master clock to synchronize to. It phase locks its own internal clock to the master clock, and is thus able to provide timing information to the synthesizer so it can make sense of the time stamps it receives in the calls to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-playbuffer">IDirectMusicSynth::PlayBuffer</a>.
     * 
     * In most implementations, <c>SetMasterClock</c> does little more than pass the master clock to the <b>IDirectMusicSynthSink</b> with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock">IDirectMusicSynthSink::SetMasterClock</a>.
     * 
     * The master clock is very different from the latency clock, which is retrieved from the synth with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock">IDirectMusicSynth::GetLatencyClock</a>. While the master clock provides the time base, the latency clock simply tracks the progress of the synthesizer's render engine. This enables the application to know the earliest time that it can submit an event for playback by calling the <b>PlayBuffer</b> method. The latency clock is tightly synchronized to the master clock, so its units are relative.
     * 
     * You can measure the latency of the synthesizer by comparing the time of the latency clock with the master clock. Note that the latency clock will have jitter, reflecting the bursts of synthesizer mixing, while the master clock should increment smoothly. Latency should not exceed 450 milliseconds.
     * 
     * For more information, see the description of the <b>IDirectMusic</b> interface in the Windows SDK documentation.
     * 
     * The <i>pClock</i> parameter follows the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * @param {IReferenceClock} pClock Pointer to the master <b>IReferenceClock</b> (defined in Microsoft Windows SDK documentation) object, which is used by all devices in the current instance of DirectMusic.
     * @returns {HRESULT} <c>SetMasterClock</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setmasterclock
     */
    SetMasterClock(pClock) {
        result := ComCall(11, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * The GetLatencyClock method retrieves a reference to the IReferenceClock interface (described in the Microsoft Windows SDK documentation) of the reference-clock object that tracks the current mix time.
     * @remarks
     * This method returns the latency clock created by the wave sink (<a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynthsink">IDirectMusicSynthSink</a>) object, which handles the output audio stream. The latency clock returns the current render time whenever its <b>IReferenceClock::GetTime</b> method is called. This time is always relative to the time established by the master clock (installed in the synthesizer and wave sink through a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-setmasterclock">IDirectMusicSynth::SetMasterClock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock">IDirectMusicSynthSink::SetMasterClock</a>). The latency time is used by the performance to identify the next available time to start playing a note. The latency should not exceed 450 milliseconds.
     * 
     * For more information about latency clocks, see <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/synthesizer-latency">Synthesizer Latency</a>. Also see the description of the <b>IDirectMusic</b> and <b>IReferenceClock</b> interfaces in the Windows SDK documentation.
     * 
     * The <i>ppClock</i> parameter follows the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * @returns {IReferenceClock} Output pointer for the latency clock. This parameter points to a caller-allocated pointer variable into which the method writes a pointer to the latency-clock object's <b>IReferenceClock</b> interface. Through this interface, the synthesizer is able to get the current mix time. Specify a valid, non-NULL pointer value for this parameter.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock
     */
    GetLatencyClock() {
        result := ComCall(12, this, "ptr*", &ppClock := 0, "HRESULT")
        return IReferenceClock(ppClock)
    }

    /**
     * The Activate method enables or disables the audio device under program control.
     * @remarks
     * By enabling or disabling the audio device under program control, <c>Activate</c> gives the application the ability to manage its use of resources. When not playing music, the application can deactivate the wave-output resource, which frees it for other applications to use.
     * 
     * The wave-output resource is actually managed by a separate COM object, which has a <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynthsink">IDirectMusicSynthSink</a> interface. This object must first be connected with a call to <b>SetSynthSink</b>. Otherwise, the synthesizer will fail the <c>Activate</c> call with DMUS_E_NOSYNTHSINK.
     * 
     * Activation is mostly managed by the wave sink object. When <c>IDirectMusicSynth::Activate</c> is called, the synth sets its internal activation state and calls <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-activate">IDirectMusicSynthSink::Activate</a> to enable or disable the wave output.
     * @param {BOOL} fEnable Specifies whether to enable or disable the audio device. If <b>TRUE</b>, the method enables the device. If <b>FALSE</b>, the method disables it.
     * @returns {HRESULT} <c>Activate</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-activate
     */
    Activate(fEnable) {
        result := ComCall(13, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * The SetSynthSink method establishes the connection of the synth to the wave sink.
     * @remarks
     * Before the synthesizer can expose much of its functionality, it must be connected to a wave sink object, which is represented by the <b>IDirectMusicSynthSink</b> interface. The <c>IDirectMusicSynth::SetSynthSink</c> method establishes this connection.
     * 
     * The <b>IDirectMusicSynthSink</b> object does the work of actually connecting up to the ultimate audio destination, which might be DirectSound, Microsoft Win32 wave audio, or some other audio stream. The default implementation sends data to DirectSound.
     * 
     * This approach allows a synthesizer to connect to many different styles of audio out without special code within the synthesizer itself. This makes it very easy to connect one synthesizer implementation to any available wave-output device.
     * 
     * For more information, see the description of the <b>IDirectMusic</b> interface in the Microsoft Windows SDK documentation.
     * 
     * The <i>pSynthSink</i> parameter follows the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * @param {IDirectMusicSynthSink} pSynthSink Pointer to the synth sink. This parameter either points to the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynthsink">IDirectMusicSynthSink</a> sink object to connect to the synth, or is <b>NULL</b> to disconnect the synth from its current synth sink.
     * @returns {HRESULT} <c>SetSynthSink</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setsynthsink
     */
    SetSynthSink(pSynthSink) {
        result := ComCall(14, this, "ptr", pSynthSink, "HRESULT")
        return result
    }

    /**
     * The Render method is called by the synth sink to render to a buffer in the audio stream.
     * @remarks
     * Typically, a synthesizer manages converting messages into rendered wave data in two processes. In the first, it time stamps the MIDI messages it receives from the application via calls to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-playbuffer">IDirectMusicSynth::PlayBuffer</a> and places them in its own internal queue. Then, in response to <c>Render</c>, the second process generates audio by pulling MIDI messages from the queue and synthesizing the appropriate tones within the time span of the requested render buffer.
     * 
     * As the synthesizer renders the MIDI messages into the buffer, it calls <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-reftimetosample">IDirectMusicSynthSink::RefTimeToSample</a> to translate the MIDI time stamps into sample positions. This guarantees extremely accurate timing (as long as the <b>IDirectMusicSynthSink</b> implementation is well written).
     * 
     * For more information, see the description of the <b>IDirectMusic</b> interface in the Microsoft Windows SDK documentation.
     * @param {Pointer<Integer>} pBuffer Pointer to the buffer to write to
     * @param {Integer} dwLength Specifies the length of the buffer. The buffer length is expressed in samples, not bytes. The size in bytes of the buffer can vary, depending on the buffer's format, which the synth sets in response to an <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-activate">IDirectMusicSynth::Activate</a> command.
     * @param {Integer} llPosition Specifies the position in the audio stream. The position is expressed in samples, not bytes. The caller should always increment this value by <i>dwLength</i> after each call.
     * @returns {HRESULT} <c>Render</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-render
     */
    Render(pBuffer, dwLength, llPosition) {
        pBufferMarshal := pBuffer is VarRef ? "short*" : "ptr"

        result := ComCall(15, this, pBufferMarshal, pBuffer, "uint", dwLength, "int64", llPosition, "HRESULT")
        return result
    }

    /**
     * The SetChannelPriority method sets the priority of a MIDI channel.
     * @remarks
     * The <c>SetChannelPriority</c> method is implemented to support the MIDI synthesis engine. This method allows the allocated voices to run at different priorities, depending on which channel they are on. Sometimes voices are freed when there are too many to deal with at one time, and they are kicked out based on the priority of the channel they are on. If a voice comes in on a higher-priority channel, and if there are no more free voices, the MIDI synthesis engine will steal a channel from the lowest-priority voice and reassign the channels.
     * 
     * For more information, see the description of the <b>IDirectMusicPort::GetChannelPriority</b> and <b>IDirectMusicPort::SetChannelPriority</b> methods in the Windows SDK documentation.
     * @param {Integer} dwChannelGroup Specifies the group the channel is in. This value must be one or greater.
     * @param {Integer} dwChannel Specifies a channel in the channel group. This parameter is an index in the range 0 to 15.
     * @param {Integer} dwPriority Specifies the priority ranking of the channel. For a list of the ranking values that are defined for this parameter, see the <b>IDirectMusicPort::GetChannelPriority</b> reference page in the Microsoft Windows SDK documentation.
     * @returns {HRESULT} <c>SetChannelPriority</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-setchannelpriority
     */
    SetChannelPriority(dwChannelGroup, dwChannel, dwPriority) {
        result := ComCall(16, this, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * The GetChannelPriority method outputs the priority of a MIDI channel.
     * @remarks
     * This method is used with the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-setchannelpriority">IDirectMusicSynth::SetChannelPriority</a> method to control the channel priorities and facilitate correct voice stealing.
     * 
     * For more information, see the descriptions of the <b>IDirectMusicPort::GetChannelPriority</b> and <b>IDirectMusicPort::SetChannelPriority</b> methods in the Windows SDK documentation.
     * @param {Integer} dwChannelGroup Specifies the channel group that the channel belongs to. This parameter must be one or greater.
     * @param {Integer} dwChannel Specifies the index of the channel in the channel group. This is a value in the range 0 to 15.
     * @param {Pointer<Integer>} pdwPriority Output pointer for the priority ranking. This parameter points to a caller-allocated variable into which the method writes the priority ranking value. For a list of the priority values that are defined for this parameter, see the <b>IDirectMusicPort::GetChannelPriority</b> reference page in the Microsoft Windows SDK documentation.
     * @returns {HRESULT} <c>GetChannelPriority</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getchannelpriority
     */
    GetChannelPriority(dwChannelGroup, dwChannel, pdwPriority) {
        pdwPriorityMarshal := pdwPriority is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", dwChannelGroup, "uint", dwChannel, pdwPriorityMarshal, pdwPriority, "HRESULT")
        return result
    }

    /**
     * The GetFormat method retrieves information about the wave format.
     * @remarks
     * The WAVEFORMATEX structure can have a variable length that depends on the details of the format. Therefore, before retrieving the format description, an application will first query the <b>IDirectMusicSynth</b> object for the size of the format by calling this method and specifying <b>NULL</b> for the <i>pWaveFormatEx</i> parameter. In this case, the synth should return the size of the structure in the <i>pdwWaveFormatExSize</i> parameter. The application can then allocate sufficient memory and call <c>IDirectMusicSynth::GetFormat</c> again to retrieve the format description.
     * 
     * If the <i>pWaveFormatEx</i> parameter is not <b>NULL</b>, DirectMusic writes, at most, <i>pdwWaveFormatExSize</i> bytes to <i>pWaveFormatEx</i>.
     * 
     * For more information, see the description of the <b>IDirectMusicPort</b> interface and <b>IDirectMusicPort::GetFormat</b> method in the Microsoft Windows SDK documentation.
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx Pointer to a caller-allocated <a href="https://docs.microsoft.com/windows/win32/api/mmreg/ns-mmreg-waveformatex">WAVEFORMATEX</a> structure into which the method writes information about the format. This value can be <b>NULL</b>. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} pdwWaveFormatExSize Pointer to a caller-allocated DWORD variable specifying the size in bytes of the structure that <i>pWaveFormatEx</i> points to. For more information, see the following Remarks section.
     * @returns {HRESULT} <c>GetFormat</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getformat
     */
    GetFormat(pWaveFormatEx, pdwWaveFormatExSize) {
        pdwWaveFormatExSizeMarshal := pdwWaveFormatExSize is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pWaveFormatEx, pdwWaveFormatExSizeMarshal, pdwWaveFormatExSize, "HRESULT")
        return result
    }

    /**
     * The GetAppend method outputs the number of additional wave samples that the DirectMusic &quot;port&quot; needs to have appended to the end of a download buffer.
     * @remarks
     * This method is called to determine how much extra storage to provide at the end of a download buffer. The method outputs a count indicating the number of additional wave samples by which the buffer should be extended.
     * 
     * When downloading a waveform, the synth might need to attach a little more data at the end of the waveform, depending on how the synth is implemented. The port's synthesis engine can use this extra memory to interpolate across a loop boundary.
     * 
     * For example, if a wave loops for 20 samples at the end, the interpolation math that calculates what to do as it loops back might require some extra data at the end so that it can interpolate properly.
     * 
     * Extending the download buffer by the <i>pdwAppend</i> amount allows the synth to simply add the extra samples to the end of the buffer. Otherwise, the synth would have to copy the contents of the download buffer to a larger buffer in order to have room to append the extra data.
     * 
     * Avoid confusing the term DirectMusic "port" with a DMus port driver. A DirectMusic port corresponds to a render or capture pin on a DirectMusic filter. For more information about DirectMusic ports, see the description of the <b>IDirectMusicPort</b> interface in the Microsoft Windows SDK documentation.
     * @param {Pointer<Integer>} pdwAppend Output pointer for the number of samples to append. This parameter points to a caller-allocated variable into which the method writes a count specifying the number of appended samples for which memory is required. The required memory in bytes can be calculated from the wave format.
     * @returns {HRESULT} <c>GetAppend</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynth-getappend
     */
    GetAppend(pdwAppend) {
        pdwAppendMarshal := pdwAppend is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pdwAppendMarshal, pdwAppend, "HRESULT")
        return result
    }
}
