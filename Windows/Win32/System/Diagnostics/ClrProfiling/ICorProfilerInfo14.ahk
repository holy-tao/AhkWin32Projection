#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerObjectEnum.ahk" { ICorProfilerObjectEnum }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\COR_PRF_NONGC_HEAP_RANGE.ahk" { COR_PRF_NONGC_HEAP_RANGE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo13.ahk" { ICorProfilerInfo13 }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo14 extends ICorProfilerInfo13 {
    /**
     * The interface identifier for ICorProfilerInfo14
     * @type {Guid}
     */
    static IID := Guid("{f460e352-d76d-4fe9-835f-f6af9d6e862d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo14 interfaces
    */
    struct Vtbl extends ICorProfilerInfo13.Vtbl {
        EnumerateNonGCObjects    : IntPtr
        GetNonGCHeapBounds       : IntPtr
        EventPipeCreateProvider2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo14.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ICorProfilerObjectEnum} 
     */
    EnumerateNonGCObjects() {
        result := ComCall(111, this, "ptr*", &ppEnum := 0, "HRESULT")
        return ICorProfilerObjectEnum(ppEnum)
    }

    /**
     * 
     * @param {Integer} cObjectRanges 
     * @param {Pointer<Integer>} pcObjectRanges 
     * @param {Pointer<COR_PRF_NONGC_HEAP_RANGE>} ranges 
     * @returns {HRESULT} 
     */
    GetNonGCHeapBounds(cObjectRanges, pcObjectRanges, ranges) {
        pcObjectRangesMarshal := pcObjectRanges is VarRef ? "uint*" : "ptr"

        result := ComCall(112, this, "uint", cObjectRanges, pcObjectRangesMarshal, pcObjectRanges, COR_PRF_NONGC_HEAP_RANGE.Ptr, ranges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} providerName 
     * @param {Pointer<Pointer<EventPipeProviderCallback>>} pCallback 
     * @returns {Pointer} 
     */
    EventPipeCreateProvider2(providerName, pCallback) {
        providerName := providerName is String ? StrPtr(providerName) : providerName

        pCallbackMarshal := pCallback is VarRef ? "ptr*" : "ptr"

        result := ComCall(113, this, "ptr", providerName, pCallbackMarshal, pCallback, "ptr*", &pProvider := 0, "HRESULT")
        return pProvider
    }

    Query(iid) {
        if (ICorProfilerInfo14.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateNonGCObjects := CallbackCreate(GetMethod(implObj, "EnumerateNonGCObjects"), flags, 2)
        this.vtbl.GetNonGCHeapBounds := CallbackCreate(GetMethod(implObj, "GetNonGCHeapBounds"), flags, 4)
        this.vtbl.EventPipeCreateProvider2 := CallbackCreate(GetMethod(implObj, "EventPipeCreateProvider2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateNonGCObjects)
        CallbackFree(this.vtbl.GetNonGCHeapBounds)
        CallbackFree(this.vtbl.EventPipeCreateProvider2)
    }
}
