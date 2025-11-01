#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSelection
     * @type {Guid}
     */
    static IID => Guid("{305104b6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_anchorNode", "get_anchorOffset", "get_focusNode", "get_focusOffset", "get_isCollapsed", "collapse", "collapseToStart", "collapseToEnd", "selectAllChildren", "deleteFromDocument", "get_rangeCount", "getRangeAt", "addRange", "removeRange", "removeAllRanges", "toString"]

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_anchorNode(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_anchorOffset(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_focusNode(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_focusOffset(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_isCollapsed(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} parentNode 
     * @param {Integer} offfset 
     * @returns {HRESULT} 
     */
    collapse(parentNode, offfset) {
        result := ComCall(12, this, "ptr", parentNode, "int", offfset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    collapseToStart() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    collapseToEnd() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} parentNode 
     * @returns {HRESULT} 
     */
    selectAllChildren(parentNode) {
        result := ComCall(15, this, "ptr", parentNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteFromDocument() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_rangeCount(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IHTMLDOMRange>} ppRange 
     * @returns {HRESULT} 
     */
    getRangeAt(index, ppRange) {
        result := ComCall(18, this, "int", index, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} range 
     * @returns {HRESULT} 
     */
    addRange(range) {
        result := ComCall(19, this, "ptr", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} range 
     * @returns {HRESULT} 
     */
    removeRange(range) {
        result := ComCall(20, this, "ptr", range, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    removeAllRanges() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSelectionString 
     * @returns {HRESULT} 
     */
    toString(pSelectionString) {
        result := ComCall(22, this, "ptr", pSelectionString, "HRESULT")
        return result
    }
}
