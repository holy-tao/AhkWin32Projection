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
     * 
     * @param {Integer} dwIdentityUpdateEvents 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    IdentityUpdated(dwIdentityUpdateEvents, lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(3, this, "uint", dwIdentityUpdateEvents, "ptr", lpszUniqueID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
