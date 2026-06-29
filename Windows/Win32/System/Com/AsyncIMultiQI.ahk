#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\MULTI_QI.ahk" { MULTI_QI }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct AsyncIMultiQI extends IUnknown {
    /**
     * The interface identifier for AsyncIMultiQI
     * @type {Guid}
     */
    static IID := Guid("{000e0020-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIMultiQI
     * @type {Guid}
     */
    static CLSID := Guid("{000e0020-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIMultiQI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_QueryMultipleInterfaces  : IntPtr
        Finish_QueryMultipleInterfaces : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIMultiQI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cMQIs 
     * @param {Pointer<MULTI_QI>} pMQIs 
     * @returns {HRESULT} 
     */
    Begin_QueryMultipleInterfaces(cMQIs, pMQIs) {
        result := ComCall(3, this, "uint", cMQIs, MULTI_QI.Ptr, pMQIs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MULTI_QI>} pMQIs 
     * @returns {HRESULT} 
     */
    Finish_QueryMultipleInterfaces(pMQIs) {
        result := ComCall(4, this, MULTI_QI.Ptr, pMQIs, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIMultiQI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_QueryMultipleInterfaces := CallbackCreate(GetMethod(implObj, "Begin_QueryMultipleInterfaces"), flags, 3)
        this.vtbl.Finish_QueryMultipleInterfaces := CallbackCreate(GetMethod(implObj, "Finish_QueryMultipleInterfaces"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_QueryMultipleInterfaces)
        CallbackFree(this.vtbl.Finish_QueryMultipleInterfaces)
    }
}
