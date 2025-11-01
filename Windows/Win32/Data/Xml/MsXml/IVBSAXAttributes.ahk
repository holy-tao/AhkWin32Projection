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
     * @param {Pointer<Integer>} nLength 
     * @returns {HRESULT} 
     */
    get_length(nLength) {
        nLengthMarshal := nLength is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, nLengthMarshal, nLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} strURI 
     * @returns {HRESULT} 
     */
    getURI(nIndex, strURI) {
        result := ComCall(8, this, "int", nIndex, "ptr", strURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} strLocalName 
     * @returns {HRESULT} 
     */
    getLocalName(nIndex, strLocalName) {
        result := ComCall(9, this, "int", nIndex, "ptr", strLocalName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} strQName 
     * @returns {HRESULT} 
     */
    getQName(nIndex, strQName) {
        result := ComCall(10, this, "int", nIndex, "ptr", strQName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {Pointer<Integer>} nIndex 
     * @returns {HRESULT} 
     */
    getIndexFromName(strURI, strLocalName, nIndex) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        nIndexMarshal := nIndex is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", strURI, "ptr", strLocalName, nIndexMarshal, nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @param {Pointer<Integer>} nIndex 
     * @returns {HRESULT} 
     */
    getIndexFromQName(strQName, nIndex) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        nIndexMarshal := nIndex is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", strQName, nIndexMarshal, nIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} strType 
     * @returns {HRESULT} 
     */
    getType(nIndex, strType) {
        result := ComCall(13, this, "int", nIndex, "ptr", strType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {Pointer<BSTR>} strType 
     * @returns {HRESULT} 
     */
    getTypeFromName(strURI, strLocalName, strType) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        result := ComCall(14, this, "ptr", strURI, "ptr", strLocalName, "ptr", strType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @param {Pointer<BSTR>} strType 
     * @returns {HRESULT} 
     */
    getTypeFromQName(strQName, strType) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        result := ComCall(15, this, "ptr", strQName, "ptr", strType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    getValue(nIndex, strValue) {
        result := ComCall(16, this, "int", nIndex, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strURI 
     * @param {BSTR} strLocalName 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    getValueFromName(strURI, strLocalName, strValue) {
        strURI := strURI is String ? BSTR.Alloc(strURI).Value : strURI
        strLocalName := strLocalName is String ? BSTR.Alloc(strLocalName).Value : strLocalName

        result := ComCall(17, this, "ptr", strURI, "ptr", strLocalName, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strQName 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    getValueFromQName(strQName, strValue) {
        strQName := strQName is String ? BSTR.Alloc(strQName).Value : strQName

        result := ComCall(18, this, "ptr", strQName, "ptr", strValue, "HRESULT")
        return result
    }
}
