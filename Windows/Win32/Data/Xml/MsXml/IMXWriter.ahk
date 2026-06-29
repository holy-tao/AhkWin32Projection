#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IMXWriter extends IDispatch {
    /**
     * The interface identifier for IMXWriter
     * @type {Guid}
     */
    static IID := Guid("{4d7ff4ba-1565-4ea8-94e1-6e724a46f98d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMXWriter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_output                : IntPtr
        get_output                : IntPtr
        put_encoding              : IntPtr
        get_encoding              : IntPtr
        put_byteOrderMark         : IntPtr
        get_byteOrderMark         : IntPtr
        put_indent                : IntPtr
        get_indent                : IntPtr
        put_standalone            : IntPtr
        get_standalone            : IntPtr
        put_omitXMLDeclaration    : IntPtr
        get_omitXMLDeclaration    : IntPtr
        put_version               : IntPtr
        get_version               : IntPtr
        put_disableOutputEscaping : IntPtr
        get_disableOutputEscaping : IntPtr
        flush                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMXWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(7, this, VARIANT, varDestination, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_output() {
        varDestination := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, varDestination, "HRESULT")
        return varDestination
    }

    /**
     * 
     * @param {BSTR} strEncoding 
     * @returns {HRESULT} 
     */
    put_encoding(strEncoding) {
        strEncoding := strEncoding is String ? BSTR.Alloc(strEncoding).Value : strEncoding

        result := ComCall(9, this, BSTR, strEncoding, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_encoding() {
        strEncoding := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, strEncoding, "HRESULT")
        return strEncoding
    }

    /**
     * 
     * @param {VARIANT_BOOL} fWriteByteOrderMark 
     * @returns {HRESULT} 
     */
    put_byteOrderMark(fWriteByteOrderMark) {
        result := ComCall(11, this, VARIANT_BOOL, fWriteByteOrderMark, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_byteOrderMark() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &fWriteByteOrderMark := 0, "HRESULT")
        return fWriteByteOrderMark
    }

    /**
     * 
     * @param {VARIANT_BOOL} fIndentMode 
     * @returns {HRESULT} 
     */
    put_indent(fIndentMode) {
        result := ComCall(13, this, VARIANT_BOOL, fIndentMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_indent() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &fIndentMode := 0, "HRESULT")
        return fIndentMode
    }

    /**
     * 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    put_standalone(fValue) {
        result := ComCall(15, this, VARIANT_BOOL, fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_standalone() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &fValue := 0, "HRESULT")
        return fValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    put_omitXMLDeclaration(fValue) {
        result := ComCall(17, this, VARIANT_BOOL, fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_omitXMLDeclaration() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &fValue := 0, "HRESULT")
        return fValue
    }

    /**
     * 
     * @param {BSTR} strVersion 
     * @returns {HRESULT} 
     */
    put_version(strVersion) {
        strVersion := strVersion is String ? BSTR.Alloc(strVersion).Value : strVersion

        result := ComCall(19, this, BSTR, strVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        strVersion := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, strVersion, "HRESULT")
        return strVersion
    }

    /**
     * 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    put_disableOutputEscaping(fValue) {
        result := ComCall(21, this, VARIANT_BOOL, fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_disableOutputEscaping() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &fValue := 0, "HRESULT")
        return fValue
    }

    /**
     * Flushes the internal buffers for the log files.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Http/flush-logbuffer
     */
    flush() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMXWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_output := CallbackCreate(GetMethod(implObj, "put_output"), flags, 2)
        this.vtbl.get_output := CallbackCreate(GetMethod(implObj, "get_output"), flags, 2)
        this.vtbl.put_encoding := CallbackCreate(GetMethod(implObj, "put_encoding"), flags, 2)
        this.vtbl.get_encoding := CallbackCreate(GetMethod(implObj, "get_encoding"), flags, 2)
        this.vtbl.put_byteOrderMark := CallbackCreate(GetMethod(implObj, "put_byteOrderMark"), flags, 2)
        this.vtbl.get_byteOrderMark := CallbackCreate(GetMethod(implObj, "get_byteOrderMark"), flags, 2)
        this.vtbl.put_indent := CallbackCreate(GetMethod(implObj, "put_indent"), flags, 2)
        this.vtbl.get_indent := CallbackCreate(GetMethod(implObj, "get_indent"), flags, 2)
        this.vtbl.put_standalone := CallbackCreate(GetMethod(implObj, "put_standalone"), flags, 2)
        this.vtbl.get_standalone := CallbackCreate(GetMethod(implObj, "get_standalone"), flags, 2)
        this.vtbl.put_omitXMLDeclaration := CallbackCreate(GetMethod(implObj, "put_omitXMLDeclaration"), flags, 2)
        this.vtbl.get_omitXMLDeclaration := CallbackCreate(GetMethod(implObj, "get_omitXMLDeclaration"), flags, 2)
        this.vtbl.put_version := CallbackCreate(GetMethod(implObj, "put_version"), flags, 2)
        this.vtbl.get_version := CallbackCreate(GetMethod(implObj, "get_version"), flags, 2)
        this.vtbl.put_disableOutputEscaping := CallbackCreate(GetMethod(implObj, "put_disableOutputEscaping"), flags, 2)
        this.vtbl.get_disableOutputEscaping := CallbackCreate(GetMethod(implObj, "get_disableOutputEscaping"), flags, 2)
        this.vtbl.flush := CallbackCreate(GetMethod(implObj, "flush"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_output)
        CallbackFree(this.vtbl.get_output)
        CallbackFree(this.vtbl.put_encoding)
        CallbackFree(this.vtbl.get_encoding)
        CallbackFree(this.vtbl.put_byteOrderMark)
        CallbackFree(this.vtbl.get_byteOrderMark)
        CallbackFree(this.vtbl.put_indent)
        CallbackFree(this.vtbl.get_indent)
        CallbackFree(this.vtbl.put_standalone)
        CallbackFree(this.vtbl.get_standalone)
        CallbackFree(this.vtbl.put_omitXMLDeclaration)
        CallbackFree(this.vtbl.get_omitXMLDeclaration)
        CallbackFree(this.vtbl.put_version)
        CallbackFree(this.vtbl.get_version)
        CallbackFree(this.vtbl.put_disableOutputEscaping)
        CallbackFree(this.vtbl.get_disableOutputEscaping)
        CallbackFree(this.vtbl.flush)
    }
}
