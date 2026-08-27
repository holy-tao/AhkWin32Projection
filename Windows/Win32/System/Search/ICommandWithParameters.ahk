#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPARAMBINDINFO.ahk" { DBPARAMBINDINFO }
#Import ".\DBPARAMINFO.ahk" { DBPARAMINFO }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ICommandWithParameters extends IUnknown {
    /**
     * The interface identifier for ICommandWithParameters
     * @type {Guid}
     */
    static IID := Guid("{0c733a64-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICommandWithParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParameterInfo  : IntPtr
        MapParameterNames : IntPtr
        SetParameterInfo  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICommandWithParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {Pointer<Pointer>} pcParams 
     * @param {Pointer<Pointer<DBPARAMINFO>>} prgParamInfo 
     * @param {Pointer<Pointer<Integer>>} ppNamesBuffer 
     * @returns {HRESULT} 
     */
    GetParameterInfo(pcParams, prgParamInfo, ppNamesBuffer) {
        pcParamsMarshal := pcParams is VarRef ? "ptr*" : IntPtr
        prgParamInfoMarshal := prgParamInfo is VarRef ? "ptr*" : IntPtr
        ppNamesBufferMarshal := ppNamesBuffer is VarRef ? "ptr*" : IntPtr
        ppNamesBufferMarshal := ppNamesBuffer == 0 ? IntPtr : "ptr*"

        result := ComCall(3, this, pcParamsMarshal, pcParams, prgParamInfoMarshal, prgParamInfo, ppNamesBufferMarshal, ppNamesBuffer, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} cParamNames 
     * @param {Pointer<PWSTR>} rgParamNames 
     * @returns {Pointer} 
     */
    MapParameterNames(cParamNames, rgParamNames) {
        rgParamNamesMarshal := rgParamNames is VarRef ? "ptr*" : IntPtr

        result := ComCall(4, this, IntPtr, cParamNames, rgParamNamesMarshal, rgParamNames, "ptr*", &rgParamOrdinals := 0, "HRESULT")
        return rgParamOrdinals
    }

    /**
     * @param {Pointer} cParams 
     * @param {Pointer<Pointer>} rgParamOrdinals 
     * @param {Pointer<DBPARAMBINDINFO>} rgParamBindInfo 
     * @returns {HRESULT} 
     */
    SetParameterInfo(cParams, rgParamOrdinals, rgParamBindInfo) {
        rgParamOrdinalsMarshal := rgParamOrdinals is VarRef ? "ptr*" : IntPtr
        rgParamOrdinalsMarshal := rgParamOrdinals == 0 ? IntPtr : "ptr*"
        rgParamBindInfoMarshal := rgParamBindInfo == 0 ? IntPtr : DBPARAMBINDINFO.Ptr

        result := ComCall(5, this, IntPtr, cParams, rgParamOrdinalsMarshal, rgParamOrdinals, rgParamBindInfoMarshal, rgParamBindInfo, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ICommandWithParameters.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameterInfo := CallbackCreate(ObjBindMethod(implObj, "GetParameterInfo"), flags, 4)
        this.vtbl.MapParameterNames := CallbackCreate(ObjBindMethod(implObj, "MapParameterNames"), flags, 4)
        this.vtbl.SetParameterInfo := CallbackCreate(ObjBindMethod(implObj, "SetParameterInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParameterInfo)
        CallbackFree(this.vtbl.MapParameterNames)
        CallbackFree(this.vtbl.SetParameterInfo)
    }
}
