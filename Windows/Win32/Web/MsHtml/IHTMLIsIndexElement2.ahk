#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLFormElement.ahk" { IHTMLFormElement }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLIsIndexElement2 extends IDispatch {
    /**
     * The interface identifier for IHTMLIsIndexElement2
     * @type {Guid}
     */
    static IID := Guid("{3050f82f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLIsIndexElement2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_form : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLIsIndexElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLFormElement} 
     */
    form {
        get => this.get_form()
    }

    /**
     * 
     * @returns {IHTMLFormElement} 
     */
    get_form() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLFormElement(p)
    }

    Query(iid) {
        if (IHTMLIsIndexElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_form := CallbackCreate(GetMethod(implObj, "get_form"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_form)
    }
}
