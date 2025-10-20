#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPointList extends IDispatch{
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
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_numberOfItems(v) {
        result := ComCall(7, this, "int", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_numberOfItems(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} pNewItem 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    initialize(pNewItem, ppResult) {
        result := ComCall(10, this, "ptr", pNewItem, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    getItem(index, ppResult) {
        result := ComCall(11, this, "int", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} pNewItem 
     * @param {Integer} index 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    insertItemBefore(pNewItem, index, ppResult) {
        result := ComCall(12, this, "ptr", pNewItem, "int", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} pNewItem 
     * @param {Integer} index 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    replaceItem(pNewItem, index, ppResult) {
        result := ComCall(13, this, "ptr", pNewItem, "int", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    removeItem(index, ppResult) {
        result := ComCall(14, this, "int", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPoint>} pNewItem 
     * @param {Pointer<ISVGPoint>} ppResult 
     * @returns {HRESULT} 
     */
    appendItem(pNewItem, ppResult) {
        result := ComCall(15, this, "ptr", pNewItem, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
