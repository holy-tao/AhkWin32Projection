#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\AUDIO_VOLUME_NOTIFICATION_DATA.ahk" { AUDIO_VOLUME_NOTIFICATION_DATA }

/**
 * The IAudioEndpointVolumeCallback interface provides notifications of changes in the volume level and muting state of an audio endpoint device.
 * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback
 * @namespace Windows.Win32.Media.Audio.Endpoints
 */
export default struct IAudioEndpointVolumeCallback extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointVolumeCallback
     * @type {Guid}
     */
    static IID := Guid("{657804fa-d6ad-4496-8a60-352752af4f89}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointVolumeCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointVolumeCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnNotify method notifies the client that the volume level or muting state of the audio endpoint device has changed.
     * @remarks
     * The <i>pNotify</i> parameter points to a structure that describes the volume change event that initiated the call to <b>OnNotify</b>. This structure contains an event-context GUID. This GUID enables a client to distinguish between a volume (or muting) change that it initiated and one that some other client initiated. When calling an <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a> method that changes the volume level of the stream, a client passes in a pointer to an event-context GUID that its implementation of the <b>OnNotify</b> method can recognize. The structure pointed to by <i>pNotify</i> contains this context GUID. If the client that changes the volume level supplies a <b>NULL</b> pointer value for the pointer to the event-context GUID, the value of the event-context GUID in the structure pointed to by <i>pNotify</i> is GUID_NULL.
     * 
     * The Windows 7, the system's volume user interface does not specify GUID_NULL when it changes the volume in the system.   A third-party OSD application can differentiate between master volume control changes that result from the system's volume user interface, and other volume changes such as changes from the built-in volume control handler.
     * 
     * For a code example that implements the <b>OnNotify</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-volume-controls">Endpoint Volume Controls</a>.
     * @param {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>} pNotify Pointer to the volume-notification data. This parameter points to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/ns-endpointvolume-audio_volume_notification_data">AUDIO_VOLUME_NOTIFICATION_DATA</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify
     */
    OnNotify(pNotify) {
        result := ComCall(3, this, AUDIO_VOLUME_NOTIFICATION_DATA.Ptr, pNotify, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEndpointVolumeCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnNotify := CallbackCreate(GetMethod(implObj, "OnNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnNotify)
    }
}
