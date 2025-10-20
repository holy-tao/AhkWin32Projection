#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMNodeIterator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDOMNodeIterator
     * @type {Guid}
     */
    static IID => Guid("{30510746-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_root", "get_whatToShow", "get_filter", "get_expandEntityReferences", "nextNode", "previousNode", "detach"]

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
        result := ComCall(8, this, "uint*", p, "HRESULT")
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
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    nextNode(ppRetNode) {
        result := ComCall(11, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppRetNode 
     * @returns {HRESULT} 
     */
    previousNode(ppRetNode) {
        result := ComCall(12, this, "ptr*", ppRetNode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    detach() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
