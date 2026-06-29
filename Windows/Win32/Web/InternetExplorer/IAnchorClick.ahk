#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IAnchorClick extends IDispatch {
    /**
     * The interface identifier for IAnchorClick
     * @type {Guid}
     */
    static IID := Guid("{13d5413b-33b9-11d2-95a7-00c04f8ecb02}")

    /**
     * The class identifier for AnchorClick
     * @type {Guid}
     */
    static CLSID := Guid("{13d5413c-33b9-11d2-95a7-00c04f8ecb02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnchorClick interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ProcOnClick : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnchorClick.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ProcOnClick() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAnchorClick.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcOnClick := CallbackCreate(GetMethod(implObj, "ProcOnClick"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcOnClick)
    }
}
