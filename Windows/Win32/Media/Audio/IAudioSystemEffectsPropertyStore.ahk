#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @param {Integer} stgmAccess 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-opendefaultpropertystore
     */
    OpenDefaultPropertyStore(stgmAccess) {
        result := ComCall(3, this, "uint", stgmAccess, "ptr*", &propStore := 0, "HRESULT")
        return IPropertyStore(propStore)
    }

    /**
     * 
     * @param {Integer} stgmAccess 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-openuserpropertystore
     */
    OpenUserPropertyStore(stgmAccess) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr*", &propStore := 0, "HRESULT")
        return IPropertyStore(propStore)
    }

    /**
     * 
     * @param {Integer} stgmAccess 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-openvolatilepropertystore
     */
    OpenVolatilePropertyStore(stgmAccess) {
        result := ComCall(5, this, "uint", stgmAccess, "ptr*", &propStore := 0, "HRESULT")
        return IPropertyStore(propStore)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-resetuserpropertystore
     */
    ResetUserPropertyStore() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-resetvolatilepropertystore
     */
    ResetVolatilePropertyStore() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioSystemEffectsPropertyChangeNotificationClient} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-registerpropertychangenotification
     */
    RegisterPropertyChangeNotification(callback) {
        result := ComCall(8, this, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAudioSystemEffectsPropertyChangeNotificationClient} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iaudiosystemeffectspropertystore-unregisterpropertychangenotification
     */
    UnregisterPropertyChangeNotification(callback) {
        result := ComCall(9, this, "ptr", callback, "HRESULT")
        return result
    }
}
