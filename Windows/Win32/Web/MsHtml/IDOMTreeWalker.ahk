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
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_root(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_whatToShow(p) {
        pMarshal := p is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pMarshal, p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_filter(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} p 
     * @returns {HRESULT} 
     */
    get_expandEntityReferences(p) {
        result := ComCall(10, this, "ptr", p, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} p 
     * @returns {HRESULT} 
     */
    get_currentNode(p) {
        result := ComCall(12, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    parentNode(ppRetNode) {
        result := ComCall(13, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    firstChild(ppRetNode) {
        result := ComCall(14, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    lastChild(ppRetNode) {
        result := ComCall(15, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    previousSibling(ppRetNode) {
        result := ComCall(16, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    nextSibling(ppRetNode) {
        result := ComCall(17, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    previousNode(ppRetNode) {
        result := ComCall(18, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    nextNode(ppRetNode) {
        result := ComCall(19, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }
}
