#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IHTMLStyleSheetsCollection.ahk" { IHTMLStyleSheetsCollection }
#Import ".\IHTMLStyleSheetRulesCollection.ahk" { IHTMLStyleSheetRulesCollection }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheet extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheet
     * @type {Guid}
     */
    static IID := Guid("{3050f2e3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheet
     * @type {Guid}
     */
    static CLSID := Guid("{3050f2e4-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheet interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_title            : IntPtr
        get_title            : IntPtr
        get_parentStyleSheet : IntPtr
        get_owningElement    : IntPtr
        put_disabled         : IntPtr
        get_disabled         : IntPtr
        get_readOnly         : IntPtr
        get_imports          : IntPtr
        put_href             : IntPtr
        get_href             : IntPtr
        get_type             : IntPtr
        get_id               : IntPtr
        addImport            : IntPtr
        addRule              : IntPtr
        removeImport         : IntPtr
        removeRule           : IntPtr
        put_media            : IntPtr
        get_media            : IntPtr
        put_cssText          : IntPtr
        get_cssText          : IntPtr
        get_rules            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    title {
        get => this.get_title()
        set => this.put_title(value)
    }

    /**
     * @type {IHTMLStyleSheet} 
     */
    parentStyleSheet {
        get => this.get_parentStyleSheet()
    }

    /**
     * @type {IHTMLElement} 
     */
    owningElement {
        get => this.get_owningElement()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disabled {
        get => this.get_disabled()
        set => this.put_disabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    readOnly {
        get => this.get_readOnly()
    }

    /**
     * @type {IHTMLStyleSheetsCollection} 
     */
    imports {
        get => this.get_imports()
    }

    /**
     * @type {BSTR} 
     */
    href {
        get => this.get_href()
        set => this.put_href(value)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {BSTR} 
     */
    id {
        get => this.get_id()
    }

    /**
     * @type {BSTR} 
     */
    media {
        get => this.get_media()
        set => this.put_media(value)
    }

    /**
     * @type {BSTR} 
     */
    cssText {
        get => this.get_cssText()
        set => this.put_cssText(value)
    }

    /**
     * @type {IHTMLStyleSheetRulesCollection} 
     */
    rules {
        get => this.get_rules()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_title(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheet} 
     */
    get_parentStyleSheet() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheet(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_owningElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(11, this, VARIANT_BOOL, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_readOnly() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetsCollection} 
     */
    get_imports() {
        result := ComCall(14, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetsCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_href(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_id() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    addImport(bstrURL, lIndex) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(19, this, BSTR, bstrURL, "int", lIndex, "int*", &plIndex := 0, "HRESULT")
        return plIndex
    }

    /**
     * 
     * @param {BSTR} bstrSelector 
     * @param {BSTR} bstrStyle 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    addRule(bstrSelector, bstrStyle, lIndex) {
        bstrSelector := bstrSelector is String ? BSTR.Alloc(bstrSelector).Value : bstrSelector
        bstrStyle := bstrStyle is String ? BSTR.Alloc(bstrStyle).Value : bstrStyle

        result := ComCall(20, this, BSTR, bstrSelector, BSTR, bstrStyle, "int", lIndex, "int*", &plNewIndex := 0, "HRESULT")
        return plNewIndex
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    removeImport(lIndex) {
        result := ComCall(21, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    removeRule(lIndex) {
        result := ComCall(22, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_media() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesCollection} 
     */
    get_rules() {
        result := ComCall(27, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetRulesCollection(p)
    }

    Query(iid) {
        if (IHTMLStyleSheet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_title := CallbackCreate(GetMethod(implObj, "put_title"), flags, 2)
        this.vtbl.get_title := CallbackCreate(GetMethod(implObj, "get_title"), flags, 2)
        this.vtbl.get_parentStyleSheet := CallbackCreate(GetMethod(implObj, "get_parentStyleSheet"), flags, 2)
        this.vtbl.get_owningElement := CallbackCreate(GetMethod(implObj, "get_owningElement"), flags, 2)
        this.vtbl.put_disabled := CallbackCreate(GetMethod(implObj, "put_disabled"), flags, 2)
        this.vtbl.get_disabled := CallbackCreate(GetMethod(implObj, "get_disabled"), flags, 2)
        this.vtbl.get_readOnly := CallbackCreate(GetMethod(implObj, "get_readOnly"), flags, 2)
        this.vtbl.get_imports := CallbackCreate(GetMethod(implObj, "get_imports"), flags, 2)
        this.vtbl.put_href := CallbackCreate(GetMethod(implObj, "put_href"), flags, 2)
        this.vtbl.get_href := CallbackCreate(GetMethod(implObj, "get_href"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_id := CallbackCreate(GetMethod(implObj, "get_id"), flags, 2)
        this.vtbl.addImport := CallbackCreate(GetMethod(implObj, "addImport"), flags, 4)
        this.vtbl.addRule := CallbackCreate(GetMethod(implObj, "addRule"), flags, 5)
        this.vtbl.removeImport := CallbackCreate(GetMethod(implObj, "removeImport"), flags, 2)
        this.vtbl.removeRule := CallbackCreate(GetMethod(implObj, "removeRule"), flags, 2)
        this.vtbl.put_media := CallbackCreate(GetMethod(implObj, "put_media"), flags, 2)
        this.vtbl.get_media := CallbackCreate(GetMethod(implObj, "get_media"), flags, 2)
        this.vtbl.put_cssText := CallbackCreate(GetMethod(implObj, "put_cssText"), flags, 2)
        this.vtbl.get_cssText := CallbackCreate(GetMethod(implObj, "get_cssText"), flags, 2)
        this.vtbl.get_rules := CallbackCreate(GetMethod(implObj, "get_rules"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_title)
        CallbackFree(this.vtbl.get_title)
        CallbackFree(this.vtbl.get_parentStyleSheet)
        CallbackFree(this.vtbl.get_owningElement)
        CallbackFree(this.vtbl.put_disabled)
        CallbackFree(this.vtbl.get_disabled)
        CallbackFree(this.vtbl.get_readOnly)
        CallbackFree(this.vtbl.get_imports)
        CallbackFree(this.vtbl.put_href)
        CallbackFree(this.vtbl.get_href)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_id)
        CallbackFree(this.vtbl.addImport)
        CallbackFree(this.vtbl.addRule)
        CallbackFree(this.vtbl.removeImport)
        CallbackFree(this.vtbl.removeRule)
        CallbackFree(this.vtbl.put_media)
        CallbackFree(this.vtbl.get_media)
        CallbackFree(this.vtbl.put_cssText)
        CallbackFree(this.vtbl.get_cssText)
        CallbackFree(this.vtbl.get_rules)
    }
}
