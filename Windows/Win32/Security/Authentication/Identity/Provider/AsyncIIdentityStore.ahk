#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\..\System\Com\IEnumUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIIdentityStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIIdentityStore
     * @type {Guid}
     */
    static IID => Guid("{eefa1616-48de-4872-aa64-6e6206535a51}")

    /**
     * The class identifier for AsyncIIdentityStore
     * @type {Guid}
     */
    static CLSID => Guid("{eefa1616-48de-4872-aa64-6e6206535a51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_GetCount", "Finish_GetCount", "Begin_GetAt", "Finish_GetAt", "Begin_AddToCache", "Finish_AddToCache", "Begin_ConvertToSid", "Finish_ConvertToSid", "Begin_EnumerateIdentities", "Finish_EnumerateIdentities", "Begin_Reset", "Finish_Reset"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_GetCount() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    Finish_GetCount() {
        result := ComCall(4, this, "uint*", &pdwProviders := 0, "HRESULT")
        return pdwProviders
    }

    /**
     * 
     * @param {Integer} dwProvider 
     * @param {Pointer<Guid>} pProvGuid 
     * @returns {HRESULT} 
     */
    Begin_GetAt(dwProvider, pProvGuid) {
        result := ComCall(5, this, "uint", dwProvider, "ptr", pProvGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pProvGuid 
     * @returns {IUnknown} 
     */
    Finish_GetAt(pProvGuid) {
        result := ComCall(6, this, "ptr", pProvGuid, "ptr*", &ppIdentityProvider := 0, "HRESULT")
        return IUnknown(ppIdentityProvider)
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    Begin_AddToCache(lpszUniqueID, ProviderGUID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_AddToCache() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @param {Integer} cbSid 
     * @param {Pointer<Integer>} pSid 
     * @returns {HRESULT} 
     */
    Begin_ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, pSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        pSidMarshal := pSid is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "ushort", cbSid, pSidMarshal, pSid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pSid 
     * @returns {Integer} 
     */
    Finish_ConvertToSid(pSid) {
        pSidMarshal := pSid is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pSidMarshal, pSid, "ushort*", &pcbRequiredSid := 0, "HRESULT")
        return pcbRequiredSid
    }

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @returns {HRESULT} 
     */
    Begin_EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(11, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    Finish_EnumerateIdentities() {
        result := ComCall(12, this, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Begin_Reset() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_Reset() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
