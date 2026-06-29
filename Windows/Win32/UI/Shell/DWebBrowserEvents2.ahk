#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DWebBrowserEvents2 extends IDispatch {
    /**
     * The interface identifier for DWebBrowserEvents2
     * @type {Guid}
     */
    static IID := Guid("{34a715a0-6587-11d0-924a-0020afc7ac4d}")

    /**
     * The class identifier for DWebBrowserEvents2
     * @type {Guid}
     */
    static CLSID := Guid("{34a715a0-6587-11d0-924a-0020afc7ac4d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DWebBrowserEvents2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DWebBrowserEvents2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (DWebBrowserEvents2.IID.Equals(iid)) {
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
