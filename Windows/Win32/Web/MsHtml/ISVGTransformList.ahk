#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGTransform.ahk
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
     * @type {Integer} 
     */
    numberOfItems {
        get => this.get_numberOfItems()
        set => this.put_numberOfItems(value)
    }

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
     * @returns {Integer} 
     */
    get_numberOfItems() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
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
     * @returns {ISVGTransform} 
     */
    initialize(newItem) {
        result := ComCall(10, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGTransform} 
     */
    getItem(index) {
        result := ComCall(11, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @param {Integer} index 
     * @returns {ISVGTransform} 
     */
    insertItemBefore(newItem, index) {
        result := ComCall(12, this, "ptr", newItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @param {Integer} index 
     * @returns {ISVGTransform} 
     */
    replaceItem(newItem, index) {
        result := ComCall(13, this, "ptr", newItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGTransform} 
     */
    removeItem(index) {
        result := ComCall(14, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @param {ISVGTransform} newItem 
     * @returns {ISVGTransform} 
     */
    appendItem(newItem) {
        result := ComCall(15, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @param {ISVGMatrix} newItem 
     * @returns {ISVGTransform} 
     */
    createSVGTransformFromMatrix(newItem) {
        result := ComCall(16, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }

    /**
     * 
     * @returns {ISVGTransform} 
     */
    consolidate() {
        result := ComCall(17, this, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGTransform(ppResult)
    }
}
