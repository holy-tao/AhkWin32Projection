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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Integer} BytesRequired 
     * @returns {String} Nothing - always returns an empty string
     */
    OnVoiceProcessingPassStart(BytesRequired) {
        ComCall(0, this, "uint", BytesRequired)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnVoiceProcessingPassEnd() {
        ComCall(1, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnStreamEnd() {
        ComCall(2, this)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @returns {String} Nothing - always returns an empty string
     */
    OnBufferStart(pBufferContext) {
        ComCall(3, this, "ptr", pBufferContext)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @returns {String} Nothing - always returns an empty string
     */
    OnBufferEnd(pBufferContext) {
        ComCall(4, this, "ptr", pBufferContext)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @returns {String} Nothing - always returns an empty string
     */
    OnLoopEnd(pBufferContext) {
        ComCall(5, this, "ptr", pBufferContext)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBufferContext 
     * @param {HRESULT} Error 
     * @returns {String} Nothing - always returns an empty string
     */
    OnVoiceError(pBufferContext, Error) {
        ComCall(6, this, "ptr", pBufferContext, "int", Error)
        return result
    }
}
