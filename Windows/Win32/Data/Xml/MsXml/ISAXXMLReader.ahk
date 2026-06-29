#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISAXErrorHandler.ahk" { ISAXErrorHandler }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISAXContentHandler.ahk" { ISAXContentHandler }
#Import ".\ISAXDTDHandler.ahk" { ISAXDTDHandler }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ISAXEntityResolver.ahk" { ISAXEntityResolver }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXXMLReader extends IUnknown {
    /**
     * The interface identifier for ISAXXMLReader
     * @type {Guid}
     */
    static IID := Guid("{a4f96ed0-f829-476e-81c0-cdc7bd2a0802}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXXMLReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        getFeature        : IntPtr
        putFeature        : IntPtr
        getProperty       : IntPtr
        putProperty       : IntPtr
        getEntityResolver : IntPtr
        putEntityResolver : IntPtr
        getContentHandler : IntPtr
        putContentHandler : IntPtr
        getDTDHandler     : IntPtr
        putDTDHandler     : IntPtr
        getErrorHandler   : IntPtr
        putErrorHandler   : IntPtr
        getBaseURL        : IntPtr
        putBaseURL        : IntPtr
        getSecureBaseURL  : IntPtr
        putSecureBaseURL  : IntPtr
        parse             : IntPtr
        parseURL          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXXMLReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @returns {VARIANT_BOOL} 
     */
    getFeature(pwchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(3, this, "ptr", pwchName, VARIANT_BOOL.Ptr, &pvfValue := 0, "HRESULT")
        return pvfValue
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {VARIANT_BOOL} vfValue 
     * @returns {HRESULT} 
     */
    putFeature(pwchName, vfValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(4, this, "ptr", pwchName, VARIANT_BOOL, vfValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @returns {VARIANT} 
     */
    getProperty(pwchName) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        pvarValue := VARIANT()
        result := ComCall(5, this, "ptr", pwchName, VARIANT.Ptr, pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {PWSTR} pwchName 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    putProperty(pwchName, varValue) {
        pwchName := pwchName is String ? StrPtr(pwchName) : pwchName

        result := ComCall(6, this, "ptr", pwchName, VARIANT, varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISAXEntityResolver} 
     */
    getEntityResolver() {
        result := ComCall(7, this, "ptr*", &ppResolver := 0, "HRESULT")
        return ISAXEntityResolver(ppResolver)
    }

    /**
     * 
     * @param {ISAXEntityResolver} pResolver 
     * @returns {HRESULT} 
     */
    putEntityResolver(pResolver) {
        result := ComCall(8, this, "ptr", pResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISAXContentHandler} 
     */
    getContentHandler() {
        result := ComCall(9, this, "ptr*", &ppHandler := 0, "HRESULT")
        return ISAXContentHandler(ppHandler)
    }

    /**
     * 
     * @param {ISAXContentHandler} pHandler 
     * @returns {HRESULT} 
     */
    putContentHandler(pHandler) {
        result := ComCall(10, this, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISAXDTDHandler} 
     */
    getDTDHandler() {
        result := ComCall(11, this, "ptr*", &ppHandler := 0, "HRESULT")
        return ISAXDTDHandler(ppHandler)
    }

    /**
     * 
     * @param {ISAXDTDHandler} pHandler 
     * @returns {HRESULT} 
     */
    putDTDHandler(pHandler) {
        result := ComCall(12, this, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISAXErrorHandler} 
     */
    getErrorHandler() {
        result := ComCall(13, this, "ptr*", &ppHandler := 0, "HRESULT")
        return ISAXErrorHandler(ppHandler)
    }

    /**
     * 
     * @param {ISAXErrorHandler} pHandler 
     * @returns {HRESULT} 
     */
    putErrorHandler(pHandler) {
        result := ComCall(14, this, "ptr", pHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getBaseURL() {
        result := ComCall(15, this, "ptr*", &ppwchBaseUrl := 0, "HRESULT")
        return ppwchBaseUrl
    }

    /**
     * 
     * @param {PWSTR} pwchBaseUrl 
     * @returns {HRESULT} 
     */
    putBaseURL(pwchBaseUrl) {
        pwchBaseUrl := pwchBaseUrl is String ? StrPtr(pwchBaseUrl) : pwchBaseUrl

        result := ComCall(16, this, "ptr", pwchBaseUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getSecureBaseURL() {
        result := ComCall(17, this, "ptr*", &ppwchSecureBaseUrl := 0, "HRESULT")
        return ppwchSecureBaseUrl
    }

    /**
     * 
     * @param {PWSTR} pwchSecureBaseUrl 
     * @returns {HRESULT} 
     */
    putSecureBaseURL(pwchSecureBaseUrl) {
        pwchSecureBaseUrl := pwchSecureBaseUrl is String ? StrPtr(pwchSecureBaseUrl) : pwchSecureBaseUrl

        result := ComCall(18, this, "ptr", pwchSecureBaseUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varInput 
     * @returns {HRESULT} 
     */
    parse(varInput) {
        result := ComCall(19, this, VARIANT, varInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchUrl 
     * @returns {HRESULT} 
     */
    parseURL(pwchUrl) {
        pwchUrl := pwchUrl is String ? StrPtr(pwchUrl) : pwchUrl

        result := ComCall(20, this, "ptr", pwchUrl, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXXMLReader.IID.Equals(iid)) {
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
        this.vtbl.getEntityResolver := CallbackCreate(GetMethod(implObj, "getEntityResolver"), flags, 2)
        this.vtbl.putEntityResolver := CallbackCreate(GetMethod(implObj, "putEntityResolver"), flags, 2)
        this.vtbl.getContentHandler := CallbackCreate(GetMethod(implObj, "getContentHandler"), flags, 2)
        this.vtbl.putContentHandler := CallbackCreate(GetMethod(implObj, "putContentHandler"), flags, 2)
        this.vtbl.getDTDHandler := CallbackCreate(GetMethod(implObj, "getDTDHandler"), flags, 2)
        this.vtbl.putDTDHandler := CallbackCreate(GetMethod(implObj, "putDTDHandler"), flags, 2)
        this.vtbl.getErrorHandler := CallbackCreate(GetMethod(implObj, "getErrorHandler"), flags, 2)
        this.vtbl.putErrorHandler := CallbackCreate(GetMethod(implObj, "putErrorHandler"), flags, 2)
        this.vtbl.getBaseURL := CallbackCreate(GetMethod(implObj, "getBaseURL"), flags, 2)
        this.vtbl.putBaseURL := CallbackCreate(GetMethod(implObj, "putBaseURL"), flags, 2)
        this.vtbl.getSecureBaseURL := CallbackCreate(GetMethod(implObj, "getSecureBaseURL"), flags, 2)
        this.vtbl.putSecureBaseURL := CallbackCreate(GetMethod(implObj, "putSecureBaseURL"), flags, 2)
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
        CallbackFree(this.vtbl.getEntityResolver)
        CallbackFree(this.vtbl.putEntityResolver)
        CallbackFree(this.vtbl.getContentHandler)
        CallbackFree(this.vtbl.putContentHandler)
        CallbackFree(this.vtbl.getDTDHandler)
        CallbackFree(this.vtbl.putDTDHandler)
        CallbackFree(this.vtbl.getErrorHandler)
        CallbackFree(this.vtbl.putErrorHandler)
        CallbackFree(this.vtbl.getBaseURL)
        CallbackFree(this.vtbl.putBaseURL)
        CallbackFree(this.vtbl.getSecureBaseURL)
        CallbackFree(this.vtbl.putSecureBaseURL)
        CallbackFree(this.vtbl.parse)
        CallbackFree(this.vtbl.parseURL)
    }
}
