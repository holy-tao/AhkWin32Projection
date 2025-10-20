#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISubscriptionMgr.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISubscriptionMgr2 extends ISubscriptionMgr{
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
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<ISubscriptionItem>} ppSubscriptionItem 
     * @returns {HRESULT} 
     */
    GetItemFromURL(pwszURL, ppSubscriptionItem) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(11, this, "ptr", pwszURL, "ptr", ppSubscriptionItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pSubscriptionCookie 
     * @param {Pointer<ISubscriptionItem>} ppSubscriptionItem 
     * @returns {HRESULT} 
     */
    GetItemFromCookie(pSubscriptionCookie, ppSubscriptionItem) {
        result := ComCall(12, this, "ptr", pSubscriptionCookie, "ptr", ppSubscriptionItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @param {Pointer<UInt32>} pdwRunState 
     * @returns {HRESULT} 
     */
    GetSubscriptionRunState(dwNumCookies, pCookies, pdwRunState) {
        result := ComCall(13, this, "uint", dwNumCookies, "ptr", pCookies, "uint*", pdwRunState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IEnumSubscription>} ppEnumSubscriptions 
     * @returns {HRESULT} 
     */
    EnumSubscriptions(dwFlags, ppEnumSubscriptions) {
        result := ComCall(14, this, "uint", dwFlags, "ptr", ppEnumSubscriptions, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(15, this, "uint", dwFlags, "uint", dwNumCookies, "ptr", pCookies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @returns {HRESULT} 
     */
    AbortItems(dwNumCookies, pCookies) {
        result := ComCall(16, this, "uint", dwNumCookies, "ptr", pCookies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbortAll() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
