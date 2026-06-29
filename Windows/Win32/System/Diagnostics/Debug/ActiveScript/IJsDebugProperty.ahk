#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\JS_PROPERTY_MEMBERS.ahk" { JS_PROPERTY_MEMBERS }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\JsDebugPropertyInfo.ahk" { JsDebugPropertyInfo }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IJsEnumDebugProperty.ahk" { IJsEnumDebugProperty }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IJsDebugProperty extends IUnknown {
    /**
     * The interface identifier for IJsDebugProperty
     * @type {Guid}
     */
    static IID := Guid("{f8ffcf2b-3aa4-4320-85c3-52a312ba9633}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJsDebugProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropertyInfo : IntPtr
        GetMembers      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJsDebugProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} nRadix 
     * @returns {JsDebugPropertyInfo} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(nRadix) {
        pPropertyInfo := JsDebugPropertyInfo()
        result := ComCall(3, this, "uint", nRadix, JsDebugPropertyInfo.Ptr, pPropertyInfo, "HRESULT")
        return pPropertyInfo
    }

    /**
     * 
     * @param {JS_PROPERTY_MEMBERS} members 
     * @returns {IJsEnumDebugProperty} 
     */
    GetMembers(members) {
        result := ComCall(4, this, JS_PROPERTY_MEMBERS, members, "ptr*", &ppEnum := 0, "HRESULT")
        return IJsEnumDebugProperty(ppEnum)
    }

    Query(iid) {
        if (IJsDebugProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyInfo := CallbackCreate(GetMethod(implObj, "GetPropertyInfo"), flags, 3)
        this.vtbl.GetMembers := CallbackCreate(GetMethod(implObj, "GetMembers"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyInfo)
        CallbackFree(this.vtbl.GetMembers)
    }
}
