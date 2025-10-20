#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface to obtain information and perform operations for an 1667 Addressable Contact Target (ACT).
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstorageact
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageACT extends IUnknown{
    /**
     * The interface identifier for IEnhancedStorageACT
     * @type {Guid}
     */
    static IID => Guid("{6e7781f4-e0f2-4239-b976-a01abab52930}")

    /**
     * The class identifier for EnhancedStorageACT
     * @type {Guid}
     */
    static CLSID => Guid("{af076a15-2ece-4ad4-bb21-29f040e176d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Authorize(hwndParent, dwFlags) {
        result := ComCall(3, this, "uint", hwndParent, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unauthorize() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ACT_AUTHORIZATION_STATE>} pState 
     * @returns {HRESULT} 
     */
    GetAuthorizationState(pState) {
        result := ComCall(5, this, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszVolume 
     * @returns {HRESULT} 
     */
    GetMatchingVolume(ppwszVolume) {
        result := ComCall(6, this, "ptr", ppwszVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszIdentity 
     * @returns {HRESULT} 
     */
    GetUniqueIdentity(ppwszIdentity) {
        result := ComCall(7, this, "ptr", ppwszIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnhancedStorageSilo>} pppIEnhancedStorageSilos 
     * @param {Pointer<UInt32>} pcEnhancedStorageSilos 
     * @returns {HRESULT} 
     */
    GetSilos(pppIEnhancedStorageSilos, pcEnhancedStorageSilos) {
        result := ComCall(8, this, "ptr", pppIEnhancedStorageSilos, "uint*", pcEnhancedStorageSilos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
