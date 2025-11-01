#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAttributeCollection4 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAttributeCollection4
     * @type {Guid}
     */
    static IID => Guid("{305106fa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getNamedItemNS", "setNamedItemNS", "removeNamedItemNS", "getNamedItem", "setNamedItem", "removeNamedItem", "item", "get_length"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrName 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    getNamedItemNS(pvarNS, bstrName, ppNodeOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", pvarNS, "ptr", bstrName, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pNodeIn 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    setNamedItemNS(pNodeIn, ppNodeOut) {
        result := ComCall(8, this, "ptr", pNodeIn, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrName 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    removeNamedItemNS(pvarNS, bstrName, ppNodeOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", pvarNS, "ptr", bstrName, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    getNamedItem(bstrName, ppNodeOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pNodeIn 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    setNamedItem(pNodeIn, ppNodeOut) {
        result := ComCall(11, this, "ptr", pNodeIn, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    removeNamedItem(bstrName, ppNodeOut) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "ptr", bstrName, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IHTMLDOMAttribute2>} ppNodeOut 
     * @returns {HRESULT} 
     */
    item(index, ppNodeOut) {
        result := ComCall(13, this, "int", index, "ptr*", ppNodeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(14, this, "int*", p, "HRESULT")
        return result
    }
}
