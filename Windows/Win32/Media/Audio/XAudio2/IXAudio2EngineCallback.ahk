#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IXAudio2EngineCallback interface contains methods that notify the client when certain events happen in the IXAudio2 engine.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nn-xaudio2-ixaudio2enginecallback
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct IXAudio2EngineCallback extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXAudio2EngineCallback interfaces
    */
    struct Vtbl {
        OnProcessingPassStart : IntPtr
        OnProcessingPassEnd   : IntPtr
        OnCriticalError       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXAudio2EngineCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by XAudio2 just before an audio processing pass begins.
     * @remarks
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2enginecallback-onprocessingpassstart
     */
    OnProcessingPassStart() {
        ComCall(0, this)
    }

    /**
     * Called by XAudio2 just after an audio processing pass ends.
     * @remarks
     * For information about the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2enginecallback">IXAudio2EngineCallback</a> interface methods, see the XAudio2 <a href="https://docs.microsoft.com/windows/desktop/xaudio2/callbacks">Callbacks</a> section.
     * 
     * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
     * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2enginecallback-onprocessingpassend
     */
    OnProcessingPassEnd() {
        ComCall(1, this)
    }

    /**
     * Called if a critical system error occurs that requires XAudio2 to be closed down and restarted.
     * @remarks
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
     * @param {HRESULT} _Error Error code returned by XAudio2.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/xaudio2/nf-xaudio2-ixaudio2enginecallback-oncriticalerror
     */
    OnCriticalError(_Error) {
        ComCall(2, this, "int", _Error)
    }

    Query(iid) {
        if (IXAudio2EngineCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
