#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGStringList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGStringList
     * @type {Guid}
     */
    static IID => Guid("{305104c8-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGStringList
     * @type {Guid}
     */
    static CLSID => Guid("{3051058d-98b5-11cf-bb82-00aa00bdce0b}")

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
     * @param {BSTR} newItem 
     * @returns {BSTR} 
     */
    initialize(newItem) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR()
        result := ComCall(10, this, "ptr", newItem, "ptr", ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    getItem(index) {
        ppResult := BSTR()
        result := ComCall(11, this, "int", index, "ptr", ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    insertItemBefore(newItem, index) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR()
        result := ComCall(12, this, "ptr", newItem, "int", index, "ptr", ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    replaceItem(newItem, index) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR()
        result := ComCall(13, this, "ptr", newItem, "int", index, "ptr", ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    removeItem(index) {
        ppResult := BSTR()
        result := ComCall(14, this, "int", index, "ptr", ppResult, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {BSTR} newItem 
     * @returns {BSTR} 
     */
    appendItem(newItem) {
        newItem := newItem is String ? BSTR.Alloc(newItem).Value : newItem

        ppResult := BSTR()
        result := ComCall(15, this, "ptr", newItem, "ptr", ppResult, "HRESULT")
        return ppResult
    }
}
