#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import ".\ISchema.ahk" { ISchema }
#Import ".\IXMLDOMSchemaCollection.ahk" { IXMLDOMSchemaCollection }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMSchemaCollection2 extends IXMLDOMSchemaCollection {
    /**
     * The interface identifier for IXMLDOMSchemaCollection2
     * @type {Guid}
     */
    static IID := Guid("{50ea08b0-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMSchemaCollection2 interfaces
    */
    struct Vtbl extends IXMLDOMSchemaCollection.Vtbl {
        validate           : IntPtr
        put_validateOnLoad : IntPtr
        get_validateOnLoad : IntPtr
        getSchema          : IntPtr
        getDeclaration     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMSchemaCollection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    validateOnLoad {
        get => this.get_validateOnLoad()
        set => this.put_validateOnLoad(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    validate() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} validateOnLoad 
     * @returns {HRESULT} 
     */
    put_validateOnLoad(validateOnLoad) {
        result := ComCall(15, this, VARIANT_BOOL, validateOnLoad, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_validateOnLoad() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &validateOnLoad := 0, "HRESULT")
        return validateOnLoad
    }

    /**
     * 
     * @param {BSTR} namespaceURI 
     * @returns {ISchema} 
     */
    getSchema(namespaceURI) {
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(17, this, BSTR, namespaceURI, "ptr*", &schema := 0, "HRESULT")
        return ISchema(schema)
    }

    /**
     * 
     * @param {IXMLDOMNode} _node 
     * @returns {ISchemaItem} 
     */
    getDeclaration(_node) {
        result := ComCall(18, this, "ptr", _node, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    Query(iid) {
        if (IXMLDOMSchemaCollection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.validate := CallbackCreate(GetMethod(implObj, "validate"), flags, 1)
        this.vtbl.put_validateOnLoad := CallbackCreate(GetMethod(implObj, "put_validateOnLoad"), flags, 2)
        this.vtbl.get_validateOnLoad := CallbackCreate(GetMethod(implObj, "get_validateOnLoad"), flags, 2)
        this.vtbl.getSchema := CallbackCreate(GetMethod(implObj, "getSchema"), flags, 3)
        this.vtbl.getDeclaration := CallbackCreate(GetMethod(implObj, "getDeclaration"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.validate)
        CallbackFree(this.vtbl.put_validateOnLoad)
        CallbackFree(this.vtbl.get_validateOnLoad)
        CallbackFree(this.vtbl.getSchema)
        CallbackFree(this.vtbl.getDeclaration)
    }
}
