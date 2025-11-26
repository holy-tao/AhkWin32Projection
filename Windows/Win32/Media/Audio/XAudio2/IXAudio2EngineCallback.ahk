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
    static VTableNames => ["OnProcessingPassStart", "OnProcessingPassEnd", "OnCriticalError"]

    /**
     * Called by XAudio2 just before an audio processing pass begins.
     * @remarks
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2enginecallback-onprocessingpassstart
     */
    OnProcessingPassStart() {
        ComCall(0, this)
    }

    /**
     * Called by XAudio2 just after an audio processing pass ends.
     * @remarks
     * 
     * For information about the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> interface methods, see the XAudio2 <a href="https://docs.microsoft.com/windows/desktop/xaudio2/callbacks">Callbacks</a> section.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2enginecallback-onprocessingpassend
     */
    OnProcessingPassEnd() {
        ComCall(1, this)
    }

    /**
     * Called if a critical system error occurs that requires XAudio2 to be closed down and restarted.
     * @remarks
     * 
     * If you provide the ID of a  specific device in the <i>szDeviceId</i> parameter to   <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-createmasteringvoice">IXAudio2::CreateMasteringVoice</a> or use the XAUDIO2_NO_VIRTUAL_AUDIO_CLIENT flag, then a critical error will occur and <b>OnCriticalError</b> is raised if the underlying WASAPI rendering device becomes unavailable. This can occur when a headset or speaker is unplugged or when a USB audio device is removed, for example.   Once a critical error has occurred, audio processing stops and all further calls to XAudio2 fail. The only way to recover in this situation is to release the XAudio2 instance and create a new one.
     * 
     * 
     * 
     * 
     * 
     * If you specified NULL or  <i>szDeviceId</i> parameter to   <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-createmasteringvoice">IXAudio2::CreateMasteringVoice</a>, then the system uses a Virtual Audio Client to represent the audio endpoint. In this case, if the underlying WASAPI rendering device becomes unavailable, the system automatically selects a new audio rendering device for rendering, audio processing continues, and <b>OnCriticalError</b> is not raised.
     * 
     * On the mobile device family, a Virtual Audio Client is always used and <b>OnCriticalError</b> is never raised, regardless of the values you provide to    <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-createmasteringvoice">CreateMasteringVoice</a>.
     * 
     * For information about the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> interface methods, see the <a href="https://docs.microsoft.com/windows/desktop/xaudio2/xaudio2-callbacks">XAudio2 Callbacks</a> section.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * 
     * 
     * @param {HRESULT} Error Error code returned by XAudio2.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nf-xaudio2-ixaudio2enginecallback-oncriticalerror
     */
    OnCriticalError(Error) {
        ComCall(2, this, "int", Error)
    }
}
