#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback interface implemented by clients to receive notifications when audio system effect properties change.
 * @remarks
 * Register the interface to receive callbacks by calling [IAudioSystemEffectsPropertyStore::RegisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-registerpropertychangenotification.md). Unregister the callback interface by calling [IAudioSystemEffectsPropertyStore::UnregisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-unregisterpropertychangenotification.md).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-iaudiosystemeffectspropertychangenotificationclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSystemEffectsPropertyChangeNotificationClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffectsPropertyChangeNotificationClient
     * @type {Guid}
     */
    static IID => Guid("{20049d40-56d5-400e-a2ef-385599feed49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPropertyChanged"]

    /**
     * Called by the system when an audio system effects property changes.
     * @remarks
     * Register to receive callbacks by calling [IAudioSystemEffectsPropertyStore::RegisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-registerpropertychangenotification.md). Unregister the callback interface by calling [IAudioSystemEffectsPropertyStore::UnregisterPropertyChangeNotification](nf-mmdeviceapi-iaudiosystemeffectspropertystore-unregisterpropertychangenotification.md).
     * 
     * This method will not be called if the registry is manually edited. A notification is generated only when [IPropertyStore::SetValue](../propsys/nf-propsys-ipropertystore-setvalue.md) is called on the associated default, user, or volatile property store.
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Integer} type A value from the [AUDIO_SYSTEMEFFECTS_PROPERTYSTORE_TYPE](ne-mmdeviceapi-audio_systemeffects_propertystore_type.md) specifying the type of the property store that triggered the callback.
     * @param {PROPERTYKEY} key A [PROPERTYKEY](../wtypes/ns-wtypes-propertykey.md) structure identifying the property that changed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertychangenotificationclient-onpropertychanged
     */
    OnPropertyChanged(type, key) {
        result := ComCall(3, this, "int", type, "ptr", key, "HRESULT")
        return result
    }
}
