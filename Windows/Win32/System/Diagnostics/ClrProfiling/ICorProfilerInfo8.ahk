#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICorProfilerInfo7.ahk" { ICorProfilerInfo7 }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo8 extends ICorProfilerInfo7 {
    /**
     * The interface identifier for ICorProfilerInfo8
     * @type {Guid}
     */
    static IID := Guid("{c5ac80a6-782e-4716-8044-39598c60cfbf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo8 interfaces
    */
    struct Vtbl extends ICorProfilerInfo7.Vtbl {
        IsFunctionDynamic      : IntPtr
        GetFunctionFromIP3     : IntPtr
        GetDynamicFunctionInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {BOOL} 
     */
    IsFunctionDynamic(functionId) {
        result := ComCall(87, this, "ptr", functionId, BOOL.Ptr, &isDynamic := 0, "HRESULT")
        return isDynamic
    }

    /**
     * 
     * @param {Pointer<Integer>} ip 
     * @param {Pointer<Pointer>} functionId 
     * @param {Pointer<Pointer>} pReJitId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP3(ip, functionId, pReJitId) {
        ipMarshal := ip is VarRef ? "char*" : "ptr"
        functionIdMarshal := functionId is VarRef ? "ptr*" : "ptr"
        pReJitIdMarshal := pReJitId is VarRef ? "ptr*" : "ptr"

        result := ComCall(88, this, ipMarshal, ip, functionIdMarshal, functionId, pReJitIdMarshal, pReJitId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Pointer>} moduleId 
     * @param {Pointer<Pointer<Integer>>} ppvSig 
     * @param {Pointer<Integer>} pbSig 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcchName 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     */
    GetDynamicFunctionInfo(functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        moduleIdMarshal := moduleId is VarRef ? "ptr*" : "ptr"
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pbSigMarshal := pbSig is VarRef ? "uint*" : "ptr"
        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(89, this, "ptr", functionId, moduleIdMarshal, moduleId, ppvSigMarshal, ppvSig, pbSigMarshal, pbSig, "uint", cchName, pcchNameMarshal, pcchName, "ptr", wszName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsFunctionDynamic := CallbackCreate(GetMethod(implObj, "IsFunctionDynamic"), flags, 3)
        this.vtbl.GetFunctionFromIP3 := CallbackCreate(GetMethod(implObj, "GetFunctionFromIP3"), flags, 4)
        this.vtbl.GetDynamicFunctionInfo := CallbackCreate(GetMethod(implObj, "GetDynamicFunctionInfo"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsFunctionDynamic)
        CallbackFree(this.vtbl.GetFunctionFromIP3)
        CallbackFree(this.vtbl.GetDynamicFunctionInfo)
    }
}
