#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItemCollection.ahk
#Include .\ISchemaStringCollection.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchema extends ISchemaItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchema
     * @type {Guid}
     */
    static IID => Guid("{50ea08b4-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_targetNamespace", "get_version", "get_types", "get_elements", "get_attributes", "get_attributeGroups", "get_modelGroups", "get_notations", "get_schemaLocations"]

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
        targetNamespace := BSTR()
        result := ComCall(14, this, "ptr", targetNamespace, "HRESULT")
        return targetNamespace
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_version() {
        version := BSTR()
        result := ComCall(15, this, "ptr", version, "HRESULT")
        return version
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
}
