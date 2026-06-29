#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDENTITY_TYPE.ahk" { IDENTITY_TYPE }
#Import "..\..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods to enumerate and manage identities and identity providers.
 * @see https://learn.microsoft.com/windows/win32/api/identitystore/nn-identitystore-iidentitystore
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IIdentityStore extends IUnknown {
    /**
     * The interface identifier for IIdentityStore
     * @type {Guid}
     */
    static IID := Guid("{df586fa5-6f35-44f1-b209-b38e169772eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdentityStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount            : IntPtr
        GetAt               : IntPtr
        AddToCache          : IntPtr
        ConvertToSid        : IntPtr
        EnumerateIdentities : IntPtr
        Reset               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdentityStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of identity providers registered on the system.
     * @returns {Integer} The number of identity providers registered on the system.
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pdwProviders := 0, "HRESULT")
        return pdwProviders
    }

    /**
     * Retrieves an IIdentityProvider interface pointer for the specified identity provider.
     * @param {Integer} dwProvider The index of the identity provider to retrieve.
     * @param {Pointer<Guid>} pProvGuid On output, this parameter receives a pointer to the GUID of the identity provider that this function retrieves.
     * @returns {IUnknown} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/identityprovider/nn-identityprovider-iidentityprovider">IIdentityProvider</a> interface pointer that this method retrieves.
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-getat
     */
    GetAt(dwProvider, pProvGuid) {
        result := ComCall(4, this, "uint", dwProvider, Guid.Ptr, pProvGuid, "ptr*", &ppIdentityProvider := 0, "HRESULT")
        return IUnknown(ppIdentityProvider)
    }

    /**
     * Caches the specified identity in the registry.
     * @param {PWSTR} lpszUniqueID The identity to cache.
     * @param {Pointer<Guid>} ProviderGUID The identity provider associated with the identity.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-addtocache
     */
    AddToCache(lpszUniqueID, ProviderGUID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", lpszUniqueID, Guid.Ptr, ProviderGUID, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifier (SID) associated with the specified identity and identity provider.
     * @param {PWSTR} lpszUniqueID The identity for which to retrieve the SID.
     * @param {Pointer<Guid>} ProviderGUID The GUID of the identity provider.
     * @param {Integer} cbSid The size, in bytes, of the buffer pointed to by the <i>pSid</i> parameter.
     * @param {Pointer<Integer>} _pSid A pointer to the SID this method retrieves.
     * @returns {Integer} The required length, in bytes,  of the <i>pSid</i> buffer.
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-converttosid
     */
    ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, _pSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        _pSidMarshal := _pSid is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", lpszUniqueID, Guid.Ptr, ProviderGUID, "ushort", cbSid, _pSidMarshal, _pSid, "ushort*", &pcbRequiredSid := 0, "HRESULT")
        return pcbRequiredSid
    }

    /**
     * Gets a pointer to an IEnumUnknown interface pointer that can be used to enumerate identities across identity providers.
     * @param {IDENTITY_TYPE} eIdentityType A value of the <a href="https://docs.microsoft.com/windows/win32/api/identitycommon/ne-identitycommon-identity_type">IDENTITY_TYPE</a> enumeration that indicates the type of identities to enumerate.
     * @param {Pointer<PROPERTYKEY>} pFilterkey A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies a property. If the value of this parameter is not <b>NULL</b>, only identities that support the property specified by this parameter are enumerated.
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. If the values of this parameter and the <i>pFilterkey</i> parameters are not <b>NULL</b>, only identities that have the property value specified by this parameter are enumerated.
     * @returns {IEnumUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> interface pointer that can be used to enumerate identities.
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-enumerateidentities
     */
    EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(7, this, IDENTITY_TYPE, eIdentityType, PROPERTYKEY.Ptr, pFilterkey, PROPVARIANT.Ptr, pFilterPropVarValue, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * Sets the current index of the identity enumeration to zero.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identitystore/nf-identitystore-iidentitystore-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIdentityStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 4)
        this.vtbl.AddToCache := CallbackCreate(GetMethod(implObj, "AddToCache"), flags, 3)
        this.vtbl.ConvertToSid := CallbackCreate(GetMethod(implObj, "ConvertToSid"), flags, 6)
        this.vtbl.EnumerateIdentities := CallbackCreate(GetMethod(implObj, "EnumerateIdentities"), flags, 5)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.AddToCache)
        CallbackFree(this.vtbl.ConvertToSid)
        CallbackFree(this.vtbl.EnumerateIdentities)
        CallbackFree(this.vtbl.Reset)
    }
}
