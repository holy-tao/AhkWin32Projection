#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DWebBrowserEvents extends IDispatch {
    /**
     * The interface identifier for DWebBrowserEvents
     * @type {Guid}
     */
    static IID := Guid("{eab22ac2-30c1-11cf-a7eb-0000c05bae0b}")

    /**
     * The class identifier for DWebBrowserEvents
     * @type {Guid}
     */
    static CLSID := Guid("{eab22ac2-30c1-11cf-a7eb-0000c05bae0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DWebBrowserEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DWebBrowserEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (DWebBrowserEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
