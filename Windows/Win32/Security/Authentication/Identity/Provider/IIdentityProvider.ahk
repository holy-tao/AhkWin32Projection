#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an identity provider.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IIdentityProvider extends IUnknown{
    /**
     * The interface identifier for IIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{0d1b9e0c-e8ba-4f55-a81b-bce934b948f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @param {Pointer<IEnumUnknown>} ppIdentityEnum 
     * @returns {HRESULT} 
     */
    GetIdentityEnum(eIdentityType, pFilterkey, pFilterPropVarValue, ppIdentityEnum) {
        result := ComCall(3, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr", ppIdentityEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUserName 
     * @param {Pointer<IPropertyStore>} ppPropertyStore 
     * @param {Pointer<PROPVARIANT>} pKeywordsToAdd 
     * @returns {HRESULT} 
     */
    Create(lpszUserName, ppPropertyStore, pKeywordsToAdd) {
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName

        result := ComCall(4, this, "ptr", lpszUserName, "ptr", ppPropertyStore, "ptr", pKeywordsToAdd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} pPropertyStore 
     * @returns {HRESULT} 
     */
    Import(pPropertyStore) {
        result := ComCall(5, this, "ptr", pPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<PROPVARIANT>} pKeywordsToDelete 
     * @returns {HRESULT} 
     */
    Delete(lpszUniqueID, pKeywordsToDelete) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", pKeywordsToDelete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<IPropertyStore>} ppPropertyStore 
     * @returns {HRESULT} 
     */
    FindByUniqueID(lpszUniqueID, ppPropertyStore) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", lpszUniqueID, "ptr", ppPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppPropertyStore 
     * @returns {HRESULT} 
     */
    GetProviderPropertyStore(ppPropertyStore) {
        result := ComCall(8, this, "ptr", ppPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IIdentityAdvise>} pIdentityAdvise 
     * @param {Integer} dwIdentityUpdateEvents 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(pIdentityAdvise, dwIdentityUpdateEvents, pdwCookie) {
        result := ComCall(9, this, "ptr", pIdentityAdvise, "uint", dwIdentityUpdateEvents, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnAdvise(dwCookie) {
        result := ComCall(10, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
