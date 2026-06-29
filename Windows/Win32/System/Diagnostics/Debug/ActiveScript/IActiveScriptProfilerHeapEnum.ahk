#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROFILER_HEAP_OBJECT_OPTIONAL_INFO.ahk" { PROFILER_HEAP_OBJECT_OPTIONAL_INFO }
#Import ".\PROFILER_HEAP_OBJECT.ahk" { PROFILER_HEAP_OBJECT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerHeapEnum extends IUnknown {
    /**
     * The interface identifier for IActiveScriptProfilerHeapEnum
     * @type {Guid}
     */
    static IID := Guid("{32e4694e-0d37-419b-b93d-fa20ded6e8ea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerHeapEnum interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next                      : IntPtr
        GetOptionalInfo           : IntPtr
        FreeObjectAndOptionalInfo : IntPtr
        GetNameIdMap              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerHeapEnum.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<PROFILER_HEAP_OBJECT>>} heapObjects 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, heapObjects, pceltFetched) {
        heapObjectsMarshal := heapObjects is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, heapObjectsMarshal, heapObjects, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROFILER_HEAP_OBJECT>} heapObject 
     * @param {Integer} celt 
     * @returns {PROFILER_HEAP_OBJECT_OPTIONAL_INFO} 
     */
    GetOptionalInfo(heapObject, celt) {
        optionalInfo := PROFILER_HEAP_OBJECT_OPTIONAL_INFO()
        result := ComCall(4, this, PROFILER_HEAP_OBJECT.Ptr, heapObject, "uint", celt, PROFILER_HEAP_OBJECT_OPTIONAL_INFO.Ptr, optionalInfo, "HRESULT")
        return optionalInfo
    }

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<PROFILER_HEAP_OBJECT>>} heapObjects 
     * @returns {HRESULT} 
     */
    FreeObjectAndOptionalInfo(celt, heapObjects) {
        heapObjectsMarshal := heapObjects is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", celt, heapObjectsMarshal, heapObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Pointer<PWSTR>>>} pNameList 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     */
    GetNameIdMap(pNameList, pcelt) {
        pNameListMarshal := pNameList is VarRef ? "ptr*" : "ptr"
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pNameListMarshal, pNameList, pceltMarshal, pcelt, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerHeapEnum.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.GetOptionalInfo := CallbackCreate(GetMethod(implObj, "GetOptionalInfo"), flags, 4)
        this.vtbl.FreeObjectAndOptionalInfo := CallbackCreate(GetMethod(implObj, "FreeObjectAndOptionalInfo"), flags, 3)
        this.vtbl.GetNameIdMap := CallbackCreate(GetMethod(implObj, "GetNameIdMap"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.GetOptionalInfo)
        CallbackFree(this.vtbl.FreeObjectAndOptionalInfo)
        CallbackFree(this.vtbl.GetNameIdMap)
    }
}
