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
     * @returns {IDispatch} 
     */
    nextNode() {
        result := ComCall(11, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    previousNode() {
        result := ComCall(12, this, "ptr*", &ppRetNode := 0, "HRESULT")
        return IDispatch(ppRetNode)
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
