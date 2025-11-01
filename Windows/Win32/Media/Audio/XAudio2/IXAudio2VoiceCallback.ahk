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
     * 
     * @param {Integer} BytesRequired 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onvoiceprocessingpassstart
     */
    OnVoiceProcessingPassStart(BytesRequired) {
        ComCall(0, this, "uint", BytesRequired)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onvoiceprocessingpassend
     */
    OnVoiceProcessingPassEnd() {
        ComCall(1, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onstreamend
     */
    OnStreamEnd() {
        ComCall(2, this)
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferstart
     */
    OnBufferStart(pBufferContext) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pBufferContextMarshal, pBufferContext)
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend
     */
    OnBufferEnd(pBufferContext) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(4, this, pBufferContextMarshal, pBufferContext)
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onloopend
     */
    OnLoopEnd(pBufferContext) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(5, this, pBufferContextMarshal, pBufferContext)
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @param {HRESULT} Error 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onvoiceerror
     */
    OnVoiceError(pBufferContext, Error) {
        pBufferContextMarshal := pBufferContext is VarRef ? "ptr" : "ptr"

        ComCall(6, this, pBufferContextMarshal, pBufferContext, "int", Error)
    }
}
