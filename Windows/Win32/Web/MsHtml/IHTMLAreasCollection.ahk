#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAreasCollection extends IDispatch{
    /**
     * The interface identifier for IHTMLAreasCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f383-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAreasCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4ca-98b5-11cf-bb82-00aa00bdce0b}")

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
    put_length(v) {
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
    get_length(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} p 
     * @returns {HRESULT} 
     */
    get__newEnum(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    item(name, index, pdisp) {
        result := ComCall(10, this, "ptr", name, "ptr", index, "ptr", pdisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @param {Pointer<IDispatch>} pdisp 
     * @returns {HRESULT} 
     */
    tags(tagName, pdisp) {
        result := ComCall(11, this, "ptr", tagName, "ptr", pdisp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} element 
     * @param {VARIANT} before 
     * @returns {HRESULT} 
     */
    add(element, before) {
        result := ComCall(12, this, "ptr", element, "ptr", before, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    remove(index) {
        result := ComCall(13, this, "int", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
