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
     * Gets the number of identity providers registered on the system.
     * @returns {Integer} The number of identity providers registered on the system.
     * @see https://docs.microsoft.com/windows/win32/api//identitystore/nf-identitystore-iidentitystore-getcount
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
     * @see https://docs.microsoft.com/windows/win32/api//identitystore/nf-identitystore-iidentitystore-getat
     */
    GetAt(dwProvider, pProvGuid) {
        result := ComCall(4, this, "uint", dwProvider, "ptr", pProvGuid, "ptr*", &ppIdentityProvider := 0, "HRESULT")
        return IUnknown(ppIdentityProvider)
    }

    /**
     * Caches the specified identity in the registry.
     * @param {PWSTR} lpszUniqueID The identity to cache.
     * @param {Pointer<Guid>} ProviderGUID The identity provider associated with the identity.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identitystore/nf-identitystore-iidentitystore-addtocache
     */
    AddToCache(lpszUniqueID, ProviderGUID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "HRESULT")
        return result
    }

    /**
     * Retrieves the security identifier (SID) associated with the specified identity and identity provider.
     * @param {PWSTR} lpszUniqueID The identity for which to retrieve the SID.
     * @param {Pointer<Guid>} ProviderGUID The GUID of the identity provider.
     * @param {Integer} cbSid The size, in bytes, of the buffer pointed to by the <i>pSid</i> parameter.
     * @param {Pointer<Integer>} pSid A pointer to the SID this method retrieves.
     * @returns {Integer} The required length, in bytes,  of the <i>pSid</i> buffer.
     * @see https://docs.microsoft.com/windows/win32/api//identitystore/nf-identitystore-iidentitystore-converttosid
     */
    ConvertToSid(lpszUniqueID, ProviderGUID, cbSid, pSid) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        pSidMarshal := pSid is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", lpszUniqueID, "ptr", ProviderGUID, "ushort", cbSid, pSidMarshal, pSid, "ushort*", &pcbRequiredSid := 0, "HRESULT")
        return pcbRequiredSid
    }

    /**
     * Gets a pointer to an IEnumUnknown interface pointer that can be used to enumerate identities across identity providers.
     * @param {Integer} eIdentityType A value of the <a href="https://docs.microsoft.com/windows/win32/api/identitycommon/ne-identitycommon-identity_type">IDENTITY_TYPE</a> enumeration that indicates the type of identities to enumerate.
     * @param {Pointer<PROPERTYKEY>} pFilterkey A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies a property. If the value of this parameter is not <b>NULL</b>, only identities that support the property specified by this parameter are enumerated.
     * @param {Pointer<PROPVARIANT>} pFilterPropVarValue A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. If the values of this parameter and the <i>pFilterkey</i> parameters are not <b>NULL</b>, only identities that have the property value specified by this parameter are enumerated.
     * @returns {IEnumUnknown} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a> interface pointer that can be used to enumerate identities.
     * @see https://docs.microsoft.com/windows/win32/api//identitystore/nf-identitystore-iidentitystore-enumerateidentities
     */
    EnumerateIdentities(eIdentityType, pFilterkey, pFilterPropVarValue) {
        result := ComCall(7, this, "int", eIdentityType, "ptr", pFilterkey, "ptr", pFilterPropVarValue, "ptr*", &ppIdentityEnum := 0, "HRESULT")
        return IEnumUnknown(ppIdentityEnum)
    }

    /**
     * Sets the current index of the identity enumeration to zero.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identitystore/nf-identitystore-iidentitystore-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
