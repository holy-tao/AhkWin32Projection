#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMXNamespacePrefixes.ahk" { IMXNamespacePrefixes }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBMXNamespaceManager extends IDispatch {
    /**
     * The interface identifier for IVBMXNamespaceManager
     * @type {Guid}
     */
    static IID := Guid("{c90352f5-643c-4fbc-bb23-e996eb2d51fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBMXNamespaceManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_allowOverride   : IntPtr
        get_allowOverride   : IntPtr
        reset               : IntPtr
        pushContext         : IntPtr
        pushNodeContext     : IntPtr
        popContext          : IntPtr
        declarePrefix       : IntPtr
        getDeclaredPrefixes : IntPtr
        getPrefixes         : IntPtr
        getURI              : IntPtr
        getURIFromNode      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBMXNamespaceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    allowOverride {
        get => this.get_allowOverride()
        set => this.put_allowOverride(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fOverride 
     * @returns {HRESULT} 
     */
    put_allowOverride(fOverride) {
        result := ComCall(7, this, VARIANT_BOOL, fOverride, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_allowOverride() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &fOverride := 0, "HRESULT")
        return fOverride
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pushContext() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLDOMNode} contextNode 
     * @param {VARIANT_BOOL} fDeep 
     * @returns {HRESULT} 
     */
    pushNodeContext(contextNode, fDeep) {
        result := ComCall(11, this, "ptr", contextNode, VARIANT_BOOL, fDeep, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    popContext() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} prefix 
     * @param {BSTR} namespaceURI 
     * @returns {HRESULT} 
     */
    declarePrefix(prefix, namespaceURI) {
        prefix := prefix is String ? BSTR.Alloc(prefix).Value : prefix
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(13, this, BSTR, prefix, BSTR, namespaceURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMXNamespacePrefixes} 
     */
    getDeclaredPrefixes() {
        result := ComCall(14, this, "ptr*", &prefixes := 0, "HRESULT")
        return IMXNamespacePrefixes(prefixes)
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {IMXNamespacePrefixes} 
     */
    getPrefixes(namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(15, this, BSTR, namespaceURI, "ptr*", &prefixes := 0, "HRESULT")
        return IMXNamespacePrefixes(prefixes)
    }

    /**
     * 
     * @param {BSTR} prefix 
     * @returns {VARIANT} 
     */
    getURI(prefix) {
        prefix := prefix is String ? BSTR.Alloc(prefix).Value : prefix

        uri := VARIANT()
        result := ComCall(16, this, BSTR, prefix, VARIANT.Ptr, uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @param {BSTR} strPrefix 
     * @param {IXMLDOMNode} contextNode 
     * @returns {VARIANT} 
     */
    getURIFromNode(strPrefix, contextNode) {
        strPrefix := strPrefix is String ? BSTR.Alloc(strPrefix).Value : strPrefix

        uri := VARIANT()
        result := ComCall(17, this, BSTR, strPrefix, "ptr", contextNode, VARIANT.Ptr, uri, "HRESULT")
        return uri
    }

    Query(iid) {
        if (IVBMXNamespaceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_allowOverride := CallbackCreate(GetMethod(implObj, "put_allowOverride"), flags, 2)
        this.vtbl.get_allowOverride := CallbackCreate(GetMethod(implObj, "get_allowOverride"), flags, 2)
        this.vtbl.reset := CallbackCreate(GetMethod(implObj, "reset"), flags, 1)
        this.vtbl.pushContext := CallbackCreate(GetMethod(implObj, "pushContext"), flags, 1)
        this.vtbl.pushNodeContext := CallbackCreate(GetMethod(implObj, "pushNodeContext"), flags, 3)
        this.vtbl.popContext := CallbackCreate(GetMethod(implObj, "popContext"), flags, 1)
        this.vtbl.declarePrefix := CallbackCreate(GetMethod(implObj, "declarePrefix"), flags, 3)
        this.vtbl.getDeclaredPrefixes := CallbackCreate(GetMethod(implObj, "getDeclaredPrefixes"), flags, 2)
        this.vtbl.getPrefixes := CallbackCreate(GetMethod(implObj, "getPrefixes"), flags, 3)
        this.vtbl.getURI := CallbackCreate(GetMethod(implObj, "getURI"), flags, 3)
        this.vtbl.getURIFromNode := CallbackCreate(GetMethod(implObj, "getURIFromNode"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_allowOverride)
        CallbackFree(this.vtbl.get_allowOverride)
        CallbackFree(this.vtbl.reset)
        CallbackFree(this.vtbl.pushContext)
        CallbackFree(this.vtbl.pushNodeContext)
        CallbackFree(this.vtbl.popContext)
        CallbackFree(this.vtbl.declarePrefix)
        CallbackFree(this.vtbl.getDeclaredPrefixes)
        CallbackFree(this.vtbl.getPrefixes)
        CallbackFree(this.vtbl.getURI)
        CallbackFree(this.vtbl.getURIFromNode)
    }
}
