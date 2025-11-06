#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IVBSAXAttributes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBSAXAttributes
     * @type {Guid}
     */
    static IID => Guid("{10dc0586-132b-4cac-8bb3-db00ac8b7ee0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "getURI", "getLocalName", "getQName", "getIndexFromName", "getIndexFromQName", "getType", "getTypeFromName", "getTypeFromQName", "getValue", "getValueFromName", "getValueFromQName"]

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &nLength := 0, "HRESULT")
        return nLength
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getURI(nIndex) {
        strURI := BSTR()
        result := ComCall(8, this, "int", nIndex, "ptr", strURI, "HRESULT")
        return strURI
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getLocalName(nIndex) {
        strLocalName := BSTR()
        result := ComCall(9, this, "int", nIndex, "ptr", strLocalName, "HRESULT")
        return strLocalName
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getQName(nIndex) {
        strQName := BSTR()
        result := ComCall(10, this, "int", nIndex, "ptr", strQName, "HRESULT")
        return strQName
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {Integer} 
     */
    getIndexFromName(strURI, strLocalName) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        result := ComCall(11, this, "ptr", strURI, "ptr", strLocalName, "int*", &nIndex := 0, "HRESULT")
        return nIndex
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {Integer} 
     */
    getIndexFromQName(strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        result := ComCall(12, this, "ptr", strQName, "int*", &nIndex := 0, "HRESULT")
        return nIndex
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getType(nIndex) {
        strType := BSTR()
        result := ComCall(13, this, "int", nIndex, "ptr", strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {BSTR} 
     */
    getTypeFromName(strURI, strLocalName) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        strType := BSTR()
        result := ComCall(14, this, "ptr", strURI, "ptr", strLocalName, "ptr", strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {BSTR} 
     */
    getTypeFromQName(strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        strType := BSTR()
        result := ComCall(15, this, "ptr", strQName, "ptr", strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {BSTR} 
     */
    getValue(nIndex) {
        strValue := BSTR()
        result := ComCall(16, this, "int", nIndex, "ptr", strValue, "HRESULT")
        return strValue
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @returns {BSTR} 
     */
    getValueFromName(strURI, strLocalName) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        strValue := BSTR()
        result := ComCall(17, this, "ptr", strURI, "ptr", strLocalName, "ptr", strValue, "HRESULT")
        return strValue
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @returns {BSTR} 
     */
    getValueFromQName(strQName) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        strValue := BSTR()
        result := ComCall(18, this, "ptr", strQName, "ptr", strValue, "HRESULT")
        return strValue
    }
}
