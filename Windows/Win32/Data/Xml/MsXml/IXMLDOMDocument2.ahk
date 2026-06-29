#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IXMLDOMDocument.ahk" { IXMLDOMDocument }
#Import ".\IXMLDOMSchemaCollection.ahk" { IXMLDOMSchemaCollection }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMParseError.ahk" { IXMLDOMParseError }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMDocument2 extends IXMLDOMDocument {
    /**
     * The interface identifier for IXMLDOMDocument2
     * @type {Guid}
     */
    static IID := Guid("{2933bf95-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMDocument2 interfaces
    */
    struct Vtbl extends IXMLDOMDocument.Vtbl {
        get_namespaces : IntPtr
        get_schemas    : IntPtr
        putref_schemas : IntPtr
        validate       : IntPtr
        setProperty    : IntPtr
        getProperty    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMDocument2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IXMLDOMSchemaCollection} 
     */
    namespaces {
        get => this.get_namespaces()
    }

    /**
     * @type {VARIANT} 
     */
    schemas {
        get => this.get_schemas()
    }

    /**
     * 
     * @returns {IXMLDOMSchemaCollection} 
     */
    get_namespaces() {
        result := ComCall(76, this, "ptr*", &namespaceCollection := 0, "HRESULT")
        return IXMLDOMSchemaCollection(namespaceCollection)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_schemas() {
        otherCollection := VARIANT()
        result := ComCall(77, this, VARIANT.Ptr, otherCollection, "HRESULT")
        return otherCollection
    }

    /**
     * 
     * @param {VARIANT} otherCollection 
     * @returns {HRESULT} 
     */
    putref_schemas(otherCollection) {
        result := ComCall(78, this, VARIANT, otherCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXMLDOMParseError} 
     */
    validate() {
        result := ComCall(79, this, "ptr*", &errorObj := 0, "HRESULT")
        return IXMLDOMParseError(errorObj)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(80, this, BSTR, name, VARIANT, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     */
    getProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        value := VARIANT()
        result := ComCall(81, this, BSTR, name, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IXMLDOMDocument2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_namespaces := CallbackCreate(GetMethod(implObj, "get_namespaces"), flags, 2)
        this.vtbl.get_schemas := CallbackCreate(GetMethod(implObj, "get_schemas"), flags, 2)
        this.vtbl.putref_schemas := CallbackCreate(GetMethod(implObj, "putref_schemas"), flags, 2)
        this.vtbl.validate := CallbackCreate(GetMethod(implObj, "validate"), flags, 2)
        this.vtbl.setProperty := CallbackCreate(GetMethod(implObj, "setProperty"), flags, 3)
        this.vtbl.getProperty := CallbackCreate(GetMethod(implObj, "getProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_namespaces)
        CallbackFree(this.vtbl.get_schemas)
        CallbackFree(this.vtbl.putref_schemas)
        CallbackFree(this.vtbl.validate)
        CallbackFree(this.vtbl.setProperty)
        CallbackFree(this.vtbl.getProperty)
    }
}
