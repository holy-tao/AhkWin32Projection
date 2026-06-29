#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLStyleSheet.ahk" { IHTMLStyleSheet }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCSSRule extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSRule
     * @type {Guid}
     */
    static IID := Guid("{305106e9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSRule
     * @type {Guid}
     */
    static CLSID := Guid("{305106ef-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_type             : IntPtr
        put_cssText          : IntPtr
        get_cssText          : IntPtr
        get_parentRule       : IntPtr
        get_parentStyleSheet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {BSTR} 
     */
    cssText {
        get => this.get_cssText()
        set => this.put_cssText(value)
    }

    /**
     * @type {IHTMLCSSRule} 
     */
    parentRule {
        get => this.get_parentRule()
    }

    /**
     * @type {IHTMLStyleSheet} 
     */
    parentStyleSheet {
        get => this.get_parentStyleSheet()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(7, this, "ushort*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLCSSRule} 
     */
    get_parentRule() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLCSSRule(p)
    }

    /**
     * 
     * @returns {IHTMLStyleSheet} 
     */
    get_parentStyleSheet() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheet(p)
    }

    Query(iid) {
        if (IHTMLCSSRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.put_cssText := CallbackCreate(GetMethod(implObj, "put_cssText"), flags, 2)
        this.vtbl.get_cssText := CallbackCreate(GetMethod(implObj, "get_cssText"), flags, 2)
        this.vtbl.get_parentRule := CallbackCreate(GetMethod(implObj, "get_parentRule"), flags, 2)
        this.vtbl.get_parentStyleSheet := CallbackCreate(GetMethod(implObj, "get_parentStyleSheet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.put_cssText)
        CallbackFree(this.vtbl.get_cssText)
        CallbackFree(this.vtbl.get_parentRule)
        CallbackFree(this.vtbl.get_parentStyleSheet)
    }
}
