#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMRange extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMRange
     * @type {Guid}
     */
    static IID => Guid("{305104ae-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMRange
     * @type {Guid}
     */
    static CLSID => Guid("{305106c3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_startContainer", "get_startOffset", "get_endContainer", "get_endOffset", "get_collapsed", "get_commonAncestorContainer", "setStart", "setEnd", "setStartBefore", "setStartAfter", "setEndBefore", "setEndAfter", "collapse", "selectNode", "selectNodeContents", "compareBoundaryPoints", "deleteContents", "extractContents", "cloneContents", "insertNode", "surroundContents", "cloneRange", "toString", "detach", "getClientRects", "getBoundingClientRect"]

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_startContainer(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_startOffset(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_endContainer(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_endOffset(p) {
        pMarshal := p is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_collapsed(p) {
        result := ComCall(11, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_commonAncestorContainer(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     */
    setStart(refNode, offset) {
        result := ComCall(13, this, "ptr", refNode, "int", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     */
    setEnd(refNode, offset) {
        result := ComCall(14, this, "ptr", refNode, "int", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setStartBefore(refNode) {
        result := ComCall(15, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setStartAfter(refNode) {
        result := ComCall(16, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setEndBefore(refNode) {
        result := ComCall(17, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    setEndAfter(refNode) {
        result := ComCall(18, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} toStart 
     * @returns {HRESULT} 
     */
    collapse(toStart) {
        result := ComCall(19, this, "short", toStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    selectNode(refNode) {
        result := ComCall(20, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} refNode 
     * @returns {HRESULT} 
     */
    selectNodeContents(refNode) {
        result := ComCall(21, this, "ptr", refNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} how 
     * @param {IDispatch} sourceRange 
     * @param {Pointer<Integer>} compareResult 
     * @returns {HRESULT} 
     */
    compareBoundaryPoints(how, sourceRange, compareResult) {
        compareResultMarshal := compareResult is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "short", how, "ptr", sourceRange, compareResultMarshal, compareResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteContents() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDocumentFragment 
     * @returns {HRESULT} 
     */
    extractContents(ppDocumentFragment) {
        result := ComCall(24, this, "ptr*", ppDocumentFragment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDocumentFragment 
     * @returns {HRESULT} 
     */
    cloneContents(ppDocumentFragment) {
        result := ComCall(25, this, "ptr*", ppDocumentFragment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} newNode 
     * @returns {HRESULT} 
     */
    insertNode(newNode) {
        result := ComCall(26, this, "ptr", newNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} newParent 
     * @returns {HRESULT} 
     */
    surroundContents(newParent) {
        result := ComCall(27, this, "ptr", newParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMRange>} ppClonedRange 
     * @returns {HRESULT} 
     */
    cloneRange(ppClonedRange) {
        result := ComCall(28, this, "ptr*", ppClonedRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRangeString 
     * @returns {HRESULT} 
     */
    toString(pRangeString) {
        result := ComCall(29, this, "ptr", pRangeString, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detach() {
        result := ComCall(30, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRectCollection>} ppRectCol 
     * @returns {HRESULT} 
     */
    getClientRects(ppRectCol) {
        result := ComCall(31, this, "ptr*", ppRectCol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRect>} ppRect 
     * @returns {HRESULT} 
     */
    getBoundingClientRect(ppRect) {
        result := ComCall(32, this, "ptr*", ppRect, "HRESULT")
        return result
    }
}
