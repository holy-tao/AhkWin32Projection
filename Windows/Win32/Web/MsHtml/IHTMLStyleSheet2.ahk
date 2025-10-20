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
     * 
     * @param {Pointer<IHTMLStyleSheetPagesCollection>} p 
     * @returns {HRESULT} 
     */
    get_pages(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSelector 
     * @param {BSTR} bstrStyle 
     * @param {Integer} lIndex 
     * @param {Pointer<Int32>} plNewIndex 
     * @returns {HRESULT} 
     */
    addPageRule(bstrSelector, bstrStyle, lIndex, plNewIndex) {
        bstrSelector := bstrSelector is String ? BSTR.Alloc(bstrSelector).Value : bstrSelector
        bstrStyle := bstrStyle is String ? BSTR.Alloc(bstrStyle).Value : bstrStyle

        result := ComCall(8, this, "ptr", bstrSelector, "ptr", bstrStyle, "int", lIndex, "int*", plNewIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
