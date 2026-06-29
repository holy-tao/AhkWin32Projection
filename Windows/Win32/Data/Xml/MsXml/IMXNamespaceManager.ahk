#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IMXNamespaceManager extends IUnknown {
    /**
     * The interface identifier for IMXNamespaceManager
     * @type {Guid}
     */
    static IID := Guid("{c90352f6-643c-4fbc-bb23-e996eb2d51fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMXNamespaceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        putAllowOverride  : IntPtr
        getAllowOverride  : IntPtr
        reset             : IntPtr
        pushContext       : IntPtr
        pushNodeContext   : IntPtr
        popContext        : IntPtr
        declarePrefix     : IntPtr
        getDeclaredPrefix : IntPtr
        getPrefix         : IntPtr
        getURI            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMXNamespaceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fOverride 
     * @returns {HRESULT} 
     */
    putAllowOverride(fOverride) {
        result := ComCall(3, this, VARIANT_BOOL, fOverride, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    getAllowOverride() {
        result := ComCall(4, this, VARIANT_BOOL.Ptr, &fOverride := 0, "HRESULT")
        return fOverride
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pushContext() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} contextNode 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {HRESULT} 
     */
    pushNodeContext(contextNode, fDeep) {
        result := ComCall(7, this, "ptr", contextNode, VARIANT_BOOL, fDeep, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    popContext() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} prefix 
     * @param {PWSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    declarePrefix(prefix, namespaceURI) {
        prefix := prefix is String ? StrPtr(prefix) : prefix
        namespaceURI := namespaceURI is String ? StrPtr(namespaceURI) : namespaceURI

        result := ComCall(9, this, "ptr", prefix, "ptr", namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {PWSTR} pwchPrefix 
     * @param {Pointer<Integer>} pcchPrefix 
     * @returns {HRESULT} 
     */
    getDeclaredPrefix(nIndex, pwchPrefix, pcchPrefix) {
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix

        pcchPrefixMarshal := pcchPrefix is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", nIndex, "ptr", pwchPrefix, pcchPrefixMarshal, pcchPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszNamespaceURI 
     * @param {Integer} nIndex 
     * @param {PWSTR} pwchPrefix 
     * @param {Pointer<Integer>} pcchPrefix 
     * @returns {HRESULT} 
     */
    getPrefix(pwszNamespaceURI, nIndex, pwchPrefix, pcchPrefix) {
        pwszNamespaceURI := pwszNamespaceURI is String ? StrPtr(pwszNamespaceURI) : pwszNamespaceURI
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix

        pcchPrefixMarshal := pcchPrefix is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "ptr", pwszNamespaceURI, "int", nIndex, "ptr", pwchPrefix, pcchPrefixMarshal, pcchPrefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchPrefix 
     * @param {IXMLDOMNode} pContextNode 
     * @param {PWSTR} pwchUri 
     * @param {Pointer<Integer>} pcchUri 
     * @returns {HRESULT} 
     */
    getURI(pwchPrefix, pContextNode, pwchUri, pcchUri) {
        pwchPrefix := pwchPrefix is String ? StrPtr(pwchPrefix) : pwchPrefix
        pwchUri := pwchUri is String ? StrPtr(pwchUri) : pwchUri

        pcchUriMarshal := pcchUri is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", pwchPrefix, "ptr", pContextNode, "ptr", pwchUri, pcchUriMarshal, pcchUri, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMXNamespaceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.putAllowOverride := CallbackCreate(GetMethod(implObj, "putAllowOverride"), flags, 2)
        this.vtbl.getAllowOverride := CallbackCreate(GetMethod(implObj, "getAllowOverride"), flags, 2)
        this.vtbl.reset := CallbackCreate(GetMethod(implObj, "reset"), flags, 1)
        this.vtbl.pushContext := CallbackCreate(GetMethod(implObj, "pushContext"), flags, 1)
        this.vtbl.pushNodeContext := CallbackCreate(GetMethod(implObj, "pushNodeContext"), flags, 3)
        this.vtbl.popContext := CallbackCreate(GetMethod(implObj, "popContext"), flags, 1)
        this.vtbl.declarePrefix := CallbackCreate(GetMethod(implObj, "declarePrefix"), flags, 3)
        this.vtbl.getDeclaredPrefix := CallbackCreate(GetMethod(implObj, "getDeclaredPrefix"), flags, 4)
        this.vtbl.getPrefix := CallbackCreate(GetMethod(implObj, "getPrefix"), flags, 5)
        this.vtbl.getURI := CallbackCreate(GetMethod(implObj, "getURI"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.putAllowOverride)
        CallbackFree(this.vtbl.getAllowOverride)
        CallbackFree(this.vtbl.reset)
        CallbackFree(this.vtbl.pushContext)
        CallbackFree(this.vtbl.pushNodeContext)
        CallbackFree(this.vtbl.popContext)
        CallbackFree(this.vtbl.declarePrefix)
        CallbackFree(this.vtbl.getDeclaredPrefix)
        CallbackFree(this.vtbl.getPrefix)
        CallbackFree(this.vtbl.getURI)
    }
}
