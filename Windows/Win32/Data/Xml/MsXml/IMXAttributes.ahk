#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXAttributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXAttributes
     * @type {Guid}
     */
    static IID => Guid("{f10d27cc-3ec0-415c-8ed8-77ab1c5e7262}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addAttribute", "addAttributeFromIndex", "clear", "removeAttribute", "setAttribute", "setAttributes", "setLocalName", "setQName", "setType", "setURI", "setValue"]

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {BSTR} strQName 
     * @param {BSTR} strType 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    addAttribute(strURI, strLocalName, strQName, strType, strValue) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName
        strType := strType is String ? BSTR.Alloc(strType).Value : strType
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(7, this, "ptr", strURI, "ptr", strLocalName, "ptr", strQName, "ptr", strType, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varAtts 
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    addAttributeFromIndex(varAtts, nIndex) {
        result := ComCall(8, this, "ptr", varAtts, "int", nIndex, "HRESULT")
        return result
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
     * @param {Integer} nIndex 
     * @returns {HRESULT} 
     */
    removeAttribute(nIndex) {
        result := ComCall(10, this, "int", nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {BSTR} strQName 
     * @param {BSTR} strType 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    setAttribute(nIndex, strURI, strLocalName, strQName, strType, strValue) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName
        strType := strType is String ? BSTR.Alloc(strType).Value : strType
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(11, this, "int", nIndex, "ptr", strURI, "ptr", strLocalName, "ptr", strQName, "ptr", strType, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varAtts 
     * @returns {HRESULT} 
     */
    setAttributes(varAtts) {
        result := ComCall(12, this, "ptr", varAtts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strLocalName 
     * @returns {HRESULT} 
     */
    setLocalName(nIndex, strLocalName) {
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        result := ComCall(13, this, "int", nIndex, "ptr", strLocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strQName 
     * @returns {HRESULT} 
     */
    setQName(nIndex, strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        result := ComCall(14, this, "int", nIndex, "ptr", strQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strType 
     * @returns {HRESULT} 
     */
    setType(nIndex, strType) {
        strType := strType is String ? BSTR.Alloc(strType).Value : strType

        result := ComCall(15, this, "int", nIndex, "ptr", strType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strURI 
     * @returns {HRESULT} 
     */
    setURI(nIndex, strURI) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI

        result := ComCall(16, this, "int", nIndex, "ptr", strURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    setValue(nIndex, strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(17, this, "int", nIndex, "ptr", strValue, "HRESULT")
        return result
    }
}
