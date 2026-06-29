#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SUBSCRIPTIONITEMINFO.ahk" { SUBSCRIPTIONITEMINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IEnumItemProperties.ahk" { IEnumItemProperties }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISubscriptionItem extends IUnknown {
    /**
     * The interface identifier for ISubscriptionItem
     * @type {Guid}
     */
    static IID := Guid("{a97559f8-6c4a-11d1-a1e8-00c04fc2fbe1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISubscriptionItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCookie               : IntPtr
        GetSubscriptionItemInfo : IntPtr
        SetSubscriptionItemInfo : IntPtr
        ReadProperties          : IntPtr
        WriteProperties         : IntPtr
        EnumProperties          : IntPtr
        NotifyChanged           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISubscriptionItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetCookie() {
        pCookie := Guid()
        result := ComCall(3, this, Guid.Ptr, pCookie, "HRESULT")
        return pCookie
    }

    /**
     * 
     * @returns {SUBSCRIPTIONITEMINFO} 
     */
    GetSubscriptionItemInfo() {
        pSubscriptionItemInfo := SUBSCRIPTIONITEMINFO()
        result := ComCall(4, this, SUBSCRIPTIONITEMINFO.Ptr, pSubscriptionItemInfo, "HRESULT")
        return pSubscriptionItemInfo
    }

    /**
     * 
     * @param {Pointer<SUBSCRIPTIONITEMINFO>} pSubscriptionItemInfo 
     * @returns {HRESULT} 
     */
    SetSubscriptionItemInfo(pSubscriptionItemInfo) {
        result := ComCall(5, this, SUBSCRIPTIONITEMINFO.Ptr, pSubscriptionItemInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCount 
     * @param {Pointer<PWSTR>} rgwszName 
     * @returns {VARIANT} 
     */
    ReadProperties(nCount, rgwszName) {
        rgwszNameMarshal := rgwszName is VarRef ? "ptr*" : "ptr"

        rgValue := VARIANT()
        result := ComCall(6, this, "uint", nCount, rgwszNameMarshal, rgwszName, VARIANT.Ptr, rgValue, "HRESULT")
        return rgValue
    }

    /**
     * 
     * @param {Integer} nCount 
     * @param {Pointer<PWSTR>} rgwszName 
     * @param {Pointer<VARIANT>} rgValue 
     * @returns {HRESULT} 
     */
    WriteProperties(nCount, rgwszName, rgValue) {
        rgwszNameMarshal := rgwszName is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "uint", nCount, rgwszNameMarshal, rgwszName, VARIANT.Ptr, rgValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumItemProperties} 
     */
    EnumProperties() {
        result := ComCall(8, this, "ptr*", &ppEnumItemProperties := 0, "HRESULT")
        return IEnumItemProperties(ppEnumItemProperties)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISubscriptionItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCookie := CallbackCreate(GetMethod(implObj, "GetCookie"), flags, 2)
        this.vtbl.GetSubscriptionItemInfo := CallbackCreate(GetMethod(implObj, "GetSubscriptionItemInfo"), flags, 2)
        this.vtbl.SetSubscriptionItemInfo := CallbackCreate(GetMethod(implObj, "SetSubscriptionItemInfo"), flags, 2)
        this.vtbl.ReadProperties := CallbackCreate(GetMethod(implObj, "ReadProperties"), flags, 4)
        this.vtbl.WriteProperties := CallbackCreate(GetMethod(implObj, "WriteProperties"), flags, 4)
        this.vtbl.EnumProperties := CallbackCreate(GetMethod(implObj, "EnumProperties"), flags, 2)
        this.vtbl.NotifyChanged := CallbackCreate(GetMethod(implObj, "NotifyChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCookie)
        CallbackFree(this.vtbl.GetSubscriptionItemInfo)
        CallbackFree(this.vtbl.SetSubscriptionItemInfo)
        CallbackFree(this.vtbl.ReadProperties)
        CallbackFree(this.vtbl.WriteProperties)
        CallbackFree(this.vtbl.EnumProperties)
        CallbackFree(this.vtbl.NotifyChanged)
    }
}
