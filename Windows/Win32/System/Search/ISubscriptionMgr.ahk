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
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    DeleteSubscription(pwszURL, _hwnd) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(3, this, "ptr", pwszURL, "ptr", _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @returns {HRESULT} 
     */
    UpdateSubscription(pwszURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(4, this, "ptr", pwszURL, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateAll() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @returns {BOOL} 
     */
    IsSubscribed(pwszURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(6, this, "ptr", pwszURL, "int*", &pfSubscribed := 0, "HRESULT")
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
        result := ComCall(7, this, "ptr", pwszURL, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {Integer} subType 
     * @returns {SUBSCRIPTIONINFO} 
     */
    GetDefaultInfo(subType) {
        pInfo := SUBSCRIPTIONINFO()
        result := ComCall(8, this, "int", subType, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    ShowSubscriptionProperties(pwszURL, _hwnd) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(9, this, "ptr", pwszURL, "ptr", _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {PWSTR} pwszURL 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Integer} dwFlags 
     * @param {Integer} subsType 
     * @param {Pointer<SUBSCRIPTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    CreateSubscription(_hwnd, pwszURL, pwszFriendlyName, dwFlags, subsType, pInfo) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(10, this, "ptr", _hwnd, "ptr", pwszURL, "ptr", pwszFriendlyName, "uint", dwFlags, "int", subsType, "ptr", pInfo, "HRESULT")
        return result
    }
}
