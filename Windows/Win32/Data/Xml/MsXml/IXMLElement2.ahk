#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLElement2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLElement2
     * @type {Guid}
     */
    static IID => Guid("{2b8de2ff-8d2d-11d1-b2fc-00c04fd915a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_tagName", "put_tagName", "get_parent", "setAttribute", "getAttribute", "removeAttribute", "get_children", "get_type", "get_text", "put_text", "addChild", "removeChild", "get_attributes"]

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_tagName(p) {
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_tagName(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(8, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLElement2>} ppParent 
     * @returns {HRESULT} 
     */
    get_parent(ppParent) {
        result := ComCall(9, this, "ptr*", ppParent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {VARIANT} PropertyValue 
     * @returns {HRESULT} 
     */
    setAttribute(strPropertyName, PropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(10, this, "ptr", strPropertyName, "ptr", PropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @param {Pointer<VARIANT>} PropertyValue 
     * @returns {HRESULT} 
     */
    getAttribute(strPropertyName, PropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(11, this, "ptr", strPropertyName, "ptr", PropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPropertyName 
     * @returns {HRESULT} 
     */
    removeAttribute(strPropertyName) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(12, this, "ptr", strPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLElementCollection>} pp 
     * @returns {HRESULT} 
     */
    get_children(pp) {
        result := ComCall(13, this, "ptr*", pp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plType 
     * @returns {HRESULT} 
     */
    get_type(plType) {
        plTypeMarshal := plType is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plTypeMarshal, plType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} p 
     * @returns {HRESULT} 
     */
    get_text(p) {
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} p 
     * @returns {HRESULT} 
     */
    put_text(p) {
        p := p is String ? BSTR.Alloc(p).Value : p

        result := ComCall(16, this, "ptr", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLElement2} pChildElem 
     * @param {Integer} lIndex 
     * @param {Integer} lReserved 
     * @returns {HRESULT} 
     */
    addChild(pChildElem, lIndex, lReserved) {
        result := ComCall(17, this, "ptr", pChildElem, "int", lIndex, "int", lReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLElement2} pChildElem 
     * @returns {HRESULT} 
     */
    removeChild(pChildElem) {
        result := ComCall(18, this, "ptr", pChildElem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLElementCollection>} pp 
     * @returns {HRESULT} 
     */
    get_attributes(pp) {
        result := ComCall(19, this, "ptr*", pp, "HRESULT")
        return result
    }
}
