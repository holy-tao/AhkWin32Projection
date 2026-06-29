#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IVBSAXContentHandler.ahk" { IVBSAXContentHandler }
#Import ".\IVBSAXDTDHandler.ahk" { IVBSAXDTDHandler }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IVBSAXErrorHandler.ahk" { IVBSAXErrorHandler }
#Import ".\IVBSAXEntityResolver.ahk" { IVBSAXEntityResolver }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXXMLReader extends IDispatch {
    /**
     * The interface identifier for IVBSAXXMLReader
     * @type {Guid}
     */
    static IID := Guid("{8c033caa-6cd6-4f73-b728-4531af74945f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXXMLReader interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getFeature            : IntPtr
        putFeature            : IntPtr
        getProperty           : IntPtr
        putProperty           : IntPtr
        get_entityResolver    : IntPtr
        putref_entityResolver : IntPtr
        get_contentHandler    : IntPtr
        putref_contentHandler : IntPtr
        get_dtdHandler        : IntPtr
        putref_dtdHandler     : IntPtr
        get_errorHandler      : IntPtr
        putref_errorHandler   : IntPtr
        get_baseURL           : IntPtr
        put_baseURL           : IntPtr
        get_secureBaseURL     : IntPtr
        put_secureBaseURL     : IntPtr
        parse                 : IntPtr
        parseURL              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXXMLReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IVBSAXEntityResolver} 
     */
    entityResolver {
        get => this.get_entityResolver()
    }

    /**
     * @type {IVBSAXContentHandler} 
     */
    contentHandler {
        get => this.get_contentHandler()
    }

    /**
     * @type {IVBSAXDTDHandler} 
     */
    dtdHandler {
        get => this.get_dtdHandler()
    }

    /**
     * @type {IVBSAXErrorHandler} 
     */
    errorHandler {
        get => this.get_errorHandler()
    }

    /**
     * @type {BSTR} 
     */
    baseURL {
        get => this.get_baseURL()
        set => this.put_baseURL(value)
    }

    /**
     * @type {BSTR} 
     */
    secureBaseURL {
        get => this.get_secureBaseURL()
        set => this.put_secureBaseURL(value)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @returns {VARIANT_BOOL} 
     */
    getFeature(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(7, this, BSTR, strName, VARIANT_BOOL.Ptr, &fValue := 0, "HRESULT")
        return fValue
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {VARIANT_BOOL} fValue 
     * @returns {HRESULT} 
     */
    putFeature(strName, fValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, BSTR, strName, VARIANT_BOOL, fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @returns {VARIANT} 
     */
    getProperty(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        varValue := VARIANT()
        result := ComCall(9, this, BSTR, strName, VARIANT.Ptr, varValue, "HRESULT")
        return varValue
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    putProperty(strName, varValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, BSTR, strName, VARIANT, varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IVBSAXEntityResolver} 
     */
    get_entityResolver() {
        result := ComCall(11, this, "ptr*", &oResolver := 0, "HRESULT")
        return IVBSAXEntityResolver(oResolver)
    }

    /**
     * 
     * @param {IVBSAXEntityResolver} oResolver 
     * @returns {HRESULT} 
     */
    putref_entityResolver(oResolver) {
        result := ComCall(12, this, "ptr", oResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IVBSAXContentHandler} 
     */
    get_contentHandler() {
        result := ComCall(13, this, "ptr*", &oHandler := 0, "HRESULT")
        return IVBSAXContentHandler(oHandler)
    }

    /**
     * 
     * @param {IVBSAXContentHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_contentHandler(oHandler) {
        result := ComCall(14, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IVBSAXDTDHandler} 
     */
    get_dtdHandler() {
        result := ComCall(15, this, "ptr*", &oHandler := 0, "HRESULT")
        return IVBSAXDTDHandler(oHandler)
    }

    /**
     * 
     * @param {IVBSAXDTDHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_dtdHandler(oHandler) {
        result := ComCall(16, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IVBSAXErrorHandler} 
     */
    get_errorHandler() {
        result := ComCall(17, this, "ptr*", &oHandler := 0, "HRESULT")
        return IVBSAXErrorHandler(oHandler)
    }

    /**
     * 
     * @param {IVBSAXErrorHandler} oHandler 
     * @returns {HRESULT} 
     */
    putref_errorHandler(oHandler) {
        result := ComCall(18, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_baseURL() {
        strBaseURL := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, strBaseURL, "HRESULT")
        return strBaseURL
    }

    /**
     * 
     * @param {BSTR} strBaseURL 
     * @returns {HRESULT} 
     */
    put_baseURL(strBaseURL) {
        strBaseURL := strBaseURL is String ? BSTR.Alloc(strBaseURL).Value : strBaseURL

        result := ComCall(20, this, BSTR, strBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_secureBaseURL() {
        strSecureBaseURL := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, strSecureBaseURL, "HRESULT")
        return strSecureBaseURL
    }

    /**
     * 
     * @param {BSTR} strSecureBaseURL 
     * @returns {HRESULT} 
     */
    put_secureBaseURL(strSecureBaseURL) {
        strSecureBaseURL := strSecureBaseURL is String ? BSTR.Alloc(strSecureBaseURL).Value : strSecureBaseURL

        result := ComCall(22, this, BSTR, strSecureBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varInput 
     * @returns {HRESULT} 
     */
    parse(varInput) {
        result := ComCall(23, this, VARIANT, varInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strURL 
     * @returns {HRESULT} 
     */
    parseURL(strURL) {
        strURL := strURL is String ? BSTR.Alloc(strURL).Value : strURL

        result := ComCall(24, this, BSTR, strURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXXMLReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getFeature := CallbackCreate(GetMethod(implObj, "getFeature"), flags, 3)
        this.vtbl.putFeature := CallbackCreate(GetMethod(implObj, "putFeature"), flags, 3)
        this.vtbl.getProperty := CallbackCreate(GetMethod(implObj, "getProperty"), flags, 3)
        this.vtbl.putProperty := CallbackCreate(GetMethod(implObj, "putProperty"), flags, 3)
        this.vtbl.get_entityResolver := CallbackCreate(GetMethod(implObj, "get_entityResolver"), flags, 2)
        this.vtbl.putref_entityResolver := CallbackCreate(GetMethod(implObj, "putref_entityResolver"), flags, 2)
        this.vtbl.get_contentHandler := CallbackCreate(GetMethod(implObj, "get_contentHandler"), flags, 2)
        this.vtbl.putref_contentHandler := CallbackCreate(GetMethod(implObj, "putref_contentHandler"), flags, 2)
        this.vtbl.get_dtdHandler := CallbackCreate(GetMethod(implObj, "get_dtdHandler"), flags, 2)
        this.vtbl.putref_dtdHandler := CallbackCreate(GetMethod(implObj, "putref_dtdHandler"), flags, 2)
        this.vtbl.get_errorHandler := CallbackCreate(GetMethod(implObj, "get_errorHandler"), flags, 2)
        this.vtbl.putref_errorHandler := CallbackCreate(GetMethod(implObj, "putref_errorHandler"), flags, 2)
        this.vtbl.get_baseURL := CallbackCreate(GetMethod(implObj, "get_baseURL"), flags, 2)
        this.vtbl.put_baseURL := CallbackCreate(GetMethod(implObj, "put_baseURL"), flags, 2)
        this.vtbl.get_secureBaseURL := CallbackCreate(GetMethod(implObj, "get_secureBaseURL"), flags, 2)
        this.vtbl.put_secureBaseURL := CallbackCreate(GetMethod(implObj, "put_secureBaseURL"), flags, 2)
        this.vtbl.parse := CallbackCreate(GetMethod(implObj, "parse"), flags, 2)
        this.vtbl.parseURL := CallbackCreate(GetMethod(implObj, "parseURL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getFeature)
        CallbackFree(this.vtbl.putFeature)
        CallbackFree(this.vtbl.getProperty)
        CallbackFree(this.vtbl.putProperty)
        CallbackFree(this.vtbl.get_entityResolver)
        CallbackFree(this.vtbl.putref_entityResolver)
        CallbackFree(this.vtbl.get_contentHandler)
        CallbackFree(this.vtbl.putref_contentHandler)
        CallbackFree(this.vtbl.get_dtdHandler)
        CallbackFree(this.vtbl.putref_dtdHandler)
        CallbackFree(this.vtbl.get_errorHandler)
        CallbackFree(this.vtbl.putref_errorHandler)
        CallbackFree(this.vtbl.get_baseURL)
        CallbackFree(this.vtbl.put_baseURL)
        CallbackFree(this.vtbl.get_secureBaseURL)
        CallbackFree(this.vtbl.put_secureBaseURL)
        CallbackFree(this.vtbl.parse)
        CallbackFree(this.vtbl.parseURL)
    }
}
