#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMTreeWalker extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMTreeWalker
     * @type {Guid}
     */
    static IID => Guid("{30510748-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_root", "get_whatToShow", "get_filter", "get_expandEntityReferences", "putref_currentNode", "get_currentNode", "parentNode", "firstChild", "lastChild", "previousSibling", "nextSibling", "previousNode", "nextNode"]

    /**
     * @type {IDispatch} 
     */
    root {
        get => this.get_root()
    }

    /**
     * @type {Integer} 
     */
    whatToShow {
        get => this.get_whatToShow()
    }

    /**
     * @type {IDispatch} 
     */
    filter {
        get => this.get_filter()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    expandEntityReferences {
        get => this.get_expandEntityReferences()
    }

    /**
     * @type {IDispatch} 
     */
    currentNode {
        get => this.get_currentNode()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_root() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_whatToShow() {
        result := ComCall(8, this, "uint*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_filter() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_expandEntityReferences() {
        result := ComCall(10, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {IDispatch} v 
     * @returns {HRESULT} 
     */
    putref_currentNode(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_currentNode() {
        result := ComCall(12, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    parentNode() {
        result := ComCall(13, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    firstChild() {
        result := ComCall(14, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    lastChild() {
        result := ComCall(15, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    previousSibling() {
        result := ComCall(16, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    nextSibling() {
        result := ComCall(17, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    previousNode() {
        result := ComCall(18, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    nextNode() {
        result := ComCall(19, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }
}
