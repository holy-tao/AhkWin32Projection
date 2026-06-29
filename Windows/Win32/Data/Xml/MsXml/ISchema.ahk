#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISchemaItemCollection.ahk" { ISchemaItemCollection }
#Import ".\ISchemaStringCollection.ahk" { ISchemaStringCollection }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchema extends ISchemaItem {
    /**
     * The interface identifier for ISchema
     * @type {Guid}
     */
    static IID := Guid("{50ea08b4-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchema interfaces
    */
    struct Vtbl extends ISchemaItem.Vtbl {
        get_targetNamespace : IntPtr
        get_version         : IntPtr
        get_types           : IntPtr
        get_elements        : IntPtr
        get_attributes      : IntPtr
        get_attributeGroups : IntPtr
        get_modelGroups     : IntPtr
        get_notations       : IntPtr
        get_schemaLocations : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchema.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    targetNamespace {
        get => this.get_targetNamespace()
    }

    /**
     * @type {BSTR} 
     */
    version {
        get => this.get_version()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    types {
        get => this.get_types()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    elements {
        get => this.get_elements()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    attributeGroups {
        get => this.get_attributeGroups()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    modelGroups {
        get => this.get_modelGroups()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    notations {
        get => this.get_notations()
    }

    /**
     * @type {ISchemaStringCollection} 
     */
    schemaLocations {
        get => this.get_schemaLocations()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_targetNamespace() {
        targetNamespace := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, targetNamespace, "HRESULT")
        return targetNamespace
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        _version := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, _version, "HRESULT")
        return _version
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_types() {
        result := ComCall(16, this, "ptr*", &types := 0, "HRESULT")
        return ISchemaItemCollection(types)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_elements() {
        result := ComCall(17, this, "ptr*", &elements := 0, "HRESULT")
        return ISchemaItemCollection(elements)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_attributes() {
        result := ComCall(18, this, "ptr*", &attributes := 0, "HRESULT")
        return ISchemaItemCollection(attributes)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_attributeGroups() {
        result := ComCall(19, this, "ptr*", &attributeGroups := 0, "HRESULT")
        return ISchemaItemCollection(attributeGroups)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_modelGroups() {
        result := ComCall(20, this, "ptr*", &modelGroups := 0, "HRESULT")
        return ISchemaItemCollection(modelGroups)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_notations() {
        result := ComCall(21, this, "ptr*", &notations := 0, "HRESULT")
        return ISchemaItemCollection(notations)
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_schemaLocations() {
        result := ComCall(22, this, "ptr*", &schemaLocations := 0, "HRESULT")
        return ISchemaStringCollection(schemaLocations)
    }

    Query(iid) {
        if (ISchema.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_targetNamespace := CallbackCreate(GetMethod(implObj, "get_targetNamespace"), flags, 2)
        this.vtbl.get_version := CallbackCreate(GetMethod(implObj, "get_version"), flags, 2)
        this.vtbl.get_types := CallbackCreate(GetMethod(implObj, "get_types"), flags, 2)
        this.vtbl.get_elements := CallbackCreate(GetMethod(implObj, "get_elements"), flags, 2)
        this.vtbl.get_attributes := CallbackCreate(GetMethod(implObj, "get_attributes"), flags, 2)
        this.vtbl.get_attributeGroups := CallbackCreate(GetMethod(implObj, "get_attributeGroups"), flags, 2)
        this.vtbl.get_modelGroups := CallbackCreate(GetMethod(implObj, "get_modelGroups"), flags, 2)
        this.vtbl.get_notations := CallbackCreate(GetMethod(implObj, "get_notations"), flags, 2)
        this.vtbl.get_schemaLocations := CallbackCreate(GetMethod(implObj, "get_schemaLocations"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_targetNamespace)
        CallbackFree(this.vtbl.get_version)
        CallbackFree(this.vtbl.get_types)
        CallbackFree(this.vtbl.get_elements)
        CallbackFree(this.vtbl.get_attributes)
        CallbackFree(this.vtbl.get_attributeGroups)
        CallbackFree(this.vtbl.get_modelGroups)
        CallbackFree(this.vtbl.get_notations)
        CallbackFree(this.vtbl.get_schemaLocations)
    }
}
