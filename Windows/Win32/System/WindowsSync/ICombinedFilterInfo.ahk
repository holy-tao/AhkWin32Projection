#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FILTER_COMBINATION_TYPE.ahk" { FILTER_COMBINATION_TYPE }
#Import ".\ISyncFilterInfo.ahk" { ISyncFilterInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ICombinedFilterInfo extends ISyncFilterInfo {
    /**
     * The interface identifier for ICombinedFilterInfo
     * @type {Guid}
     */
    static IID := Guid("{11f9de71-2818-4779-b2ac-42d450565f45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICombinedFilterInfo interfaces
    */
    struct Vtbl extends ISyncFilterInfo.Vtbl {
        GetFilterCount           : IntPtr
        GetFilterInfo            : IntPtr
        GetFilterCombinationType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICombinedFilterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFilterCount 
     * @returns {HRESULT} 
     */
    GetFilterCount(pdwFilterCount) {
        pdwFilterCountMarshal := pdwFilterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwFilterCountMarshal, pdwFilterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterIndex 
     * @returns {ISyncFilterInfo} 
     */
    GetFilterInfo(dwFilterIndex) {
        result := ComCall(5, this, "uint", dwFilterIndex, "ptr*", &ppIFilterInfo := 0, "HRESULT")
        return ISyncFilterInfo(ppIFilterInfo)
    }

    /**
     * 
     * @param {Pointer<FILTER_COMBINATION_TYPE>} pFilterCombinationType 
     * @returns {HRESULT} 
     */
    GetFilterCombinationType(pFilterCombinationType) {
        pFilterCombinationTypeMarshal := pFilterCombinationType is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pFilterCombinationTypeMarshal, pFilterCombinationType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICombinedFilterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilterCount := CallbackCreate(GetMethod(implObj, "GetFilterCount"), flags, 2)
        this.vtbl.GetFilterInfo := CallbackCreate(GetMethod(implObj, "GetFilterInfo"), flags, 3)
        this.vtbl.GetFilterCombinationType := CallbackCreate(GetMethod(implObj, "GetFilterCombinationType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFilterCount)
        CallbackFree(this.vtbl.GetFilterInfo)
        CallbackFree(this.vtbl.GetFilterCombinationType)
    }
}
