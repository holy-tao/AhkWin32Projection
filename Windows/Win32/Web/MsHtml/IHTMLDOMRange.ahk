#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLDOMNode.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IHTMLDOMRange.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLRectCollection.ahk
#Include .\IHTMLRect.ahk

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
     * @type {IHTMLDOMNode} 
     */
    startContainer {
        get => this.get_startContainer()
    }

    /**
     * @type {Integer} 
     */
    startOffset {
        get => this.get_startOffset()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    endContainer {
        get => this.get_endContainer()
    }

    /**
     * @type {Integer} 
     */
    endOffset {
        get => this.get_endOffset()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    collapsed {
        get => this.get_collapsed()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    commonAncestorContainer {
        get => this.get_commonAncestorContainer()
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_startContainer() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_startOffset() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_endContainer() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_endOffset() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_collapsed() {
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_commonAncestorContainer() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
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
     * @returns {Integer} 
     */
    compareBoundaryPoints(how, sourceRange) {
        result := ComCall(22, this, "short", how, "ptr", sourceRange, "int*", &compareResult := 0, "HRESULT")
        return compareResult
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
     * @returns {IDispatch} 
     */
    extractContents() {
        result := ComCall(24, this, "ptr*", &ppDocumentFragment := 0, "HRESULT")
        return IDispatch(ppDocumentFragment)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    cloneContents() {
        result := ComCall(25, this, "ptr*", &ppDocumentFragment := 0, "HRESULT")
        return IDispatch(ppDocumentFragment)
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
     * @returns {IHTMLDOMRange} 
     */
    cloneRange() {
        result := ComCall(28, this, "ptr*", &ppClonedRange := 0, "HRESULT")
        return IHTMLDOMRange(ppClonedRange)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    toString() {
        pRangeString := BSTR()
        result := ComCall(29, this, "ptr", pRangeString, "HRESULT")
        return pRangeString
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
     * @returns {IHTMLRectCollection} 
     */
    getClientRects() {
        result := ComCall(31, this, "ptr*", &ppRectCol := 0, "HRESULT")
        return IHTMLRectCollection(ppRectCol)
    }

    /**
     * 
     * @returns {IHTMLRect} 
     */
    getBoundingClientRect() {
        result := ComCall(32, this, "ptr*", &ppRect := 0, "HRESULT")
        return IHTMLRect(ppRect)
    }
}
