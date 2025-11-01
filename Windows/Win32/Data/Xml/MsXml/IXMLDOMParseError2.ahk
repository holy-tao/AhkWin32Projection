#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLDOMParseError.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMParseError2 extends IXMLDOMParseError{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_errorXPath", "get_allErrors", "errorParameters", "get_errorParametersCount"]

    /**
     * 
     * @param {Pointer<BSTR>} xpathexpr 
     * @returns {HRESULT} 
     */
    get_errorXPath(xpathexpr) {
        result := ComCall(14, this, "ptr", xpathexpr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXMLDOMParseErrorCollection>} allErrors 
     * @returns {HRESULT} 
     */
    get_allErrors(allErrors) {
        result := ComCall(15, this, "ptr*", allErrors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} param1 
     * @returns {HRESULT} 
     */
    errorParameters(index, param1) {
        result := ComCall(16, this, "int", index, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    get_errorParametersCount(count) {
        result := ComCall(17, this, "int*", count, "HRESULT")
        return result
    }
}
