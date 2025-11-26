#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IXMLDOMParseErrorCollection.ahk
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
     * @type {BSTR} 
     */
    errorXPath {
        get => this.get_errorXPath()
    }

    /**
     * @type {IXMLDOMParseErrorCollection} 
     */
    allErrors {
        get => this.get_allErrors()
    }

    /**
     * @type {Integer} 
     */
    errorParametersCount {
        get => this.get_errorParametersCount()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_errorXPath() {
        xpathexpr := BSTR()
        result := ComCall(14, this, "ptr", xpathexpr, "HRESULT")
        return xpathexpr
    }

    /**
     * 
     * @returns {IXMLDOMParseErrorCollection} 
     */
    get_allErrors() {
        result := ComCall(15, this, "ptr*", &allErrors := 0, "HRESULT")
        return IXMLDOMParseErrorCollection(allErrors)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    errorParameters(index) {
        param1 := BSTR()
        result := ComCall(16, this, "int", index, "ptr", param1, "HRESULT")
        return param1
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorParametersCount() {
        result := ComCall(17, this, "int*", &count := 0, "HRESULT")
        return count
    }
}
