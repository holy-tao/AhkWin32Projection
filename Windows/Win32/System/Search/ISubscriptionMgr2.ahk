#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISubscriptionItem.ahk
#Include .\IEnumSubscription.ahk
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
     * @returns {ISubscriptionItem} 
     */
    GetItemFromURL(pwszURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(11, this, "ptr", pwszURL, "ptr*", &ppSubscriptionItem := 0, "HRESULT")
        return ISubscriptionItem(ppSubscriptionItem)
    }

    /**
     * 
     * @param {Pointer<Guid>} pSubscriptionCookie 
     * @returns {ISubscriptionItem} 
     */
    GetItemFromCookie(pSubscriptionCookie) {
        result := ComCall(12, this, "ptr", pSubscriptionCookie, "ptr*", &ppSubscriptionItem := 0, "HRESULT")
        return ISubscriptionItem(ppSubscriptionItem)
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @returns {Integer} 
     */
    GetSubscriptionRunState(dwNumCookies, pCookies) {
        result := ComCall(13, this, "uint", dwNumCookies, "ptr", pCookies, "uint*", &pdwRunState := 0, "HRESULT")
        return pdwRunState
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IEnumSubscription} 
     */
    EnumSubscriptions(dwFlags) {
        result := ComCall(14, this, "uint", dwFlags, "ptr*", &ppEnumSubscriptions := 0, "HRESULT")
        return IEnumSubscription(ppEnumSubscriptions)
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
