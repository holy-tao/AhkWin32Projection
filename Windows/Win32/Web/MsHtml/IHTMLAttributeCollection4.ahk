#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDOMAttribute2.ahk
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
     * @returns {IHTMLDOMAttribute2} 
     */
    getNamedItemNS(pvarNS, bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", pvarNS, "ptr", bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pNodeIn 
     * @returns {IHTMLDOMAttribute2} 
     */
    setNamedItemNS(pNodeIn) {
        result := ComCall(8, this, "ptr", pNodeIn, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarNS 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeNamedItemNS(pvarNS, bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", pvarNS, "ptr", bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    getNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pNodeIn 
     * @returns {IHTMLDOMAttribute2} 
     */
    setNamedItem(pNodeIn) {
        result := ComCall(11, this, "ptr", pNodeIn, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeNamedItem(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "ptr", bstrName, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLDOMAttribute2} 
     */
    item(index) {
        result := ComCall(13, this, "int", index, "ptr*", &ppNodeOut := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppNodeOut)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(14, this, "int*", &p := 0, "HRESULT")
        return p
    }
}
