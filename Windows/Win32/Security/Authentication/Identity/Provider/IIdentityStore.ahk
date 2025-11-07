#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\..\System\Com\IEnumUnknown.ahk

/**
 * Provides methods to enumerate and manage identities and identity providers.
 * @see https://docs.microsoft.com/windows/win32/api//identitystore/nn-identitystore-iidentitystore
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IIdentityStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIdentityStore
     * @type {Guid}
     */
    static IID => Guid("{df586fa5-6f35-44f1-b209-b38e169772eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "AddToCache", "ConvertToSid", "EnumerateIdentities", "Reset"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwProviders := 0, "HRESULT")
        return pdwProviders
    }

    /**
     * 
     * @param {Integer} dwProvider 
     * @param {Pointer<Guid>} pProvGuid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-getat
     */
    GetAt(dwProvider, pProvGuid) {
        result := ComCall(4, this, "uint", dwProvider, "ptr", pProvGuid, "ptr*", &ppIdentityProvider := 0, "HRESULT")
        return IUnknown(ppIdentityProvider)
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-addtocache
     */
    AddToCache(lpszUniqueID, ProviderGUID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @param {Integer} cbSid 
     * @param {Pointer<Integer>} pSid 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-converttosid
     */
    ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, pSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        pSidMarshal := pSid is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "ushort", cbSid, pSidMarshal, pSid, "ushort*", &pcbRequiredSid := 0, "HRESULT")
        return pcbRequiredSid
    }

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @returns {IEnumUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-enumerateidentities
     */
    EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(7, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
