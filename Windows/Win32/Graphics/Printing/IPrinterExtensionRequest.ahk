#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterExtensionRequest extends IDispatch {
    /**
     * The interface identifier for IPrinterExtensionRequest
     * @type {Guid}
     */
    static IID := Guid("{39843bf3-c4d2-41fd-b4b2-aedbee5e1900}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterExtensionRequest interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Cancel   : IntPtr
        Complete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterExtensionRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @param {BSTR} bstrLogMessage 
     * @returns {HRESULT} 
     */
    Cancel(hrStatus, bstrLogMessage) {
        bstrLogMessage := bstrLogMessage is String ? BSTR.Alloc(bstrLogMessage).Value : bstrLogMessage

        result := ComCall(7, this, "int", hrStatus, BSTR, bstrLogMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Complete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrinterExtensionRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 3)
        this.vtbl.Complete := CallbackCreate(GetMethod(implObj, "Complete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Complete)
    }
}
