#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLRuleStyle.ahk" { IHTMLRuleStyle }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheetPage2 extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheetPage2
     * @type {Guid}
     */
    static IID := Guid("{305106ed-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheetPage2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_selectorText : IntPtr
        get_selectorText : IntPtr
        get_style        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheetPage2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    selectorText {
        get => this.get_selectorText()
        set => this.put_selectorText(value)
    }

    /**
     * @type {IHTMLRuleStyle} 
     */
    style {
        get => this.get_style()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_selectorText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_selectorText() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLRuleStyle} 
     */
    get_style() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLRuleStyle(p)
    }

    Query(iid) {
        if (IHTMLStyleSheetPage2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_selectorText := CallbackCreate(GetMethod(implObj, "put_selectorText"), flags, 2)
        this.vtbl.get_selectorText := CallbackCreate(GetMethod(implObj, "get_selectorText"), flags, 2)
        this.vtbl.get_style := CallbackCreate(GetMethod(implObj, "get_style"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_selectorText)
        CallbackFree(this.vtbl.get_selectorText)
        CallbackFree(this.vtbl.get_style)
    }
}
