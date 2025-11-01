#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTransformList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGTransformList
     * @type {Guid}
     */
    static IID => Guid("{305104f8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGTransformList
     * @type {Guid}
     */
    static CLSID => Guid("{305105b0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_numberOfItems", "get_numberOfItems", "clear", "initialize", "getItem", "insertItemBefore", "replaceItem", "removeItem", "appendItem", "createSVGTransformFromMatrix", "consolidate"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_numberOfItems(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_numberOfItems(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    initialize(newItem, ppResult) {
        result := ComCall(10, this, "ptr", newItem, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    getItem(index, ppResult) {
        result := ComCall(11, this, "int", index, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @param {Integer} index 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    insertItemBefore(newItem, index, ppResult) {
        result := ComCall(12, this, "ptr", newItem, "int", index, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @param {Integer} index 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    replaceItem(newItem, index, ppResult) {
        result := ComCall(13, this, "ptr", newItem, "int", index, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    removeItem(index, ppResult) {
        result := ComCall(14, this, "int", index, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    appendItem(newItem, ppResult) {
        result := ComCall(15, this, "ptr", newItem, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISVGMatrix} newItem 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    createSVGTransformFromMatrix(newItem, ppResult) {
        result := ComCall(16, this, "ptr", newItem, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGTransform>} ppResult 
     * @returns {HRESULT} 
     */
    consolidate(ppResult) {
        result := ComCall(17, this, "ptr*", ppResult, "HRESULT")
        return result
    }
}
