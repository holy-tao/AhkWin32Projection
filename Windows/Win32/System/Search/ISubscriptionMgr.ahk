#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\SUBSCRIPTIONINFO.ahk" { SUBSCRIPTIONINFO }
#Import ".\SUBSCRIPTIONTYPE.ahk" { SUBSCRIPTIONTYPE }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISubscriptionMgr extends IUnknown {
    /**
     * The interface identifier for ISubscriptionMgr
     * @type {Guid}
     */
    static IID := Guid("{085fb2c0-0df8-11d1-8f4b-00a0c905413f}")

    /**
     * The class identifier for SubscriptionMgr
     * @type {Guid}
     */
    static CLSID := Guid("{abbe31d0-6dae-11d0-beca-00c04fd940be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISubscriptionMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeleteSubscription         : IntPtr
        UpdateSubscription         : IntPtr
        UpdateAll                  : IntPtr
        IsSubscribed               : IntPtr
        GetSubscriptionInfo        : IntPtr
        GetDefaultInfo             : IntPtr
        ShowSubscriptionProperties : IntPtr
        CreateSubscription         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISubscriptionMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    DeleteSubscription(pwszURL, _hwnd) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, HWND, _hwnd, "HRESULT")
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

        result := ComCall(6, this, "ptr", pwszURL, BOOL.Ptr, &pfSubscribed := 0, "HRESULT")
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
        result := ComCall(7, this, "ptr", pwszURL, SUBSCRIPTIONINFO.Ptr, pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {SUBSCRIPTIONTYPE} subType 
     * @returns {SUBSCRIPTIONINFO} 
     */
    GetDefaultInfo(subType) {
        pInfo := SUBSCRIPTIONINFO()
        result := ComCall(8, this, SUBSCRIPTIONTYPE, subType, SUBSCRIPTIONINFO.Ptr, pInfo, "HRESULT")
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

        result := ComCall(9, this, "ptr", pwszURL, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {PWSTR} pwszURL 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Integer} dwFlags 
     * @param {SUBSCRIPTIONTYPE} subsType 
     * @param {Pointer<SUBSCRIPTIONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    CreateSubscription(_hwnd, pwszURL, pwszFriendlyName, dwFlags, subsType, pInfo) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(10, this, HWND, _hwnd, "ptr", pwszURL, "ptr", pwszFriendlyName, "uint", dwFlags, SUBSCRIPTIONTYPE, subsType, SUBSCRIPTIONINFO.Ptr, pInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISubscriptionMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteSubscription := CallbackCreate(GetMethod(implObj, "DeleteSubscription"), flags, 3)
        this.vtbl.UpdateSubscription := CallbackCreate(GetMethod(implObj, "UpdateSubscription"), flags, 2)
        this.vtbl.UpdateAll := CallbackCreate(GetMethod(implObj, "UpdateAll"), flags, 1)
        this.vtbl.IsSubscribed := CallbackCreate(GetMethod(implObj, "IsSubscribed"), flags, 3)
        this.vtbl.GetSubscriptionInfo := CallbackCreate(GetMethod(implObj, "GetSubscriptionInfo"), flags, 3)
        this.vtbl.GetDefaultInfo := CallbackCreate(GetMethod(implObj, "GetDefaultInfo"), flags, 3)
        this.vtbl.ShowSubscriptionProperties := CallbackCreate(GetMethod(implObj, "ShowSubscriptionProperties"), flags, 3)
        this.vtbl.CreateSubscription := CallbackCreate(GetMethod(implObj, "CreateSubscription"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteSubscription)
        CallbackFree(this.vtbl.UpdateSubscription)
        CallbackFree(this.vtbl.UpdateAll)
        CallbackFree(this.vtbl.IsSubscribed)
        CallbackFree(this.vtbl.GetSubscriptionInfo)
        CallbackFree(this.vtbl.GetDefaultInfo)
        CallbackFree(this.vtbl.ShowSubscriptionProperties)
        CallbackFree(this.vtbl.CreateSubscription)
    }
}
