#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGPoint.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPointList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGPointList
     * @type {Guid}
     */
    static IID => Guid("{305104f5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPointList
     * @type {Guid}
     */
    static CLSID => Guid("{305105b9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_numberOfItems", "get_numberOfItems", "clear", "initialize", "getItem", "insertItemBefore", "replaceItem", "removeItem", "appendItem"]

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
     * @param {ISVGPoint} pNewItem 
     * @returns {ISVGPoint} 
     */
    initialize(pNewItem) {
        result := ComCall(10, this, "ptr", pNewItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGPoint} 
     */
    getItem(index) {
        result := ComCall(11, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {ISVGPoint} pNewItem 
     * @param {Integer} index 
     * @returns {ISVGPoint} 
     */
    insertItemBefore(pNewItem, index) {
        result := ComCall(12, this, "ptr", pNewItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {ISVGPoint} pNewItem 
     * @param {Integer} index 
     * @returns {ISVGPoint} 
     */
    replaceItem(pNewItem, index) {
        result := ComCall(13, this, "ptr", pNewItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGPoint} 
     */
    removeItem(index) {
        result := ComCall(14, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }

    /**
     * 
     * @param {ISVGPoint} pNewItem 
     * @returns {ISVGPoint} 
     */
    appendItem(pNewItem) {
        result := ComCall(15, this, "ptr", pNewItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGPoint(ppResult)
    }
}
