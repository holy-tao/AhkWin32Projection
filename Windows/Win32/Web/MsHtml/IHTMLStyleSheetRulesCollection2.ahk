#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheetRulesCollection2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheetRulesCollection2
     * @type {Guid}
     */
    static IID => Guid("{305106e8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "item"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IHTMLCSSRule>} ppHTMLCSSRule 
     * @returns {HRESULT} 
     */
    item(index, ppHTMLCSSRule) {
        result := ComCall(8, this, "int", index, "ptr*", ppHTMLCSSRule, "HRESULT")
        return result
    }
}
