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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Authorize", "Unauthorize", "GetAuthorizationState", "GetMatchingVolume", "GetUniqueIdentity", "GetSilos"]

    /**
     * 
     * @param {Integer} hwndParent 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-authorize
     */
    Authorize(hwndParent, dwFlags) {
        result := ComCall(3, this, "uint", hwndParent, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-unauthorize
     */
    Unauthorize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ACT_AUTHORIZATION_STATE>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getauthorizationstate
     */
    GetAuthorizationState(pState) {
        result := ComCall(5, this, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getmatchingvolume
     */
    GetMatchingVolume(ppwszVolume) {
        result := ComCall(6, this, "ptr", ppwszVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszIdentity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getuniqueidentity
     */
    GetUniqueIdentity(ppwszIdentity) {
        result := ComCall(7, this, "ptr", ppwszIdentity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<IEnhancedStorageSilo>>} pppIEnhancedStorageSilos 
     * @param {Pointer<Integer>} pcEnhancedStorageSilos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstorageact-getsilos
     */
    GetSilos(pppIEnhancedStorageSilos, pcEnhancedStorageSilos) {
        pppIEnhancedStorageSilosMarshal := pppIEnhancedStorageSilos is VarRef ? "ptr*" : "ptr"
        pcEnhancedStorageSilosMarshal := pcEnhancedStorageSilos is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pppIEnhancedStorageSilosMarshal, pppIEnhancedStorageSilos, pcEnhancedStorageSilosMarshal, pcEnhancedStorageSilos, "HRESULT")
        return result
    }
}
