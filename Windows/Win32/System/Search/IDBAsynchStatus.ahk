#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBAsynchStatus extends IUnknown {
    /**
     * The interface identifier for IDBAsynchStatus
     * @type {Guid}
     */
    static IID := Guid("{0c733a95-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBAsynchStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Abort     : IntPtr
        GetStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBAsynchStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @returns {HRESULT} 
     */
    Abort(hChapter, eOperation) {
        result := ComCall(3, this, "ptr", hChapter, "uint", eOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {Pointer<Pointer>} pulProgress 
     * @param {Pointer<Pointer>} pulProgressMax 
     * @param {Pointer<Integer>} peAsynchPhase 
     * @param {Pointer<PWSTR>} ppwszStatusText 
     * @returns {HRESULT} 
     */
    GetStatus(hChapter, eOperation, pulProgress, pulProgressMax, peAsynchPhase, ppwszStatusText) {
        pulProgressMarshal := pulProgress is VarRef ? "ptr*" : "ptr"
        pulProgressMaxMarshal := pulProgressMax is VarRef ? "ptr*" : "ptr"
        peAsynchPhaseMarshal := peAsynchPhase is VarRef ? "uint*" : "ptr"
        ppwszStatusTextMarshal := ppwszStatusText is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", hChapter, "uint", eOperation, pulProgressMarshal, pulProgress, pulProgressMaxMarshal, pulProgressMax, peAsynchPhaseMarshal, peAsynchPhase, ppwszStatusTextMarshal, ppwszStatusText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDBAsynchStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 3)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.GetStatus)
    }
}
