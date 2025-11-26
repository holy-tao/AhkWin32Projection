#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLCSSRule.ahk
#Include .\IHTMLStyleSheet.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCSSRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCSSRule
     * @type {Guid}
     */
    static IID => Guid("{305106e9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCSSRule
     * @type {Guid}
     */
    static CLSID => Guid("{305106ef-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "put_cssText", "get_cssText", "get_parentRule", "get_parentStyleSheet"]

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

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_cssText() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
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
}
