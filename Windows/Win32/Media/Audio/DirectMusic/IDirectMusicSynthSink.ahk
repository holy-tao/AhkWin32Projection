#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\IReferenceClock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynthSink interface is now largely obsolete and is supported only by versions of DirectMusic before DirectX 8.
 * @see https://learn.microsoft.com/windows/win32/api/dmusics/nn-dmusics-idirectmusicsynthsink
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicSynthSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicSynthSink
     * @type {Guid}
     */
    static IID => Guid("{09823663-5c85-11d2-afa6-00aa0024d8b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "SetMasterClock", "GetLatencyClock", "Activate", "SampleToRefTime", "RefTimeToSample", "SetDirectSound", "GetDesiredBufferSize"]

    /**
     * The Init method initializes the synth-sink object.
     * @remarks
     * When a synthesizer is connected to a synth sink by a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-setsynthsink">IDirectMusicSynth::SetSynthSink</a>, the synthesizer calls the synth sink's <c>Init</c> method.
     * 
     * In order to avoid cyclical references, the <b>IDirectMusicSynthSink</b> does not increment the reference count of the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynth">IDirectMusicSynth</a> synth object. Instead, it abides by the rule that <b>IDirectMusicSynth</b> object is always the parent and always releases the <b>IDirectMusicSynthSink</b> object when it is done with it.
     * 
     * Once connected, the synth sink needs to be activated with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-activate">IDirectMusicSynthSink::Activate</a>. At this point it starts generating wave buffers, which it passes to the synthesizer by calling <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-render">IDirectMusicSynth::Render</a>.
     * 
     * The <i>pSynth</i> parameter follows the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/synthesizers-and-wave-sinks">Synthesizers and Wave Sinks</a>. Also see the description of the <b>IDirectMusic</b> interface in the Microsoft Windows SDK documentation.
     * @param {IDirectMusicSynth} pSynth Pointer to the synth object that the synth-sink object is to connect to. This parameter is a valid, non-NULL pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynth">IDirectMusicSynth</a> object.
     * @returns {HRESULT} <c>Init</c> returns S_OK if the call is successful. Otherwise, the method returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-init
     */
    Init(pSynth) {
        result := ComCall(3, this, "ptr", pSynth, "HRESULT")
        return result
    }

    /**
     * The SetMasterClock method provides the synth sink with a master time source, which is required for synchronization with the rest of DirectMusic.
     * @remarks
     * The synth sink cannot function until it has received a master clock to synchronize the streaming wave with the rest of DirectMusic.
     * 
     * Because the master time and sample time might be driven by different crystals, they can drift apart. The synth sink can lock its understanding of the current sample time to the master time with a phase-locked loop.
     * 
     * The master clock is different from the latency clock, which is retrieved from the synth sink with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-getlatencyclock">IDirectMusicSynth::GetLatencyClock</a>. While the master clock provides the time base, the latency clock simply tracks the progress of the rendering of notes into the wave stream. This enables the application to know the earliest time it can submit a message for playback by using the <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-playbuffer">IDirectMusicSynth::PlayBuffer</a> method. The latency clock should be tightly synchronized to the master clock, so its units are relative.
     * 
     * You can measure the latency of the synthesizer by comparing the time of the latency clock with that of the master clock. Note that the latency clock will have jitter, reflecting the bursty nature of synthesizer mixing (each call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-render">IDirectMusicSynth::Render</a> jumps forward by the buffer length). In contrast, the master clock increments smoothly.
     * 
     * The <i>pClock</i> parameter follows the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * @param {IReferenceClock} pClock Specifies the master clock to synchronize to. This parameter is a pointer to the master-clock object's <b>IReferenceClock</b> interface (described in the Microsoft Windows SDK documentation).
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method is unable to accept clock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock
     */
    SetMasterClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * The GetLatencyClock method retrieves the latency clock, which measures the progress of the output audio stream.
     * @remarks
     * The latency <b>IReferenceClock</b> returns the current render time whenever its <b>IReferenceClock::GetTime</b> method is called. This time is always relative to the time established by the master clock, installed in the synth sink by using <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock">IDirectMusicSynthSink::SetMasterClock</a>. The latency time is used by the performance layer of DirectMusic to identify the next available time to start playing a note.
     * 
     * The <i>ppClock</i> parameter follows the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * 
     * For more information about latency clocks, see <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/synthesizer-latency">Synthesizer Latency</a>. Also see the descriptions of the <b>IReferenceClock</b> and <b>IDirectMusic</b> interfaces in the Microsoft Windows SDK documentation.
     * @returns {IReferenceClock} Output pointer for the latency clock. This parameter points to a caller-allocated pointer variable into which the method writes a pointer to the latency-clock object's <b>IReferenceClock</b> interface (described in the Microsoft Windows SDK documentation).
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-getlatencyclock
     */
    GetLatencyClock() {
        result := ComCall(5, this, "ptr*", &ppClock := 0, "HRESULT")
        return IReferenceClock(ppClock)
    }

    /**
     * The Activate method activates or deactivates the synthesizer sink.
     * @remarks
     * The synthesizer itself can be told to enable or disable the audio device. In turn, it calls the synth sink, which manages the audio device. This gives the application the ability to manage its use of resources. When it is not playing music, it can deactivate the sink to free the wave-output device for other applications.
     * 
     * For more information, see the description of the <b>IDirectMusic</b> interface in the Microsoft Windows SDK documentation.
     * @param {BOOL} fEnable Specifies whether to activate the synth sink. If <b>TRUE</b>, the method activates the synth sink. If <b>FALSE</b>, it deactivates it.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method is unable to activate or deactivate the synth sink.
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
     * Indicates that the synth is not set or not properly configured.
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
     * Indicates that the sink is already active.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_DSOUND_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that <b>SetDirectSound</b> hasn't been called successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMUS_E_NO_MASTER_CLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that <b>SetMasterClock</b> hasn't been called successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-activate
     */
    Activate(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * The SampleToRefTime method converts a sample time to a reference time.
     * @remarks
     * The <c>SampleToRefTime</c> method converts sample time to reference time. Sample time is expressed as the number of samples rendered, and reference time is measured in 100-nanosecond units.
     * 
     * The synth sink manages the timing relationship between the master clock (set with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock">IDirectMusicSynthSink::SetMasterClock</a>) and the audio stream.
     * 
     * For more information, see the description of reference time and sample time in <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/synthesizer-timing">Synthesizer Timing</a>.
     * @param {Integer} llSampleTime Specifies the sample time. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} prfTime Output pointer for the reference time. This parameter points to a caller-allocated REFERENCE_TIME variable into which the method writes the reference time.
     * @returns {HRESULT} <c>SampleToRefTime</c> returns S_OK if the call is successful. Otherwise, the method returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-sampletoreftime
     */
    SampleToRefTime(llSampleTime, prfTime) {
        prfTimeMarshal := prfTime is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "int64", llSampleTime, prfTimeMarshal, prfTime, "HRESULT")
        return result
    }

    /**
     * The RefTimeToSample method converts a reference time to a sample time.
     * @remarks
     * The <c>RefTimeToSample</c> method converts reference time to sample time. The method accepts a reference time as an input parameter, and it outputs the corresponding sample time.
     * 
     * The calculation of sample time from reference time depends on the sampling frequency. For example, if the output buffer is in a 44.2 kHz format, a sample time of 44,200 is equivalent to a reference time of one second.
     * 
     * The synth sink manages the timing relationship between the master clock (set with a call to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock">IDirectMusicSynthSink::SetMasterClock</a>) and the audio stream.
     * 
     * For more information, see the description of reference time and sample time in <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/synthesizer-timing">Synthesizer Timing</a>.
     * @param {Integer} rfTime Specifies the reference time. Reference time is measured in 100-nanosecond units.
     * @param {Pointer<Integer>} pllSampleTime Output pointer for the sample time. This parameter points to a caller-allocated LONGLONG variable into which the method writes the sample time.
     * @returns {HRESULT} <c>RefTimeToSample</c> returns S_OK if the call is successful. Otherwise, the method returns an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-reftimetosample
     */
    RefTimeToSample(rfTime, pllSampleTime) {
        pllSampleTimeMarshal := pllSampleTime is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "int64", rfTime, pllSampleTimeMarshal, pllSampleTime, "HRESULT")
        return result
    }

    /**
     * The SetDirectSound method connects the synthesizer sink with an existing DirectSound object and a DirectSound buffer.
     * @remarks
     * The <i>pDirectSound</i> parameter points to an <b>IDirectSound</b> instance that is received from <c>IDirectMusicPort::SetDirectSound</c> and is non-<b>NULL</b>.
     * 
     * If <i>pDirectSoundBuffer</i> is <b>NULL</b>, the primary buffer for <b>IDirectSound</b> will be upgraded, if necessary, to support the sample rate and channel information for the sink (obtained from <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynth-getformat">IDirectMusicSynth::GetFormat</a>).
     * 
     * The <b>IDirectSoundBuffer</b> should be a secondary streaming buffer with a format that matches the format obtained from the synthesizer. If <i>pDirectSoundBuffer</i> is <b>NULL</b>, then an appropriate <b>IDirectSoundBuffer</b> instance will be created internally.
     * 
     * Neither the <b>IDirectSound</b> nor the <b>IDirectSoundBuffer</b> instance can be changed once the sink has been activated.
     * 
     * The <i>pDirectSound</i> and <i>pDirectSoundBuffer</i> parameters follow the <a href="https://docs.microsoft.com/windows-hardware/drivers/audio/reference-counting-conventions-for-com-objects">reference-counting conventions for COM objects</a>.
     * 
     * For more information, see the description of the <b>IDirectSound</b>, <b>IDirectSoundBuffer</b>, and <b>IDirectMusicPort</b> interfaces in the Microsoft Windows SDK documentation.
     * @param {IDirectSound} pDirectSound Pointer to an <b>IDirectSound</b> object that the sink is to be associated with. This parameter is set to a valid, non-<b>NULL</b> pointer value.
     * @param {IDirectSoundBuffer} pDirectSoundBuffer Pointer to the <b>IDirectSoundBuffer</b> object that the sink is to be associated with. This parameter can be <b>NULL</b>. For more information, see the following Remarks section.
     * @returns {HRESULT} <c>SetDirectSound</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * Indicates that the synth not set.
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
     * Indicates that the sink is active.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-setdirectsound
     */
    SetDirectSound(pDirectSound, pDirectSoundBuffer) {
        result := ComCall(9, this, "ptr", pDirectSound, "ptr", pDirectSoundBuffer, "HRESULT")
        return result
    }

    /**
     * The GetDesiredBufferSize method retrieves the synthesizer's preferred buffer size, expressed in samples.
     * @remarks
     * The <c>GetDesiredBufferSize</c> method returns the desired buffer size based on the current format of the synth. DirectSound buffers passed to <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nf-dmusics-idirectmusicsynthsink-setdirectsound">IDirectMusicSynthSink::SetDirectSound</a> might be invalid unless they are at least this size.
     * 
     * For more information, see the description of the <b>IDirectMusicPort</b> interface in the Microsoft Windows SDK documentation.
     * @param {Pointer<Integer>} pdwBufferSizeInSamples Output pointer for the buffer size. This parameter points to a caller-allocated variable into which the method writes the desired buffer length, expressed in samples.
     * @returns {HRESULT} <c>GetDesiredBufferSize</c> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * Indicates that the synth is not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/dmusics/nf-dmusics-idirectmusicsynthsink-getdesiredbuffersize
     */
    GetDesiredBufferSize(pdwBufferSizeInSamples) {
        pdwBufferSizeInSamplesMarshal := pdwBufferSizeInSamples is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBufferSizeInSamplesMarshal, pdwBufferSizeInSamples, "HRESULT")
        return result
    }
}
