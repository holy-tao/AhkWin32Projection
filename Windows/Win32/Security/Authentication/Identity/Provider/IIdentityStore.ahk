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
     * 
     * @param {Pointer<UInt32>} pdwProviders 
     * @returns {HRESULT} 
     */
    GetCount(pdwProviders) {
        result := ComCall(3, this, "uint*", pdwProviders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProvider 
     * @param {Pointer<Guid>} pProvGuid 
     * @param {Pointer<IUnknown>} ppIdentityProvider 
     * @returns {HRESULT} 
     */
    GetAt(dwProvider, pProvGuid, ppIdentityProvider) {
        result := ComCall(4, this, "uint", dwProvider, "ptr", pProvGuid, "ptr", ppIdentityProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    AddToCache(lpszUniqueID, ProviderGUID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<Guid>} ProviderGUID 
     * @param {Integer} cbSid 
     * @param {Pointer<Byte>} pSid 
     * @param {Pointer<UInt16>} pcbRequiredSid 
     * @returns {HRESULT} 
     */
    ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, pSid, pcbRequiredSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "ushort", cbSid, "char*", pSid, "ushort*", pcbRequiredSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @param {Pointer<IEnumUnknown>} ppIdentityEnum 
     * @returns {HRESULT} 
     */
    EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue, ppIdentityEnum) {
        result := ComCall(7, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr", ppIdentityEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
