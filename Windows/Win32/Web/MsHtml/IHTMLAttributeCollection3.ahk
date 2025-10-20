#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAttributeCollection3 extends IDispatch{
    /**
     * The interface identifier for IHTMLAttributeCollection3
     * @type {Guid}
     */
    static IID => Guid("{30510469-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IHTMLDOMAttribute>} ppNodeOut 
     * @returns {HRESULT} 
     */
    getNamedItem(bstrName, ppNodeOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "ptr", ppNodeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDOMAttribute>} pNodeIn 
     * @param {Pointer<IHTMLDOMAttribute>} ppNodeOut 
     * @returns {HRESULT} 
     */
    setNamedItem(pNodeIn, ppNodeOut) {
        result := ComCall(8, this, "ptr", pNodeIn, "ptr", ppNodeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IHTMLDOMAttribute>} ppNodeOut 
     * @returns {HRESULT} 
     */
    removeNamedItem(bstrName, ppNodeOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr", ppNodeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IHTMLDOMAttribute>} ppNodeOut 
     * @returns {HRESULT} 
     */
    item(index, ppNodeOut) {
        result := ComCall(10, this, "int", index, "ptr", ppNodeOut, "int")
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
        result := ComCall(11, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
