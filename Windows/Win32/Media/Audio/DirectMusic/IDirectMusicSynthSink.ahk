#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\IReferenceClock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynthSink interface is now largely obsolete and is supported only by versions of DirectMusic before DirectX 8.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/nn-dmusics-idirectmusicsynthsink
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
     * @param {IDirectMusicSynth} pSynth Pointer to the synth object that the synth-sink object is to connect to. This parameter is a valid, non-NULL pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dmusics/nn-dmusics-idirectmusicsynth">IDirectMusicSynth</a> object.
     * @returns {HRESULT} <code>Init</code> returns S_OK if the call is successful. Otherwise, the method returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-init
     */
    Init(pSynth) {
        result := ComCall(3, this, "ptr", pSynth, "HRESULT")
        return result
    }

    /**
     * The SetMasterClock method provides the synth sink with a master time source, which is required for synchronization with the rest of DirectMusic.
     * @param {IReferenceClock} pClock Specifies the master clock to synchronize to. This parameter is a pointer to the master-clock object's <b>IReferenceClock</b> interface (described in the Microsoft Windows SDK documentation).
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the method is unable to accept clock.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-setmasterclock
     */
    SetMasterClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * The GetLatencyClock method retrieves the latency clock, which measures the progress of the output audio stream.
     * @returns {IReferenceClock} Output pointer for the latency clock. This parameter points to a caller-allocated pointer variable into which the method writes a pointer to the latency-clock object's <b>IReferenceClock</b> interface (described in the Microsoft Windows SDK documentation).
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-getlatencyclock
     */
    GetLatencyClock() {
        result := ComCall(5, this, "ptr*", &ppClock := 0, "HRESULT")
        return IReferenceClock(ppClock)
    }

    /**
     * The Activate method activates or deactivates the synthesizer sink.
     * @param {BOOL} fEnable Specifies whether to activate the synth sink. If <b>TRUE</b>, the method activates the synth sink. If <b>FALSE</b>, it deactivates it.
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
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-activate
     */
    Activate(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * The SampleToRefTime method converts a sample time to a reference time.
     * @param {Integer} llSampleTime Specifies the sample time. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} prfTime Output pointer for the reference time. This parameter points to a caller-allocated REFERENCE_TIME variable into which the method writes the reference time.
     * @returns {HRESULT} <code>SampleToRefTime</code> returns S_OK if the call is successful. Otherwise, the method returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-sampletoreftime
     */
    SampleToRefTime(llSampleTime, prfTime) {
        prfTimeMarshal := prfTime is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "int64", llSampleTime, prfTimeMarshal, prfTime, "HRESULT")
        return result
    }

    /**
     * The RefTimeToSample method converts a reference time to a sample time.
     * @param {Integer} rfTime Specifies the reference time. Reference time is measured in 100-nanosecond units.
     * @param {Pointer<Integer>} pllSampleTime Output pointer for the sample time. This parameter points to a caller-allocated LONGLONG variable into which the method writes the sample time.
     * @returns {HRESULT} <code>RefTimeToSample</code> returns S_OK if the call is successful. Otherwise, the method returns an appropriate error code.
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-reftimetosample
     */
    RefTimeToSample(rfTime, pllSampleTime) {
        pllSampleTimeMarshal := pllSampleTime is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "int64", rfTime, pllSampleTimeMarshal, pllSampleTime, "HRESULT")
        return result
    }

    /**
     * The SetDirectSound method connects the synthesizer sink with an existing DirectSound object and a DirectSound buffer.
     * @param {IDirectSound} pDirectSound Pointer to an <b>IDirectSound</b> object that the sink is to be associated with. This parameter is set to a valid, non-<b>NULL</b> pointer value.
     * @param {IDirectSoundBuffer} pDirectSoundBuffer Pointer to the <b>IDirectSoundBuffer</b> object that the sink is to be associated with. This parameter can be <b>NULL</b>. For more information, see the following Remarks section.
     * @returns {HRESULT} <code>SetDirectSound</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-setdirectsound
     */
    SetDirectSound(pDirectSound, pDirectSoundBuffer) {
        result := ComCall(9, this, "ptr", pDirectSound, "ptr", pDirectSoundBuffer, "HRESULT")
        return result
    }

    /**
     * The GetDesiredBufferSize method retrieves the synthesizer's preferred buffer size, expressed in samples.
     * @param {Pointer<Integer>} pdwBufferSizeInSamples Output pointer for the buffer size. This parameter points to a caller-allocated variable into which the method writes the desired buffer length, expressed in samples.
     * @returns {HRESULT} <code>GetDesiredBufferSize</code> returns S_OK if the call was successful. Otherwise, the method returns an appropriate error code. The following table shows some of the possible return status codes.
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
     * @see https://docs.microsoft.com/windows/win32/api//dmusics/nf-dmusics-idirectmusicsynthsink-getdesiredbuffersize
     */
    GetDesiredBufferSize(pdwBufferSizeInSamples) {
        pdwBufferSizeInSamplesMarshal := pdwBufferSizeInSamples is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pdwBufferSizeInSamplesMarshal, pdwBufferSizeInSamples, "HRESULT")
        return result
    }
}
