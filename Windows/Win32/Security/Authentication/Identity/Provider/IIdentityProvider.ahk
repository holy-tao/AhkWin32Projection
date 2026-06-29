#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDENTITY_TYPE.ahk" { IDENTITY_TYPE }
#Import "..\..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IIdentityAdvise.ahk" { IIdentityAdvise }

/**
 * Represents an identity provider.
 * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nn-identityprovider-iidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IIdentityProvider extends IUnknown {
    /**
     * The interface identifier for IIdentityProvider
     * @type {Guid}
     */
    static IID := Guid("{0d1b9e0c-e8ba-4f55-a81b-bce934b948f5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdentityProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentityEnum          : IntPtr
        Create                   : IntPtr
        Import                   : IntPtr
        Delete                   : IntPtr
        FindByUniqueID           : IntPtr
        GetProviderPropertyStore : IntPtr
        Advise                   : IntPtr
        UnAdvise                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdentityProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IEnumUnknown interface pointer that can be used to enumerate identities.
     * @param {IDENTITY_TYPE} eIdentityType A value of the <a href="https://docs.microsoft.com/windows/win32/api/identitycommon/ne-identitycommon-identity_type">IDENTITY_TYPE</a> enumeration that indicates the type of identities to enumerate.
     * @param {Pointer<PROPERTYKEY>} pFilterkey A pointer to a property key that specifies a property. If the value of this parameter is not <b>NULL</b>, only identities that support the property specified by this parameter are enumerated.
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue A pointer to a property value. If the values of this parameter and the <i>pFilterkey</i> parameter are not <b>NULL</b>, only identities that have the property value specified by this parameter are enumerated.
     * @returns {IEnumUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> interface pointer that can be used to enumerate identities.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-getidentityenum
     */
    GetIdentityEnum(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(3, this, IDENTITY_TYPE, eIdentityType, PROPERTYKEY.Ptr, pFilterkey, PROPVARIANT.Ptr, pFilterPropVarValue, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * Creates a new identity associated with the specified user name.
     * @param {PWSTR} lpszUserName The user name with which to associate the new identity.
     * @param {Pointer<PROPVARIANT>} pKeywordsToAdd The properties to associate with the new identity.
     * @returns {IPropertyStore} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface that represents the property store associated with the new identity.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-create
     */
    Create(lpszUserName, pKeywordsToAdd) {
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName

        result := ComCall(4, this, "ptr", lpszUserName, "ptr*", &ppPropertyStore := 0, PROPVARIANT.Ptr, pKeywordsToAdd, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Imports an identity to the system.
     * @param {IPropertyStore} pPropertyStore A pointer to the <b>IPropertyStore</b> interface that specifies all information required to create the new identity on the system.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-import
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
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-delete
     */
    Delete(lpszUniqueID, pKeywordsToDelete) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(6, this, "ptr", lpszUniqueID, PROPVARIANT.Ptr, pKeywordsToDelete, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the IPropertyStore interface instance associated with the specified identity.
     * @param {PWSTR} lpszUniqueID The unique identity to find.
     * @returns {IPropertyStore} A pointer to the instance of the <b>IPropertyStore</b> interface associated with the specified identity.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-findbyuniqueid
     */
    FindByUniqueID(lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", lpszUniqueID, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Retrieves a pointer to the IPropertyStore interface associated with the identity provider.
     * @returns {IPropertyStore} A pointer to the global <b>IPropertyStore</b> interface associated with this identity provider.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-getproviderpropertystore
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
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-advise
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
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityprovider-unadvise
     */
    UnAdvise(dwCookie) {
        result := ComCall(10, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIdentityProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentityEnum := CallbackCreate(GetMethod(implObj, "GetIdentityEnum"), flags, 5)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 4)
        this.vtbl.Import := CallbackCreate(GetMethod(implObj, "Import"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 3)
        this.vtbl.FindByUniqueID := CallbackCreate(GetMethod(implObj, "FindByUniqueID"), flags, 3)
        this.vtbl.GetProviderPropertyStore := CallbackCreate(GetMethod(implObj, "GetProviderPropertyStore"), flags, 2)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 4)
        this.vtbl.UnAdvise := CallbackCreate(GetMethod(implObj, "UnAdvise"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentityEnum)
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Import)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.FindByUniqueID)
        CallbackFree(this.vtbl.GetProviderPropertyStore)
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.UnAdvise)
    }
}
