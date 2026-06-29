#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A callback interface allows applications to receive notifications when the list of audio effects changes or the resources needed to enable an effect changes.
 * @remarks
 * Register the callback interface by calling [IAudioEffectsManager::RegisterAudioEffectsChangedNotificationCallback](nf-audioclient-iaudioeffectsmanager-registeraudioeffectschangednotificationcallback.md).
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iaudioeffectschangednotificationclient
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioEffectsChangedNotificationClient extends IUnknown {
    /**
     * The interface identifier for IAudioEffectsChangedNotificationClient
     * @type {Guid}
     */
    static IID := Guid("{a5ded44f-3c5d-4b2b-bd1e-5dc1ee20bbf6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEffectsChangedNotificationClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAudioEffectsChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEffectsChangedNotificationClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the system when the list of audio effects changes or the resources needed to enable an effect changes.
     * @remarks
     * Register the callback interface by calling [IAudioEffectsManager::RegisterAudioEffectsChangedNotificationCallback](nf-audioclient-iaudioeffectsmanager-registeraudioeffectschangednotificationcallback.md).
     * @returns {HRESULT} An HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioeffectschangednotificationclient-onaudioeffectschanged
     */
    OnAudioEffectsChanged() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEffectsChangedNotificationClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAudioEffectsChanged := CallbackCreate(GetMethod(implObj, "OnAudioEffectsChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAudioEffectsChanged)
    }
}
