#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLStyleSheetRulesCollection.ahk
#Include .\IHTMLMSCSSKeyframeRule.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMSCSSKeyframesRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLMSCSSKeyframesRule
     * @type {Guid}
     */
    static IID => Guid("{3051080d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMSCSSKeyframesRule
     * @type {Guid}
     */
    static CLSID => Guid("{3051080f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_name", "get_name", "get_cssRules", "appendRule", "deleteRule", "findRule"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
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

        result := ComCall(10, this, "ptr", bstrRule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    deleteRule(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(11, this, "ptr", bstrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {IHTMLMSCSSKeyframeRule} 
     */
    findRule(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(12, this, "ptr", bstrKey, "ptr*", &ppMSKeyframeRule := 0, "HRESULT")
        return IHTMLMSCSSKeyframeRule(ppMSKeyframeRule)
    }
}
