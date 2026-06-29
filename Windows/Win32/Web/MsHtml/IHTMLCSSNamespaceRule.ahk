#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCSSNamespaceRule extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSNamespaceRule
     * @type {Guid}
     */
    static IID := Guid("{305106ee-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSNamespaceRule
     * @type {Guid}
     */
    static CLSID := Guid("{305106f2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSNamespaceRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_namespaceURI : IntPtr
        get_prefix       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSNamespaceRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    namespaceURI {
        get => this.get_namespaceURI()
    }

    /**
     * @type {BSTR} 
     */
    prefix {
        get => this.get_prefix()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_namespaceURI() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_prefix() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLCSSNamespaceRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_namespaceURI := CallbackCreate(GetMethod(implObj, "get_namespaceURI"), flags, 2)
        this.vtbl.get_prefix := CallbackCreate(GetMethod(implObj, "get_prefix"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_namespaceURI)
        CallbackFree(this.vtbl.get_prefix)
    }
}
