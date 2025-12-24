#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXAudio2Voice.ahk

/**
 * Use a source voice to submit audio data to the XAudio2 processing pipeline.
 * @remarks
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nn-xaudio2-ixaudio2sourcevoice
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2SourceVoice extends IXAudio2Voice{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "SubmitSourceBuffer", "FlushSourceBuffers", "Discontinuity", "ExitLoop", "GetState", "SetFrequencyRatio", "GetFrequencyRatio", "SetSourceSampleRate"]

    /**
     * Starts consumption and processing of audio by the voice. Delivers the result to any connected submix or mastering voices, or to the output device.
     * @param {Integer} Flags Flags that control how the voice is started. Must be 0.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-start
     */
    Start(Flags, OperationSet) {
        result := ComCall(19, this, "uint", Flags, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Stops consumption of audio by the current voice.
     * @param {Integer} Flags Flags that control how the voice is stopped. Can be 0 or the following: 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAUDIO2_PLAY_TAILS</td>
     * <td>Continue emitting effect output after the voice is stopped. </td>
     * </tr>
     * </table>
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-stop
     */
    Stop(Flags, OperationSet) {
        result := ComCall(20, this, "uint", Flags, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Adds a new audio buffer to the voice queue.
     * @param {Pointer<XAUDIO2_BUFFER>} pBuffer Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure to queue.
     * @param {Pointer<XAUDIO2_BUFFER_WMA>} pBufferWMA Pointer to an additional <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer_wma">XAUDIO2_BUFFER_WMA</a> structure used when submitting WMA data.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-submitsourcebuffer
     */
    SubmitSourceBuffer(pBuffer, pBufferWMA) {
        result := ComCall(21, this, "ptr", pBuffer, "ptr", pBufferWMA, "HRESULT")
        return result
    }

    /**
     * Removes all pending audio buffers from the voice queue.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-flushsourcebuffers
     */
    FlushSourceBuffers() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * Notifies an XAudio2 voice that no more buffers are coming after the last one that is currently in its queue.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-discontinuity
     */
    Discontinuity() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Stops looping the voice when it reaches the end of the current loop region.
     * @param {Integer} OperationSet 
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-exitloop
     */
    ExitLoop(OperationSet) {
        result := ComCall(24, this, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the voice's current cursor position data.
     * @remarks
     * 
     * If a client needs to get the correlated positions of several voices (for example, to know exactly which sample of a given voice is playing when a given sample of another voice is playing), it must make <b>GetState</b> calls in an XAudio2 engine callback. This ensures that none of the voices advance while the calls are being made. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> overview for information about using XAudio2 callbacks.
     * 
     * 
     * 
     * Note that the DirectX SDK versions of XAUDIO2 do not take the Flags parameter for <b>GetState</b>.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer<XAUDIO2_VOICE_STATE>} pVoiceState Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_state">XAUDIO2_VOICE_STATE</a> structure containing the state of the voice.
     * @param {Integer} Flags Flags controlling which voice state data should be returned. Valid values are 0 or <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>. The default value is 0. If you specify <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>, <b>GetState</b> returns only the buffer state, not the sampler state. <b>GetState</b> takes roughly one-third as much time to complete when you specify 
     * <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-getstate
     */
    GetState(pVoiceState, Flags) {
        ComCall(25, this, "ptr", pVoiceState, "uint", Flags)
    }

    /**
     * Sets the frequency adjustment ratio of the voice.
     * @param {Float} Ratio Frequency adjustment ratio. This value must be between XAUDIO2_MIN_FREQ_RATIO and the <i>MaxFrequencyRatio</i> parameter specified when the voice was created (see <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-createsourcevoice">IXAudio2::CreateSourceVoice</a>). XAUDIO2_MIN_FREQ_RATIO currently is 0.0005, which allows pitch to be lowered by up to 11 octaves.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio
     */
    SetFrequencyRatio(Ratio, OperationSet) {
        result := ComCall(26, this, "float", Ratio, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the frequency adjustment ratio of the voice.
     * @remarks
     * 
     * <b>GetFrequencyRatio</b> always returns the voice's actual current frequency ratio. However, this may not match the ratio set by the most recent <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio">IXAudio2SourceVoice::SetFrequencyRatio</a> call: the actual ratio is only changed the next time the audio engine runs after the <b>IXAudio2SourceVoice::SetFrequencyRatio</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2SourceVoice::SetFrequencyRatio</b> was called with a deferred operation ID).
     * 
     * 
     * 
     * For information on frequency ratios, see <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio">IXAudio2SourceVoice::SetFrequencyRatio</a>.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer<Float>} pRatio Returns the current frequency adjustment ratio if successful.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-getfrequencyratio
     */
    GetFrequencyRatio(pRatio) {
        pRatioMarshal := pRatio is VarRef ? "float*" : "ptr"

        ComCall(27, this, pRatioMarshal, pRatio)
    }

    /**
     * Reconfigures the voice to consume source data at a different sample rate than the rate specified when the voice was created.
     * @param {Integer} NewSourceSampleRate The new sample rate the voice should process submitted data at. Valid sample rates are 1kHz to 200kHz.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2sourcevoice-setsourcesamplerate
     */
    SetSourceSampleRate(NewSourceSampleRate) {
        result := ComCall(28, this, "uint", NewSourceSampleRate, "HRESULT")
        return result
    }
}
