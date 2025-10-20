#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStyleSheet2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStyleSheet2
     * @type {Guid}
     */
    static IID => Guid("{3050f3d1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_pages", "addPageRule"]

    /**
     * 
     * @param {Pointer<IHTMLStyleSheetPagesCollection>} p 
     * @returns {HRESULT} 
     */
    get_pages(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSelector 
     * @param {BSTR} bstrStyle 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} plNewIndex 
     * @returns {HRESULT} 
     */
    addPageRule(bstrSelector, bstrStyle, lIndex, plNewIndex) {
        bstrSelector := bstrSelector is String ? BSTR.Alloc(bstrSelector).Value : bstrSelector
        bstrStyle := bstrStyle is String ? BSTR.Alloc(bstrStyle).Value : bstrStyle

        result := ComCall(8, this, "ptr", bstrSelector, "ptr", bstrStyle, "int", lIndex, "int*", plNewIndex, "HRESULT")
        return result
    }
}
