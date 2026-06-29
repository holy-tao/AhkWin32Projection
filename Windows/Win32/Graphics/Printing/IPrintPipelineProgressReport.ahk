#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EXpsJobConsumption.ahk" { EXpsJobConsumption }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintPipelineProgressReport extends IUnknown {
    /**
     * The interface identifier for IPrintPipelineProgressReport
     * @type {Guid}
     */
    static IID := Guid("{edc12c7c-ed40-4ea5-96a6-5e4397497a61}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintPipelineProgressReport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintPipelineProgressReport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {EXpsJobConsumption} update 
     * @returns {HRESULT} 
     */
    ReportProgress(update) {
        result := ComCall(3, this, EXpsJobConsumption, update, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintPipelineProgressReport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportProgress := CallbackCreate(GetMethod(implObj, "ReportProgress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportProgress)
    }
}
