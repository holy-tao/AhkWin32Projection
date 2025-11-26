#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The IXAudio2VoiceCallback interface contains methods that notify the client when certain events happen in a given IXAudio2SourceVoice.
 * @remarks
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nn-xaudio2-ixaudio2voicecallback
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2VoiceCallback extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnVoiceProcessingPassStart", "OnVoiceProcessingPassEnd", "OnStreamEnd", "OnBufferStart", "OnBufferEnd", "OnLoopEnd", "OnVoiceError"]

    /**
     * Called during each processing pass for each voice, just before XAudio2 reads data from the voice's buffer queue.
     * @remarks
     * 
     * For information about <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> topic.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Integer} BytesRequired The number of bytes that must be submitted immediately to avoid starvation. This allows the implementation of just-in-time streaming scenarios; the client can keep the absolute minimum data queued on the voice at all times, and pass it fresh data just before the data is required. This model provides the lowest possible latency attainable with XAudio2. For xWMA and XMA data <i>BytesRequired</i> will always be zero, since the concept of a frame of xWMA or XMA data is meaningless. 
     * 
     * <div class="alert"><b>Note</b>  In a situation where there is always plenty of data available on the source voice, <i>BytesRequired</i> should always report zero, because it doesn't need any samples immediately to avoid glitching.</div>
     * <div> </div>
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onvoiceprocessingpassstart
     */
    OnVoiceProcessingPassStart(BytesRequired) {
        ComCall(0, this, "uint", BytesRequired)
    }

    /**
     * Called just after the processing pass for the voice ends.
     * @remarks
     * 
     * For information about <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> topic.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onvoiceprocessingpassend
     */
    OnVoiceProcessingPassEnd() {
        ComCall(1, this)
    }

    /**
     * Called when the voice has just finished playing a contiguous audio stream.
     * @remarks
     * 
     * <b>OnStreamEnd</b> is triggered when XAudio2 processes an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> with the XAUDIO2_END_OF_STREAM flag set. See the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-submitsourcebuffer">IXAudio2SourceVoice::SubmitSourceBuffer</a> method for more information.
     * 
     * 
     * 
     * The <b>OnStreamEnd</b> callback indicates that XAudio2 has finished consuming the last buffer submitted to the voice. With PCM data, all audio is guaranteed to have been played and the voice can be stopped or destroyed safely. 
     * 
     * 
     * 
     * The <b>OnStreamEnd</b> callback only indicates that an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> with the XAUDIO2_END_OF_STREAM flag set has been processed. The callback is strictly informational and does not change the state of the source voice that triggered it. A voice stays in the start state until <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-stop">IXAudio2SourceVoice::Stop</a>    is called and will continue to play submitted source buffers and to trigger additional callbacks.
     * 
     * 
     * 
     * <b>OnStreamEnd</b> is guaranteed to be called just after the last byte of the current buffer has been consumed.
     * 
     * 
     * 
     * For information about <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> topic.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onstreamend
     */
    OnStreamEnd() {
        ComCall(2, this)
    }

    /**
     * Called when the voice is about to start processing a new audio buffer.
     * @remarks
     * 
     * <i>pBufferContext</i> is the context pointer originally provided by the <b>pContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure, which may be NULL.
     * 
     * 
     * 
     * <b>OnBufferStart</b> is guaranteed to be called just before the first byte of the current buffer is consumed. It is appropriate to use this callback for changes to the voice state such as the following.
     * 
     * <ul>
     * <li>Submitting a new buffer to the voice
     * 
     * </li>
     * <li>Adjusting the volume, pitch, and effect parameters of the voice
     * 
     * </li>
     * <li>Enabling or disabling an effect in the voice's effect chain</li>
     * </ul>All the actions listed above are synchronous when performed in an XAudio2 callback, so the changes will take effect immediately, affecting the buffer that is about to start.
     * 
     * 
     * 
     * It is also safe to use this callback to write audio data to the buffer directly, which can be useful for low-latency streaming scenarios. However, as with all XAudio2 callbacks, no work should be done that uses a significant amount of processor time or could block execution, including synchronous disk or network reads.
     * 
     * 
     * 
     * For information about the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> section.
     * 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer<Void>} pBufferContext Context pointer that was assigned to the pContext member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure when the buffer was submitted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferstart
     */
    OnBufferStart(pBufferContext) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pBufferContextMarshal, pBufferContext)
    }

    /**
     * Called when the voice finishes processing a buffer.
     * @remarks
     * 
     * After an <b>OnBufferEnd</b> callback the audio memory for the buffer associated with <i>pBufferContext</i> can safely be released.
     * 
     * 
     * 
     * <i>pBufferContext</i> is the context pointer originally provided by the <b>pContext </b>member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure, which may be NULL.
     * 
     * 
     * 
     * <b>OnBufferEnd</b> is guaranteed to be called just after the last byte of the current buffer has been consumed and before the first byte of the next buffer is consumed. This callback can be used to overwrite or release the audio data referenced by the completed buffer, and to update other state associated with the voice as appropriate.
     * 
     * 
     * 
     * For information about <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> topic.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer<Void>} pBufferContext Context pointer assigned to the <b>pContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure when the buffer was submitted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend
     */
    OnBufferEnd(pBufferContext) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(4, this, pBufferContextMarshal, pBufferContext)
    }

    /**
     * Called when the voice reaches the end position of a loop.
     * @remarks
     * 
     * <i>pBufferContext</i> is the context pointer originally provided by the <b>pContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure, which may be NULL.
     * 
     * 
     * 
     * <b>OnLoopEnd</b> is not sample-accurate; that is, actions in the callback do not occur at the exact moment that a given sample is being processed. It is only guaranteed to be called shortly after the last sample in the loop has been processed.
     * 
     * 
     * 
     * For information about the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voicecallback">IXAudio2VoiceCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> section.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer<Void>} pBufferContext Context pointer that was assigned to the <b>pContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure when the buffer was submitted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onloopend
     */
    OnLoopEnd(pBufferContext) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(5, this, pBufferContextMarshal, pBufferContext)
    }

    /**
     * Called when a critical error occurs during voice processing.
     * @remarks
     * 
     * <b>OnVoiceError</b> is called in the event of an error during voice processing, such as a hardware XMA decoder error on the Xbox 360. The arguments report which buffer was being processed at the time of the error, and its HRESULT code. If the error is not recoverable by destroying and re-creating the voice, the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2enginecallback-oncriticalerror">OnCriticalError</a> engine callback will be called as well. 
     * 
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {Pointer<Void>} pBufferContext Context pointer that was assigned to the <b>pContext</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> structure when the buffer was submitted.
     * @param {HRESULT} Error The HRESULT code of the error encountered.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2voicecallback-onvoiceerror
     */
    OnVoiceError(pBufferContext, Error) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(6, this, pBufferContextMarshal, pBufferContext, "int", Error)
    }
}
