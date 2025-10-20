#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLTable4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLTable4
     * @type {Guid}
     */
    static IID => Guid("{305106c2-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["putref_tHead", "get_tHead", "putref_tFoot", "get_tFoot", "putref_caption", "get_caption", "insertRow", "deleteRow", "createTBody"]

    /**
     * 
     * @param {IHTMLTableSection} v 
     * @returns {HRESULT} 
     */
    putref_tHead(v) {
        result := ComCall(7, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableSection>} p 
     * @returns {HRESULT} 
     */
    get_tHead(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLTableSection} v 
     * @returns {HRESULT} 
     */
    putref_tFoot(v) {
        result := ComCall(9, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableSection>} p 
     * @returns {HRESULT} 
     */
    get_tFoot(p) {
        result := ComCall(10, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLTableCaption} v 
     * @returns {HRESULT} 
     */
    putref_caption(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableCaption>} p 
     * @returns {HRESULT} 
     */
    get_caption(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDispatch>} row 
     * @returns {HRESULT} 
     */
    insertRow(index, row) {
        result := ComCall(13, this, "int", index, "ptr*", row, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    deleteRow(index) {
        result := ComCall(14, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLTableSection>} tbody 
     * @returns {HRESULT} 
     */
    createTBody(tbody) {
        result := ComCall(15, this, "ptr*", tbody, "HRESULT")
        return result
    }
}
