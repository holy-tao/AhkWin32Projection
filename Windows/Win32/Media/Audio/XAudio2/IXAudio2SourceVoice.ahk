#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXAudio2Voice.ahk

/**
 * Use a source voice to submit audio data to the XAudio2 processing pipeline.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nn-xaudio2-ixaudio2sourcevoice
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
     * @remarks
     * If the XAudio2 engine is stopped, the voice stops running. However, it remains in the started state, so that it starts running again as soon as the engine starts.
     * 
     * 
     * 
     * When first created, source voices are in the stopped state. Submix and mastering voices are in the started state.
     * 
     * 
     * 
     * After <b>Start</b> is called it has no further effect if called again before <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-stop">IXAudio2SourceVoice::Stop</a> is called. In addition multiple calls to <b>Start</b> without matching calls to <b>IXAudio2SourceVoice::Stop</b> will result in warning messages in debug builds.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} Flags Flags that control how the voice is started. Must be 0.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-start
     */
    Start(Flags, OperationSet) {
        result := ComCall(19, this, "uint", Flags, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Stops consumption of audio by the current voice.
     * @remarks
     * All source buffers that are queued on the voice and the current cursor position are preserved. This allows the voice to continue from where it left off, when it is restarted. The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-flushsourcebuffers">IXAudio2SourceVoice::FlushSourceBuffers</a> method can be used to flush queued source buffers.
     * 
     * 
     * 
     * By default, any pending output from voice effects—for example, reverb tails—is not played. Instead, the voice is immediately rendered silent. The XAUDIO2_PLAY_TAILS flag can be used to continue emitting effect output after the voice stops running.
     * 
     * 
     * 
     * A voice stopped with the XAUDIO2_PLAY_TAILS flag stops consuming source buffers, but continues to process its effects and send audio to its destination voices. A voice in this state can later be stopped completely by calling <b>Stop</b> again with the Flags argument set to 0. This enables stopping a voice with XAUDIO2_PLAY_TAILS, waiting sufficient time for any audio being produced by its effects to finish, and then fully stopping the voice by calling <b>Stop</b> again without XAUDIO2_PLAY_TAILS. This technique allows voices with effects to be stopped gracefully while ensuring idle voices will not continue to be processed after they have finished producing audio.
     * 
     * 
     * 
     * <b>Stop</b> is always asynchronous, even if called within a callback.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  XAudio2 never calls any voice callbacks for a voice if the voice is stopped (even if it was stopped with XAUDIO2_PLAY_TAILS).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
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
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-stop
     */
    Stop(Flags, OperationSet) {
        result := ComCall(20, this, "uint", Flags, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Adds a new audio buffer to the voice queue.
     * @remarks
     * The voice processes and plays back the buffers in its queue in the order that they were submitted.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure includes details about the audio buffer's location and size, the part of the buffer that should actually be played, the loop region (if any) and loop count, the context pointer to be used in any callbacks relating to this buffer, and an optional XAUDIO2_END_OF_STREAM flag that indicates that it is the last buffer of a contiguous sound.
     * 
     * 
     * 
     * If the voice is started and has no buffers queued, the new buffer will start playing immediately. If the voice is stopped, the buffer is added to the voice's queue and will be played when the voice starts.
     * 
     * 
     * 
     * If only part of the given buffer should be played, the <b>PlayBegin</b> and <b>PlayLength</b> fields in the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> can be used to specify the region to be played. A <b>PlayLength</b> value of 0 means to play the entire buffer (and in this case <b>PlayBegin</b> must be 0 as well).
     * 
     * 
     * 
     * If all or part of the buffer should be played in a continuous loop, the <b>LoopBegin</b>, <b>LoopLength</b> and <b>LoopCount</b> fields in <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> can be used to specify the characteristics of the loop region. A <b>LoopBegin</b> value of XAUDIO2_NO_LOOP_REGION means that no looping should be performed, and in this case <b>LoopLength</b> and <b>LoopCount</b> must be given as 0. If a loop region is specified, it must be non-empty (<b>LoopLength</b> &gt; 0), and the loop count must be between 1 and XAUDIO2_MAX_LOOP_COUNT inclusive (or XAUDIO2_LOOP_INFINITE to specify an endless loop which will only end when <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-exitloop">IXAudio2SourceVoice::ExitLoop</a> is called). A loop count of <i>N</i> means to skip backwards N times, i.e. to play the loop region <i>N</i>+1 times.
     * 
     * 
     * 
     * If an explicit play region is specified, it must begin and end within the given audio buffer (or, in the compressed case, within the set of samples that the buffer will decode to). In addition, the loop region cannot end past the end of the play region.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>For certain audio formats, there may be additional restrictions on the valid endpoints of any play or loop regions; e.g. for XMA buffers, the regions can only begin or end at 128-sample boundaries in the decoded audio.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The <i>pBuffer</i> pointer can be reused or freed immediately after calling this method, but the actual audio data referenced by <i>pBuffer</i> must remain valid until the buffer has been fully consumed by XAudio2 (which is indicated by the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend">IXAudio2VoiceCallback::OnBufferEnd</a> callback).
     * 
     * 
     * 
     * Up to XAUDIO2_MAX_QUEUED_BUFFERS buffers can be queued on a voice at any one time.
     * 
     * 
     * 
     * <b>SubmitSourceBuffer</b> takes effect immediately when called from an XAudio2 callback with an OperationSet of XAUDIO2_COMMIT_NOW.
     * 
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>This method can be called from an Xbox system thread (most other XAudio2 methods cannot). However, a maximum of two source buffers can be submitted from a system thread at a time.</td>
     * </tr>
     * </table>
     *  
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_BUFFER>} pBuffer Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure to queue.
     * @param {Pointer<XAUDIO2_BUFFER_WMA>} pBufferWMA Pointer to an additional <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer_wma">XAUDIO2_BUFFER_WMA</a> structure used when submitting WMA data.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-submitsourcebuffer
     */
    SubmitSourceBuffer(pBuffer, pBufferWMA) {
        result := ComCall(21, this, "ptr", pBuffer, "ptr", pBufferWMA, "HRESULT")
        return result
    }

    /**
     * Removes all pending audio buffers from the voice queue.
     * @remarks
     * If the voice is started, the buffer that is currently playing is not removed from the queue.
     * 
     * 
     * 
     * <b>FlushSourceBuffers</b> can be called regardless of whether the voice is currently started or stopped.
     * 
     * 
     * 
     * For every buffer removed, an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend">OnBufferEnd</a> callback will be made, but none of the other per-buffer callbacks (<a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferstart">OnBufferStart</a>, <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onstreamend">OnStreamEnd</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onloopend">OnLoopEnd</a>) will be made.
     * 
     * 
     * 
     * <b>FlushSourceBuffers</b> does not change a the voice's running state, so if the voice was playing a buffer prior to the call, it will continue to do so, and will deliver all the callbacks for the buffer normally. This means that the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend">OnBufferEnd</a> callback for this buffer will take place after the <b>OnBufferEnd</b> callbacks for the buffers that were removed. Thus, an XAudio2 client that calls <b>FlushSourceBuffers</b> cannot expect to receive <b>OnBufferEnd</b> callbacks in the order in which the buffers were submitted.
     * 
     * 
     * 
     * No warnings for starvation of the buffer queue will be emitted when the currently playing buffer completes; it is assumed that the client has intentionally removed the buffers that followed it. However, there may be an audio pop if this buffer does not end at a zero crossing. If the application must ensure that the flush operation takes place while a specific buffer is playing—perhaps because the buffer ends with a zero crossing—it must call <b>FlushSourceBuffers</b> from a callback, so that it executes synchronously.
     * 
     * 
     * 
     * Calling <b>FlushSourceBuffers</b> after a voice is stopped and then submitting new data to the voice resets all of the voice's internal counters.
     * 
     * 
     * 
     * A voice's state is not considered reset after calling <b>FlushSourceBuffers</b> until the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend">OnBufferEnd</a> callback occurs (if a buffer was previously submitted) or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-getstate">IXAudio2SourceVoice::GetState</a> returns with <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_state">XAUDIO2_VOICE_STATE</a>. <b>BuffersQueued</b> == 0. For example, if you stop a voice and call <b>FlushSourceBuffers</b>, it's still not legal to immediately call <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setsourcesamplerate">IXAudio2SourceVoice::SetSourceSampleRate</a> (which requires the voice to not have any buffers currently queued), until either of the previously mentioned conditions are met. 
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-flushsourcebuffers
     */
    FlushSourceBuffers() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * Notifies an XAudio2 voice that no more buffers are coming after the last one that is currently in its queue.
     * @remarks
     * <b>Discontinuity</b> suppresses the warnings that normally occur in the debug build of XAudio2 when a voice runs out of audio buffers to play. It is preferable to mark the final buffer of a stream by tagging it with the XAUDIO2_END_OF_STREAM flag, but in some cases the client may not know that a buffer is the end of a stream until after the buffer has been submitted.
     * 
     * 
     * 
     * Because calling <b>Discontinuity</b> is equivalent to applying the XAUDIO2_END_OF_STREAM flag retroactively to the last buffer submitted, an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onstreamend">OnStreamEnd</a> callback will be made when this buffer completes.
     * 
     * 
     * <div class="alert"><b>Note</b>  XAudio2 may consume its entire buffer queue and emit a warning before the <b>Discontinuity</b> call takes effect, so <b>Discontinuity</b> is not guaranteed to suppress the warnings.</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-discontinuity
     */
    Discontinuity() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * Stops looping the voice when it reaches the end of the current loop region.
     * @remarks
     * If the cursor for the voice is not in a loop region, <b>ExitLoop</b> does nothing.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} OperationSet 
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of XAudio2 specific error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-exitloop
     */
    ExitLoop(OperationSet) {
        result := ComCall(24, this, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the voice's current cursor position data.
     * @remarks
     * If a client needs to get the correlated positions of several voices (for example, to know exactly which sample of a given voice is playing when a given sample of another voice is playing), it must make <b>GetState</b> calls in an XAudio2 engine callback. This ensures that none of the voices advance while the calls are being made. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> overview for information about using XAudio2 callbacks.
     * 
     * 
     * 
     * Note that the DirectX SDK versions of XAUDIO2 do not take the Flags parameter for <b>GetState</b>.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<XAUDIO2_VOICE_STATE>} pVoiceState Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_voice_state">XAUDIO2_VOICE_STATE</a> structure containing the state of the voice.
     * @param {Integer} Flags Flags controlling which voice state data should be returned. Valid values are 0 or <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>. The default value is 0. If you specify <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>, <b>GetState</b> returns only the buffer state, not the sampler state. <b>GetState</b> takes roughly one-third as much time to complete when you specify 
     * <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-getstate
     */
    GetState(pVoiceState, Flags) {
        ComCall(25, this, "ptr", pVoiceState, "uint", Flags)
    }

    /**
     * Sets the frequency adjustment ratio of the voice.
     * @remarks
     * Frequency adjustment is expressed as <i>source frequency</i> / <i>target frequency</i>. Changing the frequency ratio changes the rate audio is played on the voice. A ratio greater than 1.0 will cause the audio to play faster and a ratio less than 1.0 will cause the audio to play slower. Additionally, the frequency ratio affects the pitch of audio on the voice. As an example, a value of 1.0 has no effect on the audio, whereas a value of 2.0 raises pitch by one octave and 0.5 lowers it by one octave.
     * 
     * 
     * 
     * If <b>SetFrequencyRatio</b> is called specifying a Ratio value outside the valid range, the method will set the frequency ratio to the nearest valid value. A warning also will be generated for debug builds.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-getfrequencyratio">IXAudio2SourceVoice::GetFrequencyRatio</a> always returns the voice's actual current frequency ratio. However, this may not match the ratio set by the most recent <b>IXAudio2SourceVoice::SetFrequencyRatio</b> call: the actual ratio is only changed the next time the audio engine runs after the <b>IXAudio2SourceVoice::SetFrequencyRatio</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2SourceVoice::SetFrequencyRatio</b> was called with a deferred operation ID).</div>
     * <div> </div>
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Float} Ratio Frequency adjustment ratio. This value must be between XAUDIO2_MIN_FREQ_RATIO and the <i>MaxFrequencyRatio</i> parameter specified when the voice was created (see <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-createsourcevoice">IXAudio2::CreateSourceVoice</a>). XAUDIO2_MIN_FREQ_RATIO currently is 0.0005, which allows pitch to be lowered by up to 11 octaves.
     * @param {Integer} OperationSet Identifies this call as part of a deferred batch. See the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-operation-sets">XAudio2 Operation Sets</a> overview for more information.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio
     */
    SetFrequencyRatio(Ratio, OperationSet) {
        result := ComCall(26, this, "float", Ratio, "uint", OperationSet, "HRESULT")
        return result
    }

    /**
     * Returns the frequency adjustment ratio of the voice.
     * @remarks
     * <b>GetFrequencyRatio</b> always returns the voice's actual current frequency ratio. However, this may not match the ratio set by the most recent <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio">IXAudio2SourceVoice::SetFrequencyRatio</a> call: the actual ratio is only changed the next time the audio engine runs after the <b>IXAudio2SourceVoice::SetFrequencyRatio</b> call (or after the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-commitchanges">IXAudio2::CommitChanges</a> call, if <b>IXAudio2SourceVoice::SetFrequencyRatio</b> was called with a deferred operation ID).
     * 
     * 
     * 
     * For information on frequency ratios, see <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setfrequencyratio">IXAudio2SourceVoice::SetFrequencyRatio</a>.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Pointer<Float>} pRatio Returns the current frequency adjustment ratio if successful.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-getfrequencyratio
     */
    GetFrequencyRatio(pRatio) {
        pRatioMarshal := pRatio is VarRef ? "float*" : "ptr"

        ComCall(27, this, pRatioMarshal, pRatio)
    }

    /**
     * Reconfigures the voice to consume source data at a different sample rate than the rate specified when the voice was created.
     * @remarks
     * The <b>SetSourceSampleRate</b> method supports reuse of XAudio2 voices by allowing a voice to play sounds with a variety of sample rates. To use <b>SetSourceSampleRate</b> the voice must have been created without the XAUDIO2_VOICE_NOPITCH or XAUDIO2_VOICE_NOSRC flags and must not have any buffers currently queued.
     * 
     * 
     * 
     * The typical use of <b>SetSourceSampleRate</b> is to support voice pooling. For example to support voice pooling an application would precreate all the voices it expects to use. Whenever a new sound will be played the application chooses an inactive voice or ,if all voices are busy, picks the least important voice and calls <b>SetSourceSampleRate</b> on the voice with the new sound's sample rate. After <b>SetSourceSampleRate</b> has been called on the voice, the application can immediately start submitting and playing buffers with the new sample rate. This allows the application to avoid the overhead of creating and destroying voices frequently during gameplay.
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @param {Integer} NewSourceSampleRate The new sample rate the voice should process submitted data at. Valid sample rates are 1kHz to 200kHz.
     * @returns {HRESULT} Returns S_OK if successful, an error code otherwise. See <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-error-codes">XAudio2 Error Codes</a> for descriptions of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-setsourcesamplerate
     */
    SetSourceSampleRate(NewSourceSampleRate) {
        result := ComCall(28, this, "uint", NewSourceSampleRate, "HRESULT")
        return result
    }
}
