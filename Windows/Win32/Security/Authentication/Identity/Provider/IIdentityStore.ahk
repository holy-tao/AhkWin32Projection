#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

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
     * @param {Pointer<Integer>} pdwProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-getcount
     */
    GetCount(pdwProviders) {
        result := ComCall(3, this, "uint*", pdwProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProvider 
     * @param {Pointer<Guid>} pProvGuid 
     * @param {Pointer<IUnknown>} ppIdentityProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-getat
     */
    GetAt(dwProvider, pProvGuid, ppIdentityProvider) {
        result := ComCall(4, this, "uint", dwProvider, "ptr", pProvGuid, "ptr*", ppIdentityProvider, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pcbRequiredSid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-converttosid
     */
    ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, pSid, pcbRequiredSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "ushort", cbSid, "char*", pSid, "ushort*", pcbRequiredSid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @param {Pointer<IEnumUnknown>} ppIdentityEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-enumerateidentities
     */
    EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue, ppIdentityEnum) {
        result := ComCall(7, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr*", ppIdentityEnum, "HRESULT")
        return result
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
