#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPARAMINFO.ahk" { DBPARAMINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPARAMS.ahk" { DBPARAMS }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetWithParameters extends IUnknown {
    /**
     * The interface identifier for IRowsetWithParameters
     * @type {Guid}
     */
    static IID := Guid("{0c733a6e-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetWithParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParameterInfo : IntPtr
        Requery          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetWithParameters.Vtbl()
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
     * @param {Pointer<DBPARAMS>} pParams 
     * @param {Pointer<Integer>} pulErrorParam 
     * @param {Pointer<Pointer>} phReserved 
     * @returns {HRESULT} 
     */
    Requery(pParams, pulErrorParam, phReserved) {
        pulErrorParamMarshal := pulErrorParam is VarRef ? "uint*" : "ptr"
        phReservedMarshal := phReserved is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, DBPARAMS.Ptr, pParams, pulErrorParamMarshal, pulErrorParam, phReservedMarshal, phReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetWithParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParameterInfo := CallbackCreate(GetMethod(implObj, "GetParameterInfo"), flags, 4)
        this.vtbl.Requery := CallbackCreate(GetMethod(implObj, "Requery"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParameterInfo)
        CallbackFree(this.vtbl.Requery)
    }
}
