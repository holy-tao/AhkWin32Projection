#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISubscriptionMgr.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISubscriptionMgr2 extends ISubscriptionMgr{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISubscriptionMgr2
     * @type {Guid}
     */
    static IID => Guid("{614bc270-aedf-11d1-a1f9-00c04fc2fbe1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemFromURL", "GetItemFromCookie", "GetSubscriptionRunState", "EnumSubscriptions", "UpdateItems", "AbortItems", "AbortAll"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<ISubscriptionItem>} ppSubscriptionItem 
     * @returns {HRESULT} 
     */
    GetItemFromURL(pwszURL, ppSubscriptionItem) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(11, this, "ptr", pwszURL, "ptr*", ppSubscriptionItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSubscriptionCookie 
     * @param {Pointer<ISubscriptionItem>} ppSubscriptionItem 
     * @returns {HRESULT} 
     */
    GetItemFromCookie(pSubscriptionCookie, ppSubscriptionItem) {
        result := ComCall(12, this, "ptr", pSubscriptionCookie, "ptr*", ppSubscriptionItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @param {Pointer<Integer>} pdwRunState 
     * @returns {HRESULT} 
     */
    GetSubscriptionRunState(dwNumCookies, pCookies, pdwRunState) {
        pdwRunStateMarshal := pdwRunState is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwNumCookies, "ptr", pCookies, pdwRunStateMarshal, pdwRunState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IEnumSubscription>} ppEnumSubscriptions 
     * @returns {HRESULT} 
     */
    EnumSubscriptions(dwFlags, ppEnumSubscriptions) {
        result := ComCall(14, this, "uint", dwFlags, "ptr*", ppEnumSubscriptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @returns {HRESULT} 
     */
    UpdateItems(dwFlags, dwNumCookies, pCookies) {
        result := ComCall(15, this, "uint", dwFlags, "uint", dwNumCookies, "ptr", pCookies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @returns {HRESULT} 
     */
    AbortItems(dwNumCookies, pCookies) {
        result := ComCall(16, this, "uint", dwNumCookies, "ptr", pCookies, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbortAll() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
