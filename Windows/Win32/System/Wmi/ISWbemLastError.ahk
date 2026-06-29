#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISWbemObject.ahk" { ISWbemObject }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct ISWbemLastError extends ISWbemObject {
    /**
     * The interface identifier for ISWbemLastError
     * @type {Guid}
     */
    static IID := Guid("{d962db84-d4bb-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemLastError
     * @type {Guid}
     */
    static CLSID := Guid("{c2feeeac-cfcd-11d1-8b05-00600806d9b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISWbemLastError interfaces
    */
    struct Vtbl extends ISWbemObject.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISWbemLastError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ISWbemLastError.IID.Equals(iid)) {
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
