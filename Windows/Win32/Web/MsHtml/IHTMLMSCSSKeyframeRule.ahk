#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLRuleStyle.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMSCSSKeyframeRule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLMSCSSKeyframeRule
     * @type {Guid}
     */
    static IID => Guid("{3051080c-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMSCSSKeyframeRule
     * @type {Guid}
     */
    static CLSID => Guid("{3051080e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_keyText", "get_keyText", "get_style"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_keyText(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_keyText() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "HRESULT")
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
}
