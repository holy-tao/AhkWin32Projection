#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMSiteModeEvent extends IDispatch {
    /**
     * The interface identifier for IDOMSiteModeEvent
     * @type {Guid}
     */
    static IID := Guid("{30510765-98b6-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMSiteModeEvent
     * @type {Guid}
     */
    static CLSID := Guid("{30510766-98b6-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMSiteModeEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_buttonID  : IntPtr
        get_actionURL : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMSiteModeEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    buttonID {
        get => this.get_buttonID()
    }

    /**
     * @type {BSTR} 
     */
    actionURL {
        get => this.get_actionURL()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_buttonID() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_actionURL() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IDOMSiteModeEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_buttonID := CallbackCreate(GetMethod(implObj, "get_buttonID"), flags, 2)
        this.vtbl.get_actionURL := CallbackCreate(GetMethod(implObj, "get_actionURL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_buttonID)
        CallbackFree(this.vtbl.get_actionURL)
    }
}
