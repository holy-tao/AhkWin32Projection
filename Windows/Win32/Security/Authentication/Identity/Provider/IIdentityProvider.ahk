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
     * Retrieves an IEnumUnknown interface pointer that can be used to enumerate identities.
     * @param {Integer} eIdentityType A value of the <a href="https://docs.microsoft.com/windows/win32/api/identitycommon/ne-identitycommon-identity_type">IDENTITY_TYPE</a> enumeration that indicates the type of identities to enumerate.
     * @param {Pointer<PROPERTYKEY>} pFilterkey A pointer to a property key that specifies a property. If the value of this parameter is not <b>NULL</b>, only identities that support the property specified by this parameter are enumerated.
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue A pointer to a property value. If the values of this parameter and the <i>pFilterkey</i> parameter are not <b>NULL</b>, only identities that have the property value specified by this parameter are enumerated.
     * @returns {IEnumUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> interface pointer that can be used to enumerate identities.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-getidentityenum
     */
    GetIdentityEnum(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(3, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * Creates a new identity associated with the specified user name.
     * @param {PWSTR} lpszUserName The user name with which to associate the new identity.
     * @param {Pointer<PROPVARIANT>} pKeywordsToAdd The properties to associate with the new identity.
     * @returns {IPropertyStore} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface that represents the property store associated with the new identity.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-create
     */
    Create(lpszUserName, pKeywordsToAdd) {
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName

        result := ComCall(4, this, "ptr", lpszUserName, "ptr*", &ppPropertyStore := 0, "ptr", pKeywordsToAdd, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Imports an identity to the system.
     * @param {IPropertyStore} pPropertyStore A pointer to the <b>IPropertyStore</b> interface that specifies all information required to create the new identity on the system.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-import
     */
    Import(pPropertyStore) {
        result := ComCall(5, this, "ptr", pPropertyStore, "HRESULT")
        return result
    }

    /**
     * Removes the specified identity from the identity store or the specified properties from the identity.
     * @param {PWSTR} lpszUniqueID The unique name associated with the identity.
     * @param {Pointer<PROPVARIANT>} pKeywordsToDelete The names of properties to delete. If the value of this parameter is <b>NULL</b>, the identity is deleted.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-delete
     */
    Delete(lpszUniqueID, pKeywordsToDelete) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", pKeywordsToDelete, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the IPropertyStore interface instance associated with the specified identity.
     * @param {PWSTR} lpszUniqueID The unique identity to find.
     * @returns {IPropertyStore} A pointer to the instance of the <b>IPropertyStore</b> interface associated with the specified identity.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-findbyuniqueid
     */
    FindByUniqueID(lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", lpszUniqueID, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Retrieves a pointer to the IPropertyStore interface associated with the identity provider.
     * @returns {IPropertyStore} A pointer to the global <b>IPropertyStore</b> interface associated with this identity provider.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-getproviderpropertystore
     */
    GetProviderPropertyStore() {
        result := ComCall(8, this, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Allows a calling application to specify the list of identity events for which the application is to be notified.
     * @param {IIdentityAdvise} pIdentityAdvise A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/identityprovider/nn-identityprovider-iidentityadvise">IIdentityAdvise</a> interface implemented by the calling application. This interface provides a method that the identity provider can call when one of the events specified by the <i>dwIdentityUpdateEvents</i> parameter occurs.
     * @param {Integer} dwIdentityUpdateEvents 
     * @returns {Integer} A pointer to a value that identifies this connection. When you have finished using this connection, delete it by passing this value to the <a href="https://docs.microsoft.com/windows/desktop/api/identityprovider/nf-identityprovider-iidentityprovider-unadvise">UnAdvise</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-advise
     */
    Advise(pIdentityAdvise, dwIdentityUpdateEvents) {
        result := ComCall(9, this, "ptr", pIdentityAdvise, "uint", dwIdentityUpdateEvents, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Deletes a connection created by calling the Advise method.
     * @param {Integer} dwCookie A value that identifies the connection to delete.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityprovider-unadvise
     */
    UnAdvise(dwCookie) {
        result := ComCall(10, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
