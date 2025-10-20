#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The IXAudio2EngineCallback interface contains methods that notify the client when certain events happen in the IXAudio2 engine.
 * @remarks
 * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nn-xaudio2-ixaudio2enginecallback
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2EngineCallback extends Win32ComInterface{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnProcessingPassStart() {
        ComCall(0, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    OnProcessingPassEnd() {
        ComCall(1, this)
        return result
    }

    /**
     * 
     * @param {HRESULT} Error 
     * @returns {String} Nothing - always returns an empty string
     */
    OnCriticalError(Error) {
        ComCall(2, this, "int", Error)
        return result
    }
}
