#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintCoreHelper.ahk" { IPrintCoreHelper }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintCoreHelperPS extends IPrintCoreHelper {
    /**
     * The interface identifier for IPrintCoreHelperPS
     * @type {Guid}
     */
    static IID := Guid("{c2c14f6f-95d3-4d63-96cf-6bd9e6c907c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintCoreHelperPS interfaces
    */
    struct Vtbl extends IPrintCoreHelper.Vtbl {
        GetGlobalAttribute  : IntPtr
        GetFeatureAttribute : IntPtr
        GetOptionAttribute  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintCoreHelperPS.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetGlobalAttribute(pszAttribute, pdwDataType, ppbData, pcbSize) {
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        pdwDataTypeMarshal := pdwDataType is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pszAttribute, pdwDataTypeMarshal, pdwDataType, ppbDataMarshal, ppbData, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetFeatureAttribute(pszFeatureKeyword, pszAttribute, pdwDataType, ppbData, pcbSize) {
        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        pdwDataTypeMarshal := pdwDataType is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pszFeatureKeyword, "ptr", pszAttribute, pdwDataTypeMarshal, pdwDataType, ppbDataMarshal, ppbData, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFeatureKeyword 
     * @param {PSTR} pszOptionKeyword 
     * @param {PSTR} pszAttribute 
     * @param {Pointer<Integer>} pdwDataType 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetOptionAttribute(pszFeatureKeyword, pszOptionKeyword, pszAttribute, pdwDataType, ppbData, pcbSize) {
        pszFeatureKeyword := pszFeatureKeyword is String ? StrPtr(pszFeatureKeyword) : pszFeatureKeyword
        pszOptionKeyword := pszOptionKeyword is String ? StrPtr(pszOptionKeyword) : pszOptionKeyword
        pszAttribute := pszAttribute is String ? StrPtr(pszAttribute) : pszAttribute

        pdwDataTypeMarshal := pdwDataType is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pszFeatureKeyword, "ptr", pszOptionKeyword, "ptr", pszAttribute, pdwDataTypeMarshal, pdwDataType, ppbDataMarshal, ppbData, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintCoreHelperPS.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGlobalAttribute := CallbackCreate(GetMethod(implObj, "GetGlobalAttribute"), flags, 5)
        this.vtbl.GetFeatureAttribute := CallbackCreate(GetMethod(implObj, "GetFeatureAttribute"), flags, 6)
        this.vtbl.GetOptionAttribute := CallbackCreate(GetMethod(implObj, "GetOptionAttribute"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGlobalAttribute)
        CallbackFree(this.vtbl.GetFeatureAttribute)
        CallbackFree(this.vtbl.GetOptionAttribute)
    }
}
