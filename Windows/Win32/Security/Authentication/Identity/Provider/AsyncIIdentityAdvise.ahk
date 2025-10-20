#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIIdentityAdvise extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIIdentityAdvise
     * @type {Guid}
     */
    static IID => Guid("{3ab4c8da-d038-4830-8dd9-3253c55a127f}")

    /**
     * The class identifier for AsyncIIdentityAdvise
     * @type {Guid}
     */
    static CLSID => Guid("{3ab4c8da-d038-4830-8dd9-3253c55a127f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_IdentityUpdated", "Finish_IdentityUpdated"]

    /**
     * 
     * @param {Integer} dwIdentityUpdateEvents 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    Begin_IdentityUpdated(dwIdentityUpdateEvents, lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(3, this, "uint", dwIdentityUpdateEvents, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_IdentityUpdated() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
