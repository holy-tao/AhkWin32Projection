#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo6.ahk" { ICorProfilerInfo6 }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo7 extends ICorProfilerInfo6 {
    /**
     * The interface identifier for ICorProfilerInfo7
     * @type {Guid}
     */
    static IID := Guid("{9aeecc0d-63e0-4187-8c00-e312f503f663}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo7 interfaces
    */
    struct Vtbl extends ICorProfilerInfo6.Vtbl {
        ApplyMetaData            : IntPtr
        GetInMemorySymbolsLength : IntPtr
        ReadInMemorySymbols      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ApplyMetaData(moduleId) {
        result := ComCall(84, this, "ptr", moduleId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {Integer} 
     */
    GetInMemorySymbolsLength(moduleId) {
        result := ComCall(85, this, "ptr", moduleId, "uint*", &pCountSymbolBytes := 0, "HRESULT")
        return pCountSymbolBytes
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Integer} symbolsReadOffset 
     * @param {Pointer<Integer>} pSymbolBytes 
     * @param {Integer} countSymbolBytes 
     * @param {Pointer<Integer>} pCountSymbolBytesRead 
     * @returns {HRESULT} 
     */
    ReadInMemorySymbols(moduleId, symbolsReadOffset, pSymbolBytes, countSymbolBytes, pCountSymbolBytesRead) {
        pSymbolBytesMarshal := pSymbolBytes is VarRef ? "char*" : "ptr"
        pCountSymbolBytesReadMarshal := pCountSymbolBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(86, this, "ptr", moduleId, "uint", symbolsReadOffset, pSymbolBytesMarshal, pSymbolBytes, "uint", countSymbolBytes, pCountSymbolBytesReadMarshal, pCountSymbolBytesRead, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ApplyMetaData := CallbackCreate(GetMethod(implObj, "ApplyMetaData"), flags, 2)
        this.vtbl.GetInMemorySymbolsLength := CallbackCreate(GetMethod(implObj, "GetInMemorySymbolsLength"), flags, 3)
        this.vtbl.ReadInMemorySymbols := CallbackCreate(GetMethod(implObj, "ReadInMemorySymbols"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ApplyMetaData)
        CallbackFree(this.vtbl.GetInMemorySymbolsLength)
        CallbackFree(this.vtbl.ReadInMemorySymbols)
    }
}
