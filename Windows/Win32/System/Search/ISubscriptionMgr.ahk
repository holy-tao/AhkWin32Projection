#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SUBSCRIPTIONINFO.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISubscriptionMgr extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteSubscription", "UpdateSubscription", "UpdateAll", "IsSubscribed", "GetSubscriptionInfo", "GetDefaultInfo", "ShowSubscriptionProperties", "CreateSubscription"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {HWND} hwnd_ 
     * @returns {HRESULT} 
     */
    DeleteSubscription(pwszURL, hwnd_) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(3, this, "ptr", pwszURL, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateAll() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @returns {BOOL} 
     */
    IsSubscribed(pwszURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(6, this, "ptr", pwszURL, "int*", &pfSubscribed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfSubscribed
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @returns {SUBSCRIPTIONINFO} 
     */
    GetSubscriptionInfo(pwszURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pInfo := SUBSCRIPTIONINFO()
        result := ComCall(7, this, "ptr", pwszURL, "ptr", pInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInfo
    }

    /**
     * 
     * @param {Integer} subType 
     * @returns {SUBSCRIPTIONINFO} 
     */
    GetDefaultInfo(subType) {
        pInfo := SUBSCRIPTIONINFO()
        result := ComCall(8, this, "int", subType, "ptr", pInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInfo
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {HWND} hwnd_ 
     * @returns {HRESULT} 
     */
    ShowSubscriptionProperties(pwszURL, hwnd_) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(9, this, "ptr", pwszURL, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hwnd_ 
     * @param {PWSTR} pwszURL 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Integer} dwFlags 
     * @param {Integer} subsType 
     * @param {Pointer<SUBSCRIPTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    CreateSubscription(hwnd_, pwszURL, pwszFriendlyName, dwFlags, subsType, pInfo) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(10, this, "ptr", hwnd_, "ptr", pwszURL, "ptr", pwszFriendlyName, "uint", dwFlags, "int", subsType, "ptr", pInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
