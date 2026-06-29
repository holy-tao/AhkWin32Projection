#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FDEX_PROP_FLAGS.ahk" { FDEX_PROP_FLAGS }
#Import "..\Com\IServiceProvider.ahk" { IServiceProvider }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\DISPPARAMS.ahk" { DISPPARAMS }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IDispatchEx extends IDispatch {
    /**
     * The interface identifier for IDispatchEx
     * @type {Guid}
     */
    static IID := Guid("{a6ef9860-c720-11d0-9337-00a0c90dcaa9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDispatchEx interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetDispID            : IntPtr
        InvokeEx             : IntPtr
        DeleteMemberByName   : IntPtr
        DeleteMemberByDispID : IntPtr
        GetMemberProperties  : IntPtr
        GetMemberName        : IntPtr
        GetNextDispID        : IntPtr
        GetNameSpaceParent   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDispatchEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} grfdex 
     * @returns {Integer} 
     */
    GetDispID(bstrName, grfdex) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, BSTR, bstrName, "uint", grfdex, "int*", &pid := 0, "HRESULT")
        return pid
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} lcid 
     * @param {Integer} wFlags 
     * @param {Pointer<DISPPARAMS>} pdp 
     * @param {Pointer<VARIANT>} pvarRes 
     * @param {Pointer<EXCEPINFO>} pei 
     * @param {IServiceProvider} pspCaller 
     * @returns {HRESULT} 
     */
    InvokeEx(id, lcid, wFlags, pdp, pvarRes, pei, pspCaller) {
        result := ComCall(8, this, "int", id, "uint", lcid, "ushort", wFlags, DISPPARAMS.Ptr, pdp, VARIANT.Ptr, pvarRes, EXCEPINFO.Ptr, pei, "ptr", pspCaller, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} grfdex 
     * @returns {HRESULT} 
     */
    DeleteMemberByName(bstrName, grfdex) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "uint", grfdex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    DeleteMemberByDispID(id) {
        result := ComCall(10, this, "int", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Integer} grfdexFetch 
     * @returns {FDEX_PROP_FLAGS} 
     */
    GetMemberProperties(id, grfdexFetch) {
        result := ComCall(11, this, "int", id, "uint", grfdexFetch, "uint*", &pgrfdex := 0, "HRESULT")
        return pgrfdex
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {BSTR} 
     */
    GetMemberName(id) {
        pbstrName := BSTR.Owned()
        result := ComCall(12, this, "int", id, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {Integer} grfdex 
     * @param {Integer} id 
     * @returns {Integer} 
     */
    GetNextDispID(grfdex, id) {
        result := ComCall(13, this, "uint", grfdex, "int", id, "int*", &pid := 0, "HRESULT")
        return pid
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetNameSpaceParent() {
        result := ComCall(14, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (IDispatchEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDispID := CallbackCreate(GetMethod(implObj, "GetDispID"), flags, 4)
        this.vtbl.InvokeEx := CallbackCreate(GetMethod(implObj, "InvokeEx"), flags, 8)
        this.vtbl.DeleteMemberByName := CallbackCreate(GetMethod(implObj, "DeleteMemberByName"), flags, 3)
        this.vtbl.DeleteMemberByDispID := CallbackCreate(GetMethod(implObj, "DeleteMemberByDispID"), flags, 2)
        this.vtbl.GetMemberProperties := CallbackCreate(GetMethod(implObj, "GetMemberProperties"), flags, 4)
        this.vtbl.GetMemberName := CallbackCreate(GetMethod(implObj, "GetMemberName"), flags, 3)
        this.vtbl.GetNextDispID := CallbackCreate(GetMethod(implObj, "GetNextDispID"), flags, 4)
        this.vtbl.GetNameSpaceParent := CallbackCreate(GetMethod(implObj, "GetNameSpaceParent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDispID)
        CallbackFree(this.vtbl.InvokeEx)
        CallbackFree(this.vtbl.DeleteMemberByName)
        CallbackFree(this.vtbl.DeleteMemberByDispID)
        CallbackFree(this.vtbl.GetMemberProperties)
        CallbackFree(this.vtbl.GetMemberName)
        CallbackFree(this.vtbl.GetNextDispID)
        CallbackFree(this.vtbl.GetNameSpaceParent)
    }
}
