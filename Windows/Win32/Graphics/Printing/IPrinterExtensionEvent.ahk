#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrinterExtensionContextCollection.ahk" { IPrinterExtensionContextCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterExtensionEventArgs.ahk" { IPrinterExtensionEventArgs }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterExtensionEvent extends IDispatch {
    /**
     * The interface identifier for IPrinterExtensionEvent
     * @type {Guid}
     */
    static IID := Guid("{c093cb63-5ef5-4585-af8e-4d5637487b57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterExtensionEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        OnDriverEvent             : IntPtr
        OnPrinterQueuesEnumerated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterExtensionEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrinterExtensionEventArgs} pEventArgs 
     * @returns {HRESULT} 
     */
    OnDriverEvent(pEventArgs) {
        result := ComCall(7, this, "ptr", pEventArgs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrinterExtensionContextCollection} pContextCollection 
     * @returns {HRESULT} 
     */
    OnPrinterQueuesEnumerated(pContextCollection) {
        result := ComCall(8, this, "ptr", pContextCollection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrinterExtensionEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDriverEvent := CallbackCreate(GetMethod(implObj, "OnDriverEvent"), flags, 2)
        this.vtbl.OnPrinterQueuesEnumerated := CallbackCreate(GetMethod(implObj, "OnPrinterQueuesEnumerated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDriverEvent)
        CallbackFree(this.vtbl.OnPrinterQueuesEnumerated)
    }
}
