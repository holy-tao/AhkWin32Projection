#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnhancedStorageACT.ahk

/**
 * IEnhancedStorageACT2 interface is used to obtain information for a 1667 Addressable Contact Target (ACT).
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstorageact2
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageACT2 extends IEnhancedStorageACT{
    /**
     * The interface identifier for IEnhancedStorageACT2
     * @type {Guid}
     */
    static IID => Guid("{4da57d2e-8eb3-41f6-a07e-98b52b88242b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszDeviceName 
     * @returns {HRESULT} 
     */
    GetDeviceName(ppwszDeviceName) {
        result := ComCall(9, this, "ptr", ppwszDeviceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsDeviceRemovable 
     * @returns {HRESULT} 
     */
    IsDeviceRemovable(pIsDeviceRemovable) {
        result := ComCall(10, this, "ptr", pIsDeviceRemovable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
