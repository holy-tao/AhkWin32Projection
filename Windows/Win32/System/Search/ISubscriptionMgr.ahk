#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISubscriptionMgr extends IUnknown{
    /**
     * The interface identifier for ISubscriptionMgr
     * @type {Guid}
     */
    static IID => Guid("{085fb2c0-0df8-11d1-8f4b-00a0c905413f}")

    /**
     * The class identifier for SubscriptionMgr
     * @type {Guid}
     */
    static CLSID => Guid("{abbe31d0-6dae-11d0-beca-00c04fd940be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    DeleteSubscription(pwszURL, hwnd) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", pwszURL, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @returns {HRESULT} 
     */
    UpdateSubscription(pwszURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(4, this, "ptr", pwszURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateAll() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<BOOL>} pfSubscribed 
     * @returns {HRESULT} 
     */
    IsSubscribed(pwszURL, pfSubscribed) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(6, this, "ptr", pwszURL, "ptr", pfSubscribed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<SUBSCRIPTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetSubscriptionInfo(pwszURL, pInfo) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(7, this, "ptr", pwszURL, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} subType 
     * @param {Pointer<SUBSCRIPTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetDefaultInfo(subType, pInfo) {
        result := ComCall(8, this, "int", subType, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    ShowSubscriptionProperties(pwszURL, hwnd) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", pwszURL, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} pwszURL 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Integer} dwFlags 
     * @param {Integer} subsType 
     * @param {Pointer<SUBSCRIPTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    CreateSubscription(hwnd, pwszURL, pwszFriendlyName, dwFlags, subsType, pInfo) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(10, this, "ptr", hwnd, "ptr", pwszURL, "ptr", pwszFriendlyName, "uint", dwFlags, "int", subsType, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
