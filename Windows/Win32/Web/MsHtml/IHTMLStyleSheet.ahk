#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLStyleSheet.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLStyleSheetsCollection.ahk
#Include .\IHTMLStyleSheetRulesCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheet
     * @type {Guid}
     */
    static IID => Guid("{3050f2e3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheet
     * @type {Guid}
     */
    static CLSID => Guid("{3050f2e4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_title", "get_title", "get_parentStyleSheet", "get_owningElement", "put_disabled", "get_disabled", "get_readOnly", "get_imports", "put_href", "get_href", "get_type", "get_id", "addImport", "addRule", "removeImport", "removeRule", "put_media", "get_media", "put_cssText", "get_cssText", "get_rules"]

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
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_title() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheet} 
     */
    get_parentStyleSheet() {
        result := ComCall(9, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheet(p)
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_owningElement() {
        result := ComCall(10, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(p)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_disabled(v) {
        result := ComCall(11, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disabled() {
        result := ComCall(12, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_readOnly() {
        result := ComCall(13, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetsCollection} 
     */
    get_imports() {
        result := ComCall(14, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheetsCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_href(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(15, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_href() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(17, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_id() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    addImport(bstrURL, lIndex) {
        if(bstrURL is String) {
            pin := BSTR.Alloc(bstrURL)
            bstrURL := pin.Value
        }

        result := ComCall(19, this, "ptr", bstrURL, "int", lIndex, "int*", &plIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(bstrSelector is String) {
            pin := BSTR.Alloc(bstrSelector)
            bstrSelector := pin.Value
        }
        if(bstrStyle is String) {
            pin := BSTR.Alloc(bstrStyle)
            bstrStyle := pin.Value
        }

        result := ComCall(20, this, "ptr", bstrSelector, "ptr", bstrStyle, "int", lIndex, "int*", &plNewIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plNewIndex
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    removeImport(lIndex) {
        result := ComCall(21, this, "int", lIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    removeRule(lIndex) {
        result := ComCall(22, this, "int", lIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_media(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(23, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_media() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_cssText(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(25, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesCollection} 
     */
    get_rules() {
        result := ComCall(27, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheetRulesCollection(p)
    }
}
