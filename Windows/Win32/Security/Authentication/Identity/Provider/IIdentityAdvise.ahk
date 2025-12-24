#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Allows an identity provider to notify a calling application when an identity is updated.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iidentityadvise
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IIdentityAdvise extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIdentityAdvise
     * @type {Guid}
     */
    static IID => Guid("{4e982fed-d14b-440c-b8d6-bb386453d386}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IdentityUpdated"]

    /**
     * Is called by an identity provider to notify a calling application that an identity event occurred.
     * @param {Integer} dwIdentityUpdateEvents 
     * @param {PWSTR} lpszUniqueID The identity associated with the events that occurred.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iidentityadvise-identityupdated
     */
    IdentityUpdated(dwIdentityUpdateEvents, lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(3, this, "uint", dwIdentityUpdateEvents, "ptr", lpszUniqueID, "HRESULT")
        return result
    }
}
