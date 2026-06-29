#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISubscriptionMgr.ahk" { ISubscriptionMgr }
#Import ".\IEnumSubscription.ahk" { IEnumSubscription }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISubscriptionItem.ahk" { ISubscriptionItem }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISubscriptionMgr2 extends ISubscriptionMgr {
    /**
     * The interface identifier for ISubscriptionMgr2
     * @type {Guid}
     */
    static IID := Guid("{614bc270-aedf-11d1-a1f9-00c04fc2fbe1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISubscriptionMgr2 interfaces
    */
    struct Vtbl extends ISubscriptionMgr.Vtbl {
        GetItemFromURL          : IntPtr
        GetItemFromCookie       : IntPtr
        GetSubscriptionRunState : IntPtr
        EnumSubscriptions       : IntPtr
        UpdateItems             : IntPtr
        AbortItems              : IntPtr
        AbortAll                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISubscriptionMgr2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(12, this, Guid.Ptr, pSubscriptionCookie, "ptr*", &ppSubscriptionItem := 0, "HRESULT")
        return ISubscriptionItem(ppSubscriptionItem)
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @returns {Integer} 
     */
    GetSubscriptionRunState(dwNumCookies, pCookies) {
        result := ComCall(13, this, "uint", dwNumCookies, Guid.Ptr, pCookies, "uint*", &pdwRunState := 0, "HRESULT")
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
        result := ComCall(15, this, "uint", dwFlags, "uint", dwNumCookies, Guid.Ptr, pCookies, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNumCookies 
     * @param {Pointer<Guid>} pCookies 
     * @returns {HRESULT} 
     */
    AbortItems(dwNumCookies, pCookies) {
        result := ComCall(16, this, "uint", dwNumCookies, Guid.Ptr, pCookies, "HRESULT")
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

    Query(iid) {
        if (ISubscriptionMgr2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemFromURL := CallbackCreate(GetMethod(implObj, "GetItemFromURL"), flags, 3)
        this.vtbl.GetItemFromCookie := CallbackCreate(GetMethod(implObj, "GetItemFromCookie"), flags, 3)
        this.vtbl.GetSubscriptionRunState := CallbackCreate(GetMethod(implObj, "GetSubscriptionRunState"), flags, 4)
        this.vtbl.EnumSubscriptions := CallbackCreate(GetMethod(implObj, "EnumSubscriptions"), flags, 3)
        this.vtbl.UpdateItems := CallbackCreate(GetMethod(implObj, "UpdateItems"), flags, 4)
        this.vtbl.AbortItems := CallbackCreate(GetMethod(implObj, "AbortItems"), flags, 3)
        this.vtbl.AbortAll := CallbackCreate(GetMethod(implObj, "AbortAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemFromURL)
        CallbackFree(this.vtbl.GetItemFromCookie)
        CallbackFree(this.vtbl.GetSubscriptionRunState)
        CallbackFree(this.vtbl.EnumSubscriptions)
        CallbackFree(this.vtbl.UpdateItems)
        CallbackFree(this.vtbl.AbortItems)
        CallbackFree(this.vtbl.AbortAll)
    }
}
