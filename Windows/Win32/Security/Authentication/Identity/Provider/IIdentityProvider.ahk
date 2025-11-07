#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IEnumUnknown.ahk
#Include ..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an identity provider.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentityEnum", "Create", "Import", "Delete", "FindByUniqueID", "GetProviderPropertyStore", "Advise", "UnAdvise"]

    /**
     * 
     * @param {Integer} eIdentityType 
     * @param {Pointer<PROPERTYKEY>} pFilterkey 
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue 
     * @returns {IEnumUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-getidentityenum
     */
    GetIdentityEnum(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(3, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * 
     * @param {PWSTR} lpszUserName 
     * @param {Pointer<PROPVARIANT>} pKeywordsToAdd 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-create
     */
    Create(lpszUserName, pKeywordsToAdd) {
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName

        result := ComCall(4, this, "ptr", lpszUserName, "ptr*", &ppPropertyStore := 0, "ptr", pKeywordsToAdd, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @param {IPropertyStore} pPropertyStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-import
     */
    Import(pPropertyStore) {
        result := ComCall(5, this, "ptr", pPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @param {Pointer<PROPVARIANT>} pKeywordsToDelete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-delete
     */
    Delete(lpszUniqueID, pKeywordsToDelete) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", pKeywordsToDelete, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszUniqueID 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-findbyuniqueid
     */
    FindByUniqueID(lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", lpszUniqueID, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-getproviderpropertystore
     */
    GetProviderPropertyStore() {
        result := ComCall(8, this, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @param {IIdentityAdvise} pIdentityAdvise 
     * @param {Integer} dwIdentityUpdateEvents 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-advise
     */
    Advise(pIdentityAdvise, dwIdentityUpdateEvents) {
        result := ComCall(9, this, "ptr", pIdentityAdvise, "uint", dwIdentityUpdateEvents, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-unadvise
     */
    UnAdvise(dwCookie) {
        result := ComCall(10, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
