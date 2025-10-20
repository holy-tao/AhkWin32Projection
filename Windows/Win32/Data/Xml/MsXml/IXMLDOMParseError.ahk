#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} errorCode 
     * @returns {HRESULT} 
     */
    get_errorCode(errorCode) {
        result := ComCall(7, this, "int*", errorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} urlString 
     * @returns {HRESULT} 
     */
    get_url(urlString) {
        result := ComCall(8, this, "ptr", urlString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} reasonString 
     * @returns {HRESULT} 
     */
    get_reason(reasonString) {
        result := ComCall(9, this, "ptr", reasonString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sourceString 
     * @returns {HRESULT} 
     */
    get_srcText(sourceString) {
        result := ComCall(10, this, "ptr", sourceString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lineNumber 
     * @returns {HRESULT} 
     */
    get_line(lineNumber) {
        result := ComCall(11, this, "int*", lineNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} linePosition 
     * @returns {HRESULT} 
     */
    get_linepos(linePosition) {
        result := ComCall(12, this, "int*", linePosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} filePosition 
     * @returns {HRESULT} 
     */
    get_filepos(filePosition) {
        result := ComCall(13, this, "int*", filePosition, "HRESULT")
        return result
    }
}
