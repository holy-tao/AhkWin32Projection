#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyleSheetRulesCollection.ahk" { IHTMLStyleSheetRulesCollection }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IHTMLCSSRule.ahk" { IHTMLCSSRule }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheet4 extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheet4
     * @type {Guid}
     */
    static IID := Guid("{305106f4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheet4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_type      : IntPtr
        get_href      : IntPtr
        get_title     : IntPtr
        get_ownerNode : IntPtr
        get_ownerRule : IntPtr
        get_cssRules  : IntPtr
        get_media     : IntPtr
        insertRule    : IntPtr
        deleteRule    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheet4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {VARIANT} 
     */
    href {
        get => this.get_href()
    }

    /**
     * @type {BSTR} 
     */
    title {
        get => this.get_title()
    }

    /**
     * @type {IHTMLElement} 
     */
    ownerNode {
        get => this.get_ownerNode()
    }

    /**
     * @type {IHTMLCSSRule} 
     */
    ownerRule {
        get => this.get_ownerRule()
    }

    /**
     * @type {IHTMLStyleSheetRulesCollection} 
     */
    cssRules {
        get => this.get_cssRules()
    }

    /**
     * @type {VARIANT} 
     */
    media {
        get => this.get_media()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_href() {
        p := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_ownerNode() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLCSSRule} 
     */
    get_ownerRule() {
        result := ComCall(11, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLCSSRule(p)
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesCollection} 
     */
    get_cssRules() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetRulesCollection(p)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_media() {
        p := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrRule 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    insertRule(bstrRule, lIndex) {
        bstrRule := bstrRule is String ? BSTR.Alloc(bstrRule).Value : bstrRule

        result := ComCall(14, this, BSTR, bstrRule, "int", lIndex, "int*", &plNewIndex := 0, "HRESULT")
        return plNewIndex
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    deleteRule(lIndex) {
        result := ComCall(15, this, "int", lIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLStyleSheet4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.get_title := CallbackCreate(GetMethod(implObj, "get_title"), flags, 2)
        this.vtbl.get_ownerNode := CallbackCreate(GetMethod(implObj, "get_ownerNode"), flags, 2)
        this.vtbl.get_ownerRule := CallbackCreate(GetMethod(implObj, "get_ownerRule"), flags, 2)
        this.vtbl.get_cssRules := CallbackCreate(GetMethod(implObj, "get_cssRules"), flags, 2)
        this.vtbl.get_media := CallbackCreate(GetMethod(implObj, "get_media"), flags, 2)
        this.vtbl.insertRule := CallbackCreate(GetMethod(implObj, "insertRule"), flags, 4)
        this.vtbl.deleteRule := CallbackCreate(GetMethod(implObj, "deleteRule"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.get_title)
        CallbackFree(this.vtbl.get_ownerNode)
        CallbackFree(this.vtbl.get_ownerRule)
        CallbackFree(this.vtbl.get_cssRules)
        CallbackFree(this.vtbl.get_media)
        CallbackFree(this.vtbl.insertRule)
        CallbackFree(this.vtbl.deleteRule)
    }
}
