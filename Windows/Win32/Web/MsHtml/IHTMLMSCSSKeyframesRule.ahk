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
    get_name() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesCollection} 
     */
    get_cssRules() {
        result := ComCall(9, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLStyleSheetRulesCollection(p)
    }

    /**
     * 
     * @param {BSTR} bstrRule 
     * @returns {HRESULT} 
     */
    appendRule(bstrRule) {
        if(bstrRule is String) {
            pin := BSTR.Alloc(bstrRule)
            bstrRule := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrRule, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    deleteRule(bstrKey) {
        if(bstrKey is String) {
            pin := BSTR.Alloc(bstrKey)
            bstrKey := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {IHTMLMSCSSKeyframeRule} 
     */
    findRule(bstrKey) {
        if(bstrKey is String) {
            pin := BSTR.Alloc(bstrKey)
            bstrKey := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrKey, "ptr*", &ppMSKeyframeRule := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLMSCSSKeyframeRule(ppMSKeyframeRule)
    }
}
