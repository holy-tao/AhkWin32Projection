#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVBSAXAttributes.ahk" { IVBSAXAttributes }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISchema.ahk" { ISchema }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SOMITEMTYPE.ahk" { SOMITEMTYPE }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaItem extends IDispatch {
    /**
     * The interface identifier for ISchemaItem
     * @type {Guid}
     */
    static IID := Guid("{50ea08b3-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_name                : IntPtr
        get_namespaceURI        : IntPtr
        get_schema              : IntPtr
        get_id                  : IntPtr
        get_itemType            : IntPtr
        get_unhandledAttributes : IntPtr
        writeAnnotation         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {BSTR} 
     */
    namespaceURI {
        get => this.get_namespaceURI()
    }

    /**
     * @type {ISchema} 
     */
    schema {
        get => this.get_schema()
    }

    /**
     * @type {BSTR} 
     */
    id {
        get => this.get_id()
    }

    /**
     * @type {SOMITEMTYPE} 
     */
    itemType {
        get => this.get_itemType()
    }

    /**
     * @type {IVBSAXAttributes} 
     */
    unhandledAttributes {
        get => this.get_unhandledAttributes()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_namespaceURI() {
        namespaceURI := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, namespaceURI, "HRESULT")
        return namespaceURI
    }

    /**
     * 
     * @returns {ISchema} 
     */
    get_schema() {
        result := ComCall(9, this, "ptr*", &schema := 0, "HRESULT")
        return ISchema(schema)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_id() {
        id := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, id, "HRESULT")
        return id
    }

    /**
     * 
     * @returns {SOMITEMTYPE} 
     */
    get_itemType() {
        result := ComCall(11, this, "int*", &itemType := 0, "HRESULT")
        return itemType
    }

    /**
     * 
     * @returns {IVBSAXAttributes} 
     */
    get_unhandledAttributes() {
        result := ComCall(12, this, "ptr*", &attributes := 0, "HRESULT")
        return IVBSAXAttributes(attributes)
    }

    /**
     * 
     * @param {IUnknown} annotationSink 
     * @returns {VARIANT_BOOL} 
     */
    writeAnnotation(annotationSink) {
        result := ComCall(13, this, "ptr", annotationSink, VARIANT_BOOL.Ptr, &isWritten := 0, "HRESULT")
        return isWritten
    }

    Query(iid) {
        if (ISchemaItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_namespaceURI := CallbackCreate(GetMethod(implObj, "get_namespaceURI"), flags, 2)
        this.vtbl.get_schema := CallbackCreate(GetMethod(implObj, "get_schema"), flags, 2)
        this.vtbl.get_id := CallbackCreate(GetMethod(implObj, "get_id"), flags, 2)
        this.vtbl.get_itemType := CallbackCreate(GetMethod(implObj, "get_itemType"), flags, 2)
        this.vtbl.get_unhandledAttributes := CallbackCreate(GetMethod(implObj, "get_unhandledAttributes"), flags, 2)
        this.vtbl.writeAnnotation := CallbackCreate(GetMethod(implObj, "writeAnnotation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_namespaceURI)
        CallbackFree(this.vtbl.get_schema)
        CallbackFree(this.vtbl.get_id)
        CallbackFree(this.vtbl.get_itemType)
        CallbackFree(this.vtbl.get_unhandledAttributes)
        CallbackFree(this.vtbl.writeAnnotation)
    }
}
