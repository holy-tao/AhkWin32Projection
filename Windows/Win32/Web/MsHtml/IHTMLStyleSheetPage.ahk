#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheetPage extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheetPage
     * @type {Guid}
     */
    static IID := Guid("{3050f7ee-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheetPage
     * @type {Guid}
     */
    static CLSID := Guid("{3050f7ef-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheetPage interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_selector    : IntPtr
        get_pseudoClass : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheetPage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    selector {
        get => this.get_selector()
    }

    /**
     * @type {BSTR} 
     */
    pseudoClass {
        get => this.get_pseudoClass()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_selector() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_pseudoClass() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLStyleSheetPage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_selector := CallbackCreate(GetMethod(implObj, "get_selector"), flags, 2)
        this.vtbl.get_pseudoClass := CallbackCreate(GetMethod(implObj, "get_pseudoClass"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_selector)
        CallbackFree(this.vtbl.get_pseudoClass)
    }
}
