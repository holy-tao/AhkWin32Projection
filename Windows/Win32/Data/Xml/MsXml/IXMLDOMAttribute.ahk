#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMNode.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMAttribute extends IXMLDOMNode{
    /**
     * The interface identifier for IXMLDOMAttribute
     * @type {Guid}
     */
    static IID => Guid("{2933bf85-7b36-11d2-b20e-00c04f983e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * 
     * @param {Pointer<BSTR>} attributeName 
     * @returns {HRESULT} 
     */
    get_name(attributeName) {
        result := ComCall(43, this, "ptr", attributeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} attributeValue 
     * @returns {HRESULT} 
     */
    get_value(attributeValue) {
        result := ComCall(44, this, "ptr", attributeValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} attributeValue 
     * @returns {HRESULT} 
     */
    put_value(attributeValue) {
        result := ComCall(45, this, "ptr", attributeValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
