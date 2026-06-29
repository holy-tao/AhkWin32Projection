#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterQueueView extends IDispatch {
    /**
     * The interface identifier for IPrinterQueueView
     * @type {Guid}
     */
    static IID := Guid("{476e2969-3b2b-4b3f-8277-cff6056042aa}")

    /**
     * The class identifier for PrinterQueueView
     * @type {Guid}
     */
    static CLSID := Guid("{eb54c231-798c-4c9e-b461-29fad04039b1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterQueueView interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SetViewRange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterQueueView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ulViewOffset 
     * @param {Integer} ulViewSize 
     * @returns {HRESULT} 
     */
    SetViewRange(ulViewOffset, ulViewSize) {
        result := ComCall(7, this, "uint", ulViewOffset, "uint", ulViewSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrinterQueueView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetViewRange := CallbackCreate(GetMethod(implObj, "SetViewRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetViewRange)
    }
}
