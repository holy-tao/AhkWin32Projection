#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLElement.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IXMLElementCollection.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLElement
     * @type {Guid}
     */
    static IID => Guid("{3f7f31ac-e15f-11d0-9c25-00c04fc99c8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_tagName", "put_tagName", "get_parent", "setAttribute", "getAttribute", "removeAttribute", "get_children", "get_type", "get_text", "put_text", "addChild", "removeChild"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_tagName() {
        p := BSTR()
        result := ComCall(7, this, "ptr", p, "HRESULT")
        return p
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
     * @returns {IXMLElement} 
     */
    get_parent() {
        result := ComCall(9, this, "ptr*", &ppParent := 0, "HRESULT")
        return IXMLElement(ppParent)
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
     * @returns {VARIANT} 
     */
    getAttribute(strPropertyName) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        PropertyValue := VARIANT()
        result := ComCall(11, this, "ptr", strPropertyName, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
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
     * @returns {IXMLElementCollection} 
     */
    get_children() {
        result := ComCall(13, this, "ptr*", &pp := 0, "HRESULT")
        return IXMLElementCollection(pp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_type() {
        result := ComCall(14, this, "int*", &plType := 0, "HRESULT")
        return plType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_text() {
        p := BSTR()
        result := ComCall(15, this, "ptr", p, "HRESULT")
        return p
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
     * @param {IXMLElement} pChildElem 
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
     * @param {IXMLElement} pChildElem 
     * @returns {HRESULT} 
     */
    removeChild(pChildElem) {
        result := ComCall(18, this, "ptr", pChildElem, "HRESULT")
        return result
    }
}
