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
     * 
     * @param {Pointer<BSTR>} data 
     * @returns {HRESULT} 
     */
    get_data(data) {
        result := ComCall(43, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    put_data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(44, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} dataLength 
     * @returns {HRESULT} 
     */
    get_length(dataLength) {
        result := ComCall(45, this, "int*", dataLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @param {Pointer<BSTR>} data 
     * @returns {HRESULT} 
     */
    substringData(offset, count, data) {
        result := ComCall(46, this, "int", offset, "int", count, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    appendData(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(47, this, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(48, this, "int", offset, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    deleteData(offset, count) {
        result := ComCall(49, this, "int", offset, "int", count, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(50, this, "int", offset, "int", count, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
