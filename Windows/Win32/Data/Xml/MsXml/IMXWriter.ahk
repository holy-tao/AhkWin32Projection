#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
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
     * @type {VARIANT} 
     */
    output {
        get => this.get_output()
        set => this.put_output(value)
    }

    /**
     * @type {BSTR} 
     */
    encoding {
        get => this.get_encoding()
        set => this.put_encoding(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    byteOrderMark {
        get => this.get_byteOrderMark()
        set => this.put_byteOrderMark(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    indent {
        get => this.get_indent()
        set => this.put_indent(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    standalone {
        get => this.get_standalone()
        set => this.put_standalone(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    omitXMLDeclaration {
        get => this.get_omitXMLDeclaration()
        set => this.put_omitXMLDeclaration(value)
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
        set => this.put_version(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    disableOutputEscaping {
        get => this.get_disableOutputEscaping()
        set => this.put_disableOutputEscaping(value)
    }

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
     * @returns {VARIANT} 
     */
    get_output() {
        varDestination := VARIANT()
        result := ComCall(8, this, "ptr", varDestination, "HRESULT")
        return varDestination
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
     * @returns {BSTR} 
     */
    get_encoding() {
        strEncoding := BSTR()
        result := ComCall(10, this, "ptr", strEncoding, "HRESULT")
        return strEncoding
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
     * @returns {VARIANT_BOOL} 
     */
    get_byteOrderMark() {
        result := ComCall(12, this, "short*", &fWriteByteOrderMark := 0, "HRESULT")
        return fWriteByteOrderMark
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
     * @returns {VARIANT_BOOL} 
     */
    get_indent() {
        result := ComCall(14, this, "short*", &fIndentMode := 0, "HRESULT")
        return fIndentMode
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
     * @returns {VARIANT_BOOL} 
     */
    get_standalone() {
        result := ComCall(16, this, "short*", &fValue := 0, "HRESULT")
        return fValue
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
     * @returns {VARIANT_BOOL} 
     */
    get_omitXMLDeclaration() {
        result := ComCall(18, this, "short*", &fValue := 0, "HRESULT")
        return fValue
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
     * @returns {BSTR} 
     */
    get_version() {
        strVersion := BSTR()
        result := ComCall(20, this, "ptr", strVersion, "HRESULT")
        return strVersion
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
     * @returns {VARIANT_BOOL} 
     */
    get_disableOutputEscaping() {
        result := ComCall(22, this, "short*", &fValue := 0, "HRESULT")
        return fValue
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
