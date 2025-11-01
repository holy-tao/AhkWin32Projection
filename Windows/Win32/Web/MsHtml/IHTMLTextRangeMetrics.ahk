#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTextRangeMetrics extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTextRangeMetrics
     * @type {Guid}
     */
    static IID => Guid("{3050f40b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_offsetTop", "get_offsetLeft", "get_boundingTop", "get_boundingLeft", "get_boundingWidth", "get_boundingHeight"]

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_offsetTop(p) {
        result := ComCall(7, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_offsetLeft(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_boundingTop(p) {
        result := ComCall(9, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_boundingLeft(p) {
        result := ComCall(10, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_boundingWidth(p) {
        result := ComCall(11, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_boundingHeight(p) {
        result := ComCall(12, this, "int*", p, "HRESULT")
        return result
    }
}
