#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMParseError.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMParseError2 extends IXMLDOMParseError{
    /**
     * The interface identifier for IXMLDOMParseError2
     * @type {Guid}
     */
    static IID => Guid("{3efaa428-272f-11d2-836f-0000f87a7782}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<BSTR>} xpathexpr 
     * @returns {HRESULT} 
     */
    get_errorXPath(xpathexpr) {
        result := ComCall(14, this, "ptr", xpathexpr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMParseErrorCollection>} allErrors 
     * @returns {HRESULT} 
     */
    get_allErrors(allErrors) {
        result := ComCall(15, this, "ptr", allErrors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} param1 
     * @returns {HRESULT} 
     */
    errorParameters(index, param1) {
        result := ComCall(16, this, "int", index, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_errorParametersCount(count) {
        result := ComCall(17, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
