#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IBidiRequest extends IUnknown {
    /**
     * The interface identifier for IBidiRequest
     * @type {Guid}
     */
    static IID := Guid("{8f348bd7-4b47-4755-8a9d-0f422df3dc89}")

    /**
     * The class identifier for BidiRequest
     * @type {Guid}
     */
    static CLSID := Guid("{b9162a23-45f9-47cc-80f5-fe0fe9b9e1a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBidiRequest interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSchema     : IntPtr
        SetInputData  : IntPtr
        GetResult     : IntPtr
        GetOutputData : IntPtr
        GetEnumCount  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBidiRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszSchema 
     * @returns {HRESULT} 
     */
    SetSchema(pszSchema) {
        pszSchema := pszSchema is String ? StrPtr(pszSchema) : pszSchema

        result := ComCall(3, this, "ptr", pszSchema, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} uSize 
     * @returns {HRESULT} 
     */
    SetInputData(dwType, pData, uSize) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwType, pDataMarshal, pData, "uint", uSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetResult() {
        result := ComCall(5, this, "int*", &phr := 0, "HRESULT")
        return phr
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PWSTR>} ppszSchema 
     * @param {Pointer<Integer>} pdwType 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @param {Pointer<Integer>} uSize 
     * @returns {HRESULT} 
     */
    GetOutputData(dwIndex, ppszSchema, pdwType, ppData, uSize) {
        ppszSchemaMarshal := ppszSchema is VarRef ? "ptr*" : "ptr"
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        uSizeMarshal := uSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwIndex, ppszSchemaMarshal, ppszSchema, pdwTypeMarshal, pdwType, ppDataMarshal, ppData, uSizeMarshal, uSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEnumCount() {
        result := ComCall(7, this, "uint*", &pdwTotal := 0, "HRESULT")
        return pdwTotal
    }

    Query(iid) {
        if (IBidiRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSchema := CallbackCreate(GetMethod(implObj, "SetSchema"), flags, 2)
        this.vtbl.SetInputData := CallbackCreate(GetMethod(implObj, "SetInputData"), flags, 4)
        this.vtbl.GetResult := CallbackCreate(GetMethod(implObj, "GetResult"), flags, 2)
        this.vtbl.GetOutputData := CallbackCreate(GetMethod(implObj, "GetOutputData"), flags, 6)
        this.vtbl.GetEnumCount := CallbackCreate(GetMethod(implObj, "GetEnumCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSchema)
        CallbackFree(this.vtbl.SetInputData)
        CallbackFree(this.vtbl.GetResult)
        CallbackFree(this.vtbl.GetOutputData)
        CallbackFree(this.vtbl.GetEnumCount)
    }
}
