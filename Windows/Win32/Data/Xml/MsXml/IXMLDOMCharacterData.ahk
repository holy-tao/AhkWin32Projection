#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMCharacterData extends IXMLDOMNode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMCharacterData
     * @type {Guid}
     */
    static IID => Guid("{2933bf84-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_data", "put_data", "get_length", "substringData", "appendData", "insertData", "deleteData", "replaceData"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        data := BSTR()
        result := ComCall(43, this, "ptr", data, "HRESULT")
        return data
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    put_data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(44, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(45, this, "int*", &dataLength := 0, "HRESULT")
        return dataLength
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @returns {BSTR} 
     */
    substringData(offset, count) {
        data := BSTR()
        result := ComCall(46, this, "int", offset, "int", count, "ptr", data, "HRESULT")
        return data
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    appendData(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(47, this, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    insertData(offset, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(48, this, "int", offset, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    deleteData(offset, count) {
        result := ComCall(49, this, "int", offset, "int", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    replaceData(offset, count, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(50, this, "int", offset, "int", count, "ptr", data, "HRESULT")
        return result
    }
}
