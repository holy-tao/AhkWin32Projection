#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyleSheetRulesCollection.ahk" { IHTMLStyleSheetRulesCollection }
#Import ".\IHTMLMSCSSKeyframeRule.ahk" { IHTMLMSCSSKeyframeRule }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLMSCSSKeyframesRule extends IDispatch {
    /**
     * The interface identifier for IHTMLMSCSSKeyframesRule
     * @type {Guid}
     */
    static IID := Guid("{3051080d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMSCSSKeyframesRule
     * @type {Guid}
     */
    static CLSID := Guid("{3051080f-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLMSCSSKeyframesRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_name     : IntPtr
        get_name     : IntPtr
        get_cssRules : IntPtr
        appendRule   : IntPtr
        deleteRule   : IntPtr
        findRule     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLMSCSSKeyframesRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     * @type {IHTMLStyleSheetRulesCollection} 
     */
    cssRules {
        get => this.get_cssRules()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesCollection} 
     */
    get_cssRules() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetRulesCollection(p)
    }

    /**
     * 
     * @param {BSTR} bstrRule 
     * @returns {HRESULT} 
     */
    appendRule(bstrRule) {
        bstrRule := bstrRule is String ? BSTR.Alloc(bstrRule).Value : bstrRule

        result := ComCall(10, this, BSTR, bstrRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    deleteRule(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(11, this, BSTR, bstrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {IHTMLMSCSSKeyframeRule} 
     */
    findRule(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(12, this, BSTR, bstrKey, "ptr*", &ppMSKeyframeRule := 0, "HRESULT")
        return IHTMLMSCSSKeyframeRule(ppMSKeyframeRule)
    }

    Query(iid) {
        if (IHTMLMSCSSKeyframesRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_name := CallbackCreate(GetMethod(implObj, "put_name"), flags, 2)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_cssRules := CallbackCreate(GetMethod(implObj, "get_cssRules"), flags, 2)
        this.vtbl.appendRule := CallbackCreate(GetMethod(implObj, "appendRule"), flags, 2)
        this.vtbl.deleteRule := CallbackCreate(GetMethod(implObj, "deleteRule"), flags, 2)
        this.vtbl.findRule := CallbackCreate(GetMethod(implObj, "findRule"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_name)
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_cssRules)
        CallbackFree(this.vtbl.appendRule)
        CallbackFree(this.vtbl.deleteRule)
        CallbackFree(this.vtbl.findRule)
    }
}
