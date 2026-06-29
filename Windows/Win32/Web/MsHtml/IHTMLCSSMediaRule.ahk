#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyleSheetRulesCollection.ahk" { IHTMLStyleSheetRulesCollection }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLCSSMediaRule extends IDispatch {
    /**
     * The interface identifier for IHTMLCSSMediaRule
     * @type {Guid}
     */
    static IID := Guid("{305106eb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSMediaRule
     * @type {Guid}
     */
    static CLSID := Guid("{305106f1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLCSSMediaRule interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_media    : IntPtr
        get_media    : IntPtr
        get_cssRules : IntPtr
        insertRule   : IntPtr
        deleteRule   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLCSSMediaRule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    media {
        get => this.get_media()
        set => this.put_media(value)
    }

    /**
     * @type {IHTMLStyleSheetRulesCollection} 
     */
    cssRules {
        get => this.get_cssRules()
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        result := ComCall(7, this, VARIANT, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_media() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
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
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    insertRule(bstrRule, lIndex) {
        bstrRule := bstrRule is String ? BSTR.Alloc(bstrRule).Value : bstrRule

        result := ComCall(10, this, BSTR, bstrRule, "int", lIndex, "int*", &plNewIndex := 0, "HRESULT")
        return plNewIndex
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    deleteRule(lIndex) {
        result := ComCall(11, this, "int", lIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLCSSMediaRule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_media := CallbackCreate(GetMethod(implObj, "put_media"), flags, 2)
        this.vtbl.get_media := CallbackCreate(GetMethod(implObj, "get_media"), flags, 2)
        this.vtbl.get_cssRules := CallbackCreate(GetMethod(implObj, "get_cssRules"), flags, 2)
        this.vtbl.insertRule := CallbackCreate(GetMethod(implObj, "insertRule"), flags, 4)
        this.vtbl.deleteRule := CallbackCreate(GetMethod(implObj, "deleteRule"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_media)
        CallbackFree(this.vtbl.get_media)
        CallbackFree(this.vtbl.get_cssRules)
        CallbackFree(this.vtbl.insertRule)
        CallbackFree(this.vtbl.deleteRule)
    }
}
