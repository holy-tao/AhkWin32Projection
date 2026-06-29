#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITravelLogEntry extends IUnknown {
    /**
     * The interface identifier for ITravelLogEntry
     * @type {Guid}
     */
    static IID := Guid("{7ebfdd87-ad18-11d3-a4c5-00c04f72d6b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITravelLogEntry interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTitle : IntPtr
        GetURL   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITravelLogEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetTitle() {
        result := ComCall(3, this, PWSTR.Ptr, &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetURL() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszURL := 0, "HRESULT")
        return ppszURL
    }

    Query(iid) {
        if (ITravelLogEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTitle := CallbackCreate(GetMethod(implObj, "GetTitle"), flags, 2)
        this.vtbl.GetURL := CallbackCreate(GetMethod(implObj, "GetURL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTitle)
        CallbackFree(this.vtbl.GetURL)
    }
}
