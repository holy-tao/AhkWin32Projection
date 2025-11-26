#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMParseError extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLDOMParseError
     * @type {Guid}
     */
    static IID => Guid("{3efaa426-272f-11d2-836f-0000f87a7782}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_errorCode", "get_url", "get_reason", "get_srcText", "get_line", "get_linepos", "get_filepos"]

    /**
     * @type {Integer} 
     */
    errorCode {
        get => this.get_errorCode()
    }

    /**
     * @type {BSTR} 
     */
    url {
        get => this.get_url()
    }

    /**
     * @type {BSTR} 
     */
    reason {
        get => this.get_reason()
    }

    /**
     * @type {BSTR} 
     */
    srcText {
        get => this.get_srcText()
    }

    /**
     * @type {Integer} 
     */
    line {
        get => this.get_line()
    }

    /**
     * @type {Integer} 
     */
    linepos {
        get => this.get_linepos()
    }

    /**
     * @type {Integer} 
     */
    filepos {
        get => this.get_filepos()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_errorCode() {
        result := ComCall(7, this, "int*", &errorCode := 0, "HRESULT")
        return errorCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_url() {
        urlString := BSTR()
        result := ComCall(8, this, "ptr", urlString, "HRESULT")
        return urlString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_reason() {
        reasonString := BSTR()
        result := ComCall(9, this, "ptr", reasonString, "HRESULT")
        return reasonString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_srcText() {
        sourceString := BSTR()
        result := ComCall(10, this, "ptr", sourceString, "HRESULT")
        return sourceString
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_line() {
        result := ComCall(11, this, "int*", &lineNumber := 0, "HRESULT")
        return lineNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_linepos() {
        result := ComCall(12, this, "int*", &linePosition := 0, "HRESULT")
        return linePosition
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_filepos() {
        result := ComCall(13, this, "int*", &filePosition := 0, "HRESULT")
        return filePosition
    }
}
