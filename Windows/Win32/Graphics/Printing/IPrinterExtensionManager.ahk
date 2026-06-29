#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterExtensionManager extends IUnknown {
    /**
     * The interface identifier for IPrinterExtensionManager
     * @type {Guid}
     */
    static IID := Guid("{93c6eb8c-b001-4355-9629-8e8a1b3f8e77}")

    /**
     * The class identifier for PrinterExtensionManager
     * @type {Guid}
     */
    static CLSID := Guid("{331b60da-9e90-4dd0-9c84-eac4e659b61f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterExtensionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableEvents  : IntPtr
        DisableEvents : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterExtensionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} printerDriverId 
     * @returns {HRESULT} 
     */
    EnableEvents(printerDriverId) {
        result := ComCall(3, this, Guid, printerDriverId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableEvents() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrinterExtensionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableEvents := CallbackCreate(GetMethod(implObj, "EnableEvents"), flags, 2)
        this.vtbl.DisableEvents := CallbackCreate(GetMethod(implObj, "DisableEvents"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableEvents)
        CallbackFree(this.vtbl.DisableEvents)
    }
}
