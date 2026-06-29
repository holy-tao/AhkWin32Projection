#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DBPARAMINFO.ahk" { DBPARAMINFO }
#Import ".\DBPARAMBINDINFO.ahk" { DBPARAMBINDINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

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
     * 
     * @param {Pointer<Pointer>} pcParams 
     * @param {Pointer<Pointer<DBPARAMINFO>>} prgParamInfo 
     * @param {Pointer<Pointer<Integer>>} ppNamesBuffer 
     * @returns {HRESULT} 
     */
    GetParameterInfo(pcParams, prgParamInfo, ppNamesBuffer) {
        pcParamsMarshal := pcParams is VarRef ? "ptr*" : "ptr"
        prgParamInfoMarshal := prgParamInfo is VarRef ? "ptr*" : "ptr"
        ppNamesBufferMarshal := ppNamesBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcParamsMarshal, pcParams, prgParamInfoMarshal, prgParamInfo, ppNamesBufferMarshal, ppNamesBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cParamNames 
     * @param {Pointer<PWSTR>} rgParamNames 
     * @returns {Pointer} 
     */
    MapParameterNames(cParamNames, rgParamNames) {
        rgParamNamesMarshal := rgParamNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cParamNames, rgParamNamesMarshal, rgParamNames, "ptr*", &rgParamOrdinals := 0, "HRESULT")
        return rgParamOrdinals
    }

    /**
     * 
     * @param {Pointer} cParams 
     * @param {Pointer<Pointer>} rgParamOrdinals 
     * @param {Pointer<DBPARAMBINDINFO>} rgParamBindInfo 
     * @returns {HRESULT} 
     */
    SetParameterInfo(cParams, rgParamOrdinals, rgParamBindInfo) {
        rgParamOrdinalsMarshal := rgParamOrdinals is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cParams, rgParamOrdinalsMarshal, rgParamOrdinals, DBPARAMBINDINFO.Ptr, rgParamBindInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICommandWithParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameterInfo := CallbackCreate(GetMethod(implObj, "GetParameterInfo"), flags, 4)
        this.vtbl.MapParameterNames := CallbackCreate(GetMethod(implObj, "MapParameterNames"), flags, 4)
        this.vtbl.SetParameterInfo := CallbackCreate(GetMethod(implObj, "SetParameterInfo"), flags, 4)
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
