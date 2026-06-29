#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\COR_IL_MAP.ahk" { COR_IL_MAP }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerFunctionControl extends IUnknown {
    /**
     * The interface identifier for ICorProfilerFunctionControl
     * @type {Guid}
     */
    static IID := Guid("{f0963021-e1ea-4732-8581-e01b0bd3c0c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerFunctionControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCodegenFlags          : IntPtr
        SetILFunctionBody        : IntPtr
        SetILInstrumentedCodeMap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerFunctionControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    SetCodegenFlags(flags) {
        result := ComCall(3, this, "uint", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbNewILMethodHeader 
     * @param {Pointer<Integer>} pbNewILMethodHeader 
     * @returns {HRESULT} 
     */
    SetILFunctionBody(cbNewILMethodHeader, pbNewILMethodHeader) {
        pbNewILMethodHeaderMarshal := pbNewILMethodHeader is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", cbNewILMethodHeader, pbNewILMethodHeaderMarshal, pbNewILMethodHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cILMapEntries 
     * @param {Pointer<COR_IL_MAP>} rgILMapEntries 
     * @returns {HRESULT} 
     */
    SetILInstrumentedCodeMap(cILMapEntries, rgILMapEntries) {
        result := ComCall(5, this, "uint", cILMapEntries, COR_IL_MAP.Ptr, rgILMapEntries, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerFunctionControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCodegenFlags := CallbackCreate(GetMethod(implObj, "SetCodegenFlags"), flags, 2)
        this.vtbl.SetILFunctionBody := CallbackCreate(GetMethod(implObj, "SetILFunctionBody"), flags, 3)
        this.vtbl.SetILInstrumentedCodeMap := CallbackCreate(GetMethod(implObj, "SetILInstrumentedCodeMap"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCodegenFlags)
        CallbackFree(this.vtbl.SetILFunctionBody)
        CallbackFree(this.vtbl.SetILInstrumentedCodeMap)
    }
}
