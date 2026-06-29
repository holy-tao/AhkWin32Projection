#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IEventServerTrace extends IDispatch {
    /**
     * The interface identifier for IEventServerTrace
     * @type {Guid}
     */
    static IID := Guid("{9a9f12b8-80af-47ab-a579-35ea57725370}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventServerTrace interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        StartTraceGuid : IntPtr
        StopTraceGuid  : IntPtr
        EnumTraceGuid  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventServerTrace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrguidEvent 
     * @param {BSTR} bstrguidFilter 
     * @param {Integer} lPidFilter 
     * @returns {HRESULT} 
     */
    StartTraceGuid(bstrguidEvent, bstrguidFilter, lPidFilter) {
        bstrguidEvent := bstrguidEvent is String ? BSTR.Alloc(bstrguidEvent).Value : bstrguidEvent
        bstrguidFilter := bstrguidFilter is String ? BSTR.Alloc(bstrguidFilter).Value : bstrguidFilter

        result := ComCall(7, this, BSTR, bstrguidEvent, BSTR, bstrguidFilter, "int", lPidFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrguidEvent 
     * @param {BSTR} bstrguidFilter 
     * @param {Integer} lPidFilter 
     * @returns {HRESULT} 
     */
    StopTraceGuid(bstrguidEvent, bstrguidFilter, lPidFilter) {
        bstrguidEvent := bstrguidEvent is String ? BSTR.Alloc(bstrguidEvent).Value : bstrguidEvent
        bstrguidFilter := bstrguidFilter is String ? BSTR.Alloc(bstrguidFilter).Value : bstrguidFilter

        result := ComCall(8, this, BSTR, bstrguidEvent, BSTR, bstrguidFilter, "int", lPidFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCntGuids 
     * @param {Pointer<BSTR>} pbstrGuidList 
     * @returns {HRESULT} 
     */
    EnumTraceGuid(plCntGuids, pbstrGuidList) {
        plCntGuidsMarshal := plCntGuids is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCntGuidsMarshal, plCntGuids, BSTR.Ptr, pbstrGuidList, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventServerTrace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartTraceGuid := CallbackCreate(GetMethod(implObj, "StartTraceGuid"), flags, 4)
        this.vtbl.StopTraceGuid := CallbackCreate(GetMethod(implObj, "StopTraceGuid"), flags, 4)
        this.vtbl.EnumTraceGuid := CallbackCreate(GetMethod(implObj, "EnumTraceGuid"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartTraceGuid)
        CallbackFree(this.vtbl.StopTraceGuid)
        CallbackFree(this.vtbl.EnumTraceGuid)
    }
}
