#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} targetNamespace 
     * @returns {HRESULT} 
     */
    get_targetNamespace(targetNamespace) {
        result := ComCall(14, this, "ptr", targetNamespace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} version 
     * @returns {HRESULT} 
     */
    get_version(version) {
        result := ComCall(15, this, "ptr", version, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} types 
     * @returns {HRESULT} 
     */
    get_types(types) {
        result := ComCall(16, this, "ptr*", types, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} elements 
     * @returns {HRESULT} 
     */
    get_elements(elements) {
        result := ComCall(17, this, "ptr*", elements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} attributes 
     * @returns {HRESULT} 
     */
    get_attributes(attributes) {
        result := ComCall(18, this, "ptr*", attributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} attributeGroups 
     * @returns {HRESULT} 
     */
    get_attributeGroups(attributeGroups) {
        result := ComCall(19, this, "ptr*", attributeGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} modelGroups 
     * @returns {HRESULT} 
     */
    get_modelGroups(modelGroups) {
        result := ComCall(20, this, "ptr*", modelGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} notations 
     * @returns {HRESULT} 
     */
    get_notations(notations) {
        result := ComCall(21, this, "ptr*", notations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaStringCollection>} schemaLocations 
     * @returns {HRESULT} 
     */
    get_schemaLocations(schemaLocations) {
        result := ComCall(22, this, "ptr*", schemaLocations, "HRESULT")
        return result
    }
}
