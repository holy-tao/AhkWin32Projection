#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheetRuleApplied extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheetRuleApplied
     * @type {Guid}
     */
    static IID => Guid("{305104c1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_msSpecificity", "msGetSpecificity"]

    /**
     * @type {Integer} 
     */
    msSpecificity {
        get => this.get_msSpecificity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_msSpecificity() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Integer} 
     */
    msGetSpecificity(index) {
        result := ComCall(8, this, "int", index, "int*", &p := 0, "HRESULT")
        return p
    }
}
