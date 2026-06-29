#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintJobCollection.ahk" { IPrintJobCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterQueueViewEvent extends IDispatch {
    /**
     * The interface identifier for IPrinterQueueViewEvent
     * @type {Guid}
     */
    static IID := Guid("{c5b6042b-fd21-404a-a0ef-e2fbb52b9080}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterQueueViewEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterQueueViewEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrintJobCollection} pCollection 
     * @param {Integer} ulViewOffset 
     * @param {Integer} ulViewSize 
     * @param {Integer} ulCountJobsInPrintQueue 
     * @returns {HRESULT} 
     */
    OnChanged(pCollection, ulViewOffset, ulViewSize, ulCountJobsInPrintQueue) {
        result := ComCall(7, this, "ptr", pCollection, "uint", ulViewOffset, "uint", ulViewSize, "uint", ulCountJobsInPrintQueue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrinterQueueViewEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnChanged := CallbackCreate(GetMethod(implObj, "OnChanged"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnChanged)
    }
}
