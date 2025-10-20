#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSystemEffectsPropertyStore extends IUnknown{
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
     * 
     * @param {Integer} stgmAccess 
     * @param {Pointer<IPropertyStore>} propStore 
     * @returns {HRESULT} 
     */
    OpenDefaultPropertyStore(stgmAccess, propStore) {
        result := ComCall(3, this, "uint", stgmAccess, "ptr", propStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} stgmAccess 
     * @param {Pointer<IPropertyStore>} propStore 
     * @returns {HRESULT} 
     */
    OpenUserPropertyStore(stgmAccess, propStore) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr", propStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} stgmAccess 
     * @param {Pointer<IPropertyStore>} propStore 
     * @returns {HRESULT} 
     */
    OpenVolatilePropertyStore(stgmAccess, propStore) {
        result := ComCall(5, this, "uint", stgmAccess, "ptr", propStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetUserPropertyStore() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetVolatilePropertyStore() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioSystemEffectsPropertyChangeNotificationClient>} callback 
     * @returns {HRESULT} 
     */
    RegisterPropertyChangeNotification(callback) {
        result := ComCall(8, this, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAudioSystemEffectsPropertyChangeNotificationClient>} callback 
     * @returns {HRESULT} 
     */
    UnregisterPropertyChangeNotification(callback) {
        result := ComCall(9, this, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
