#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IMXXMLFilter extends IDispatch {
    /**
     * The interface identifier for IMXXMLFilter
     * @type {Guid}
     */
    static IID := Guid("{c90352f7-643c-4fbc-bb23-e996eb2d51fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMXXMLFilter interfaces
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
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMXXMLFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    entityResolver {
        get => this.get_entityResolver()
    }

    /**
     * @type {IUnknown} 
     */
    contentHandler {
        get => this.get_contentHandler()
    }

    /**
     * @type {IUnknown} 
     */
    dtdHandler {
        get => this.get_dtdHandler()
    }

    /**
     * @type {IUnknown} 
     */
    errorHandler {
        get => this.get_errorHandler()
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
     * @returns {IUnknown} 
     */
    get_entityResolver() {
        result := ComCall(11, this, "ptr*", &oResolver := 0, "HRESULT")
        return IUnknown(oResolver)
    }

    /**
     * 
     * @param {IUnknown} oResolver 
     * @returns {HRESULT} 
     */
    putref_entityResolver(oResolver) {
        result := ComCall(12, this, "ptr", oResolver, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_contentHandler() {
        result := ComCall(13, this, "ptr*", &oHandler := 0, "HRESULT")
        return IUnknown(oHandler)
    }

    /**
     * 
     * @param {IUnknown} oHandler 
     * @returns {HRESULT} 
     */
    putref_contentHandler(oHandler) {
        result := ComCall(14, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_dtdHandler() {
        result := ComCall(15, this, "ptr*", &oHandler := 0, "HRESULT")
        return IUnknown(oHandler)
    }

    /**
     * 
     * @param {IUnknown} oHandler 
     * @returns {HRESULT} 
     */
    putref_dtdHandler(oHandler) {
        result := ComCall(16, this, "ptr", oHandler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_errorHandler() {
        result := ComCall(17, this, "ptr*", &oHandler := 0, "HRESULT")
        return IUnknown(oHandler)
    }

    /**
     * 
     * @param {IUnknown} oHandler 
     * @returns {HRESULT} 
     */
    putref_errorHandler(oHandler) {
        result := ComCall(18, this, "ptr", oHandler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMXXMLFilter.IID.Equals(iid)) {
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
    }
}
