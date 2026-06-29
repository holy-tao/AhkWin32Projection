#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetQueryStatus extends IUnknown {
    /**
     * The interface identifier for IRowsetQueryStatus
     * @type {Guid}
     */
    static IID := Guid("{a7ac77ed-f8d7-11ce-a798-0020f8008024}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetQueryStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStatus   : IntPtr
        GetStatusEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetQueryStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @param {Pointer<Integer>} pcFilteredDocuments 
     * @param {Pointer<Integer>} pcDocumentsToFilter 
     * @param {Pointer<Pointer>} pdwRatioFinishedDenominator 
     * @param {Pointer<Pointer>} pdwRatioFinishedNumerator 
     * @param {Pointer} cbBmk 
     * @param {Pointer<Integer>} pBmk 
     * @param {Pointer<Pointer>} piRowBmk 
     * @param {Pointer<Pointer>} pcRowsTotal 
     * @returns {HRESULT} 
     */
    GetStatusEx(pdwStatus, pcFilteredDocuments, pcDocumentsToFilter, pdwRatioFinishedDenominator, pdwRatioFinishedNumerator, cbBmk, pBmk, piRowBmk, pcRowsTotal) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        pcFilteredDocumentsMarshal := pcFilteredDocuments is VarRef ? "uint*" : "ptr"
        pcDocumentsToFilterMarshal := pcDocumentsToFilter is VarRef ? "uint*" : "ptr"
        pdwRatioFinishedDenominatorMarshal := pdwRatioFinishedDenominator is VarRef ? "ptr*" : "ptr"
        pdwRatioFinishedNumeratorMarshal := pdwRatioFinishedNumerator is VarRef ? "ptr*" : "ptr"
        pBmkMarshal := pBmk is VarRef ? "char*" : "ptr"
        piRowBmkMarshal := piRowBmk is VarRef ? "ptr*" : "ptr"
        pcRowsTotalMarshal := pcRowsTotal is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pdwStatusMarshal, pdwStatus, pcFilteredDocumentsMarshal, pcFilteredDocuments, pcDocumentsToFilterMarshal, pcDocumentsToFilter, pdwRatioFinishedDenominatorMarshal, pdwRatioFinishedDenominator, pdwRatioFinishedNumeratorMarshal, pdwRatioFinishedNumerator, "ptr", cbBmk, pBmkMarshal, pBmk, piRowBmkMarshal, piRowBmk, pcRowsTotalMarshal, pcRowsTotal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetQueryStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetStatusEx := CallbackCreate(GetMethod(implObj, "GetStatusEx"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetStatusEx)
    }
}
