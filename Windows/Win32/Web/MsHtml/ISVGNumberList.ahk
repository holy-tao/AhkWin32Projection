#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISVGNumber.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGNumberList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGNumberList
     * @type {Guid}
     */
    static IID => Guid("{305104cd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGNumberList
     * @type {Guid}
     */
    static CLSID => Guid("{30510589-98b5-11cf-bb82-00aa00bdce0b}")

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
     * @param {ISVGNumber} newItem 
     * @returns {ISVGNumber} 
     */
    initialize(newItem) {
        result := ComCall(10, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGNumber(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGNumber} 
     */
    getItem(index) {
        result := ComCall(11, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGNumber(ppResult)
    }

    /**
     * 
     * @param {ISVGNumber} newItem 
     * @param {Integer} index 
     * @returns {ISVGNumber} 
     */
    insertItemBefore(newItem, index) {
        result := ComCall(12, this, "ptr", newItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGNumber(ppResult)
    }

    /**
     * 
     * @param {ISVGNumber} newItem 
     * @param {Integer} index 
     * @returns {ISVGNumber} 
     */
    replaceItem(newItem, index) {
        result := ComCall(13, this, "ptr", newItem, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGNumber(ppResult)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISVGNumber} 
     */
    removeItem(index) {
        result := ComCall(14, this, "int", index, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGNumber(ppResult)
    }

    /**
     * 
     * @param {ISVGNumber} newItem 
     * @returns {ISVGNumber} 
     */
    appendItem(newItem) {
        result := ComCall(15, this, "ptr", newItem, "ptr*", &ppResult := 0, "HRESULT")
        return ISVGNumber(ppResult)
    }
}
