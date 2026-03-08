#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to manage audio system effects audio stores and to register for notifications when audio system effect properties change.
 * @remarks
 * This API is intended to support OEMs and app developers who want the ability to query and modify the property store associated with an audio device and publish HSA apps in the Microsoft Store. In order to use this API, you must specify the restricted *audioDeviceConfiguration* capability in your app package manifest. This is a restricted capability. For more information, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-iaudiosystemeffectspropertystore
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSystemEffectsPropertyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSystemEffectsPropertyStore
     * @type {Guid}
     */
    static IID => Guid("{302ae7f9-d7e0-43e4-971b-1f8293613d2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDefaultPropertyStore", "OpenUserPropertyStore", "OpenVolatilePropertyStore", "ResetUserPropertyStore", "ResetVolatilePropertyStore", "RegisterPropertyChangeNotification", "UnregisterPropertyChangeNotification"]

    /**
     * Opens the audio system effects default property store.
     * @remarks
     * This method will only open existing property stores under the context registry keys. It will not create a new key if one is not present in the associated INF file. Attempting to access a property store that does not already exist will result in an E_NOTFOUND error.
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Integer} stgmAccess The storage-access mode. This parameter specifies whether to open the property store in read mode, write mode, or read/write mode. Set this parameter to one of the following STGM constants:
     * 
     * STGM_READ
     * 
     * STGM_WRITE
     * 
     * STGM_READWRITE
     * 
     * The method permits a client running as an administrator to open a store for read-only, write-only, or read/write access. A client that is not running as an administrator is restricted to read-only access.
     * @returns {IPropertyStore} Receives a pointer to an [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) representing the default property store.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-opendefaultpropertystore
     */
    OpenDefaultPropertyStore(stgmAccess) {
        result := ComCall(3, this, "uint", stgmAccess, "ptr*", &propStore := 0, "HRESULT")
        return IPropertyStore(propStore)
    }

    /**
     * Opens the audio system effects user property store.
     * @remarks
     * This method will only open existing property stores under the context registry keys. It will not create a new key if one is not present in the associated INF file. Attempting to access a property store that does not already exist will result in an E_NOTFOUND error.
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Integer} stgmAccess The storage-access mode. This parameter specifies whether to open the property store in read mode, write mode, or read/write mode. Set this parameter to one of the following STGM constants:
     * 
     * STGM_READ
     * 
     * STGM_WRITE
     * 
     * STGM_READWRITE
     * 
     * The method permits a client running as an administrator to open a store for read-only, write-only, or read/write access. A client that is not running as an administrator is restricted to read-only access.
     * @returns {IPropertyStore} Receives a pointer to an [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) representing the user property store.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-openuserpropertystore
     */
    OpenUserPropertyStore(stgmAccess) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr*", &propStore := 0, "HRESULT")
        return IPropertyStore(propStore)
    }

    /**
     * Opens the audio system effects volatile property store.
     * @remarks
     * This method will only open existing property stores under the context registry keys. It will not create a new key if one is not present in the associated INF file. Attempting to access a property store that does not already exist will result in an E_NOTFOUND error.
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {Integer} stgmAccess The storage-access mode. This parameter specifies whether to open the property store in read mode, write mode, or read/write mode. Set this parameter to one of the following STGM constants:
     * 
     * STGM_READ
     * 
     * STGM_WRITE
     * 
     * STGM_READWRITE
     * 
     * The method permits a client running as an administrator to open a store for read-only, write-only, or read/write access. A client that is not running as an administrator is restricted to read-only access.
     * @returns {IPropertyStore} Receives a pointer to an [IPropertyStore](../propsys/nn-propsys-ipropertystore.md) representing the volatile property store.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-openvolatilepropertystore
     */
    OpenVolatilePropertyStore(stgmAccess) {
        result := ComCall(5, this, "uint", stgmAccess, "ptr*", &propStore := 0, "HRESULT")
        return IPropertyStore(propStore)
    }

    /**
     * Deletes all existing key value pairs in the audio system effect user property store.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @returns {HRESULT} S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-resetuserpropertystore
     */
    ResetUserPropertyStore() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Deletes all existing key value pairs in the audio system effect volatile property store.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @returns {HRESULT} S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-resetvolatilepropertystore
     */
    ResetVolatilePropertyStore() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Registers an IAudioSystemEffectsPropertyChangeNotificationClient callback interface to receive notifications when audio system effect properties change.
     * @remarks
     * This method should not be used by APOs and should only be used by hardware support apps to register for notifications.
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {IAudioSystemEffectsPropertyChangeNotificationClient} callback A pointer to the **IAudioSystemEffectsPropertyChangeNotificationClient** callback interface to register.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-registerpropertychangenotification
     */
    RegisterPropertyChangeNotification(callback) {
        result := ComCall(8, this, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * Unregisters an IAudioSystemEffectsPropertyChangeNotificationClient callback interface.
     * @remarks
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @param {IAudioSystemEffectsPropertyChangeNotificationClient} callback A pointer to the **IAudioSystemEffectsPropertyChangeNotificationClient** callback interface to unregister.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-unregisterpropertychangenotification
     */
    UnregisterPropertyChangeNotification(callback) {
        result := ComCall(9, this, "ptr", callback, "HRESULT")
        return result
    }
}
