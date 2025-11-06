#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLDOMNode.ahk
#Include .\IHTMLDOMRange.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {IHTMLDOMNode} 
     */
    get_anchorNode() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_anchorOffset() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_focusNode() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_focusOffset() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isCollapsed() {
        result := ComCall(11, this, "short*", &p := 0, "HRESULT")
        return p
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
     * @returns {Integer} 
     */
    get_rangeCount() {
        result := ComCall(17, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLDOMRange} 
     */
    getRangeAt(index) {
        result := ComCall(18, this, "int", index, "ptr*", &ppRange := 0, "HRESULT")
        return IHTMLDOMRange(ppRange)
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
     * @returns {BSTR} 
     */
    toString() {
        pSelectionString := BSTR()
        result := ComCall(22, this, "ptr", pSelectionString, "HRESULT")
        return pSelectionString
    }
}
