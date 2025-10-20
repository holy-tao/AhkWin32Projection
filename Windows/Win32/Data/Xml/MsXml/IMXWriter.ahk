#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IMXWriter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMXWriter
     * @type {Guid}
     */
    static IID => Guid("{4d7ff4ba-1565-4ea8-94e1-6e724a46f98d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_output", "get_output", "put_encoding", "get_encoding", "put_byteOrderMark", "get_byteOrderMark", "put_indent", "get_indent", "put_standalone", "get_standalone", "put_omitXMLDeclaration", "get_omitXMLDeclaration", "put_version", "get_version", "put_disableOutputEscaping", "get_disableOutputEscaping", "flush"]

    /**
     * 
     * @param {VARIANT} varDestination 
     * @returns {HRESULT} 
     */
    put_output(varDestination) {
        result := ComCall(7, this, "ptr", varDestination, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varDestination 
     * @returns {HRESULT} 
     */
    get_output(varDestination) {
        result := ComCall(8, this, "ptr", varDestination, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncoding 
     * @returns {HRESULT} 
     */
    put_encoding(strEncoding) {
        strEncoding := strEncoding is String ? BSTR.Alloc(strEncoding).Value : strEncoding

        result := ComCall(9, this, "ptr", strEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strEncoding 
     * @returns {HRESULT} 
     */
    get_encoding(strEncoding) {
        result := ComCall(10, this, "ptr", strEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fWriteByteOrderMark 
     * @returns {HRESULT} 
     */
    put_byteOrderMark(fWriteByteOrderMark) {
        result := ComCall(11, this, "short", fWriteByteOrderMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fWriteByteOrderMark 
     * @returns {HRESULT} 
     */
    get_byteOrderMark(fWriteByteOrderMark) {
        result := ComCall(12, this, "ptr", fWriteByteOrderMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fIndentMode 
     * @returns {HRESULT} 
     */
    put_indent(fIndentMode) {
        result := ComCall(13, this, "short", fIndentMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fIndentMode 
     * @returns {HRESULT} 
     */
    get_indent(fIndentMode) {
        result := ComCall(14, this, "ptr", fIndentMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    put_standalone(fValue) {
        result := ComCall(15, this, "short", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fValue 
     * @returns {HRESULT} 
     */
    get_standalone(fValue) {
        result := ComCall(16, this, "ptr", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    put_omitXMLDeclaration(fValue) {
        result := ComCall(17, this, "short", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fValue 
     * @returns {HRESULT} 
     */
    get_omitXMLDeclaration(fValue) {
        result := ComCall(18, this, "ptr", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strVersion 
     * @returns {HRESULT} 
     */
    put_version(strVersion) {
        strVersion := strVersion is String ? BSTR.Alloc(strVersion).Value : strVersion

        result := ComCall(19, this, "ptr", strVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strVersion 
     * @returns {HRESULT} 
     */
    get_version(strVersion) {
        result := ComCall(20, this, "ptr", strVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    put_disableOutputEscaping(fValue) {
        result := ComCall(21, this, "short", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fValue 
     * @returns {HRESULT} 
     */
    get_disableOutputEscaping(fValue) {
        result := ComCall(22, this, "ptr", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    flush() {
        result := ComCall(23, this, "HRESULT")
        return result
    }
}
