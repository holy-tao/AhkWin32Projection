#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMRange extends IDispatch{
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
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_startContainer(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_startOffset(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_endContainer(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_endOffset(p) {
        result := ComCall(10, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_collapsed(p) {
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMNode>} p 
     * @returns {HRESULT} 
     */
    get_commonAncestorContainer(p) {
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     */
    setStart(refNode, offset) {
        result := ComCall(13, this, "ptr", refNode, "int", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @param {Integer} offset 
     * @returns {HRESULT} 
     */
    setEnd(refNode, offset) {
        result := ComCall(14, this, "ptr", refNode, "int", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @returns {HRESULT} 
     */
    setStartBefore(refNode) {
        result := ComCall(15, this, "ptr", refNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @returns {HRESULT} 
     */
    setStartAfter(refNode) {
        result := ComCall(16, this, "ptr", refNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @returns {HRESULT} 
     */
    setEndBefore(refNode) {
        result := ComCall(17, this, "ptr", refNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @returns {HRESULT} 
     */
    setEndAfter(refNode) {
        result := ComCall(18, this, "ptr", refNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} toStart 
     * @returns {HRESULT} 
     */
    collapse(toStart) {
        result := ComCall(19, this, "short", toStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @returns {HRESULT} 
     */
    selectNode(refNode) {
        result := ComCall(20, this, "ptr", refNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} refNode 
     * @returns {HRESULT} 
     */
    selectNodeContents(refNode) {
        result := ComCall(21, this, "ptr", refNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} how 
     * @param {Pointer<IDispatch>} sourceRange 
     * @param {Pointer<Int32>} compareResult 
     * @returns {HRESULT} 
     */
    compareBoundaryPoints(how, sourceRange, compareResult) {
        result := ComCall(22, this, "short", how, "ptr", sourceRange, "int*", compareResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteContents() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDocumentFragment 
     * @returns {HRESULT} 
     */
    extractContents(ppDocumentFragment) {
        result := ComCall(24, this, "ptr", ppDocumentFragment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDocumentFragment 
     * @returns {HRESULT} 
     */
    cloneContents(ppDocumentFragment) {
        result := ComCall(25, this, "ptr", ppDocumentFragment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} newNode 
     * @returns {HRESULT} 
     */
    insertNode(newNode) {
        result := ComCall(26, this, "ptr", newNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} newParent 
     * @returns {HRESULT} 
     */
    surroundContents(newParent) {
        result := ComCall(27, this, "ptr", newParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMRange>} ppClonedRange 
     * @returns {HRESULT} 
     */
    cloneRange(ppClonedRange) {
        result := ComCall(28, this, "ptr", ppClonedRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRangeString 
     * @returns {HRESULT} 
     */
    toString(pRangeString) {
        result := ComCall(29, this, "ptr", pRangeString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detach() {
        result := ComCall(30, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRectCollection>} ppRectCol 
     * @returns {HRESULT} 
     */
    getClientRects(ppRectCol) {
        result := ComCall(31, this, "ptr", ppRectCol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLRect>} ppRect 
     * @returns {HRESULT} 
     */
    getBoundingClientRect(ppRect) {
        result := ComCall(32, this, "ptr", ppRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
