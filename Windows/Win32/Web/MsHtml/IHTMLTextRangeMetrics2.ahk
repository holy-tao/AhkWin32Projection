#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTextRangeMetrics2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTextRangeMetrics2
     * @type {Guid}
     */
    static IID => Guid("{3050f4a6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getClientRects", "getBoundingClientRect"]

    /**
     * 
     * @param {Pointer<IHTMLRectCollection>} pRectCol 
     * @returns {HRESULT} 
     */
    getClientRects(pRectCol) {
        result := ComCall(7, this, "ptr*", pRectCol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRect>} pRect 
     * @returns {HRESULT} 
     */
    getBoundingClientRect(pRect) {
        result := ComCall(8, this, "ptr*", pRect, "HRESULT")
        return result
    }
}
