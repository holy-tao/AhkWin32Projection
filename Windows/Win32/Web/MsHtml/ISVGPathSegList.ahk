#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGPathSegList extends IDispatch{
    /**
     * The interface identifier for ISVGPathSegList
     * @type {Guid}
     */
    static IID => Guid("{30510510-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGPathSegList
     * @type {Guid}
     */
    static CLSID => Guid("{305105b4-98b5-11cf-bb82-00aa00bdce0b}")

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
     * @param {Pointer<ISVGPathSeg>} newItem 
     * @param {Pointer<ISVGPathSeg>} ppResult 
     * @returns {HRESULT} 
     */
    initialize(newItem, ppResult) {
        result := ComCall(10, this, "ptr", newItem, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGPathSeg>} ppResult 
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
     * @param {Pointer<ISVGPathSeg>} newItem 
     * @param {Integer} index 
     * @param {Pointer<ISVGPathSeg>} ppResult 
     * @returns {HRESULT} 
     */
    insertItemBefore(newItem, index, ppResult) {
        result := ComCall(12, this, "ptr", newItem, "int", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISVGPathSeg>} newItem 
     * @param {Integer} index 
     * @param {Pointer<ISVGPathSeg>} ppResult 
     * @returns {HRESULT} 
     */
    replaceItem(newItem, index, ppResult) {
        result := ComCall(13, this, "ptr", newItem, "int", index, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISVGPathSeg>} ppResult 
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
     * @param {Pointer<ISVGPathSeg>} newItem 
     * @param {Pointer<ISVGPathSeg>} ppResult 
     * @returns {HRESULT} 
     */
    appendItem(newItem, ppResult) {
        result := ComCall(15, this, "ptr", newItem, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
