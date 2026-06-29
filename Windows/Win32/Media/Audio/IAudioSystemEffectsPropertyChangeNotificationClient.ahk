#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE.ahk" { AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A callback interface implemented by clients to receive notifications when audio system effect properties change.
 * @remarks
 * Register the interface to receive callbacks by calling [IAudioSystemEffectsPropertyStore::RegisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-registerpropertychangenotification.md). Unregister the callback interface by calling [IAudioSystemEffectsPropertyStore::UnregisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-unregisterpropertychangenotification.md).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-iaudiosystemeffectspropertychangenotificationclient
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IAudioSystemEffectsPropertyChangeNotificationClient extends IUnknown {
    /**
     * The interface identifier for IAudioSystemEffectsPropertyChangeNotificationClient
     * @type {Guid}
     */
    static IID := Guid("{20049d40-56d5-400e-a2ef-385599feed49}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioSystemEffectsPropertyChangeNotificationClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPropertyChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioSystemEffectsPropertyChangeNotificationClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the system when an audio system effects property changes.
     * @remarks
     * Register to receive callbacks by calling [IAudioSystemEffectsPropertyStore::RegisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-registerpropertychangenotification.md). Unregister the callback interface by calling [IAudioSystemEffectsPropertyStore::UnregisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-unregisterpropertychangenotification.md).
     * 
     * This method will not be called if the registry is manually edited. A notification is generated only when [IPropertyStore::SetValue](../propsys/nf-propsys-ipropertystore-setvalue.md) is called on the associated default, user, or volatile property store.
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE} type A value from the [AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE](ne-mmdeviceapi-audio_systemeffects_propertystore_type.md) specifying the type of the property store that triggered the callback.
     * @param {PROPERTYKEY} key A [PROPERTYKEY](../wtypes/ns-wtypes-propertykey.md) structure identifying the property that changed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertychangenotificationclient-onpropertychanged
     */
    OnPropertyChanged(type, key) {
        result := ComCall(3, this, AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE, type, PROPERTYKEY, key, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioSystemEffectsPropertyChangeNotificationClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPropertyChanged := CallbackCreate(GetMethod(implObj, "OnPropertyChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPropertyChanged)
    }
}
