#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLDOMParseError extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} errorCode 
     * @returns {HRESULT} 
     */
    get_errorCode(errorCode) {
        result := ComCall(7, this, "int*", errorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} urlString 
     * @returns {HRESULT} 
     */
    get_url(urlString) {
        result := ComCall(8, this, "ptr", urlString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} reasonString 
     * @returns {HRESULT} 
     */
    get_reason(reasonString) {
        result := ComCall(9, this, "ptr", reasonString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sourceString 
     * @returns {HRESULT} 
     */
    get_srcText(sourceString) {
        result := ComCall(10, this, "ptr", sourceString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lineNumber 
     * @returns {HRESULT} 
     */
    get_line(lineNumber) {
        result := ComCall(11, this, "int*", lineNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} linePosition 
     * @returns {HRESULT} 
     */
    get_linepos(linePosition) {
        result := ComCall(12, this, "int*", linePosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} filePosition 
     * @returns {HRESULT} 
     */
    get_filepos(filePosition) {
        result := ComCall(13, this, "int*", filePosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
