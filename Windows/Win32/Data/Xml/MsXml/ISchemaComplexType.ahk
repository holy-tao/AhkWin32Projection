#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaAny.ahk
#Include .\ISchemaItemCollection.ahk
#Include .\ISchemaModelGroup.ahk
#Include .\ISchemaType.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaComplexType extends ISchemaType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaComplexType
     * @type {Guid}
     */
    static IID => Guid("{50ea08b9-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isAbstract", "get_anyAttribute", "get_attributes", "get_contentType", "get_contentModel", "get_prohibitedSubstitutions"]

    /**
     * @type {VARIANT_BOOL} 
     */
    isAbstract {
        get => this.get_isAbstract()
    }

    /**
     * @type {ISchemaAny} 
     */
    anyAttribute {
        get => this.get_anyAttribute()
    }

    /**
     * @type {ISchemaItemCollection} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * @type {Integer} 
     */
    contentType {
        get => this.get_contentType()
    }

    /**
     * @type {ISchemaModelGroup} 
     */
    contentModel {
        get => this.get_contentModel()
    }

    /**
     * @type {Integer} 
     */
    prohibitedSubstitutions {
        get => this.get_prohibitedSubstitutions()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isAbstract() {
        result := ComCall(31, this, "short*", &abstract := 0, "HRESULT")
        return abstract
    }

    /**
     * 
     * @returns {ISchemaAny} 
     */
    get_anyAttribute() {
        result := ComCall(32, this, "ptr*", &anyAttribute := 0, "HRESULT")
        return ISchemaAny(anyAttribute)
    }

    /**
     * 
     * @returns {ISchemaItemCollection} 
     */
    get_attributes() {
        result := ComCall(33, this, "ptr*", &attributes := 0, "HRESULT")
        return ISchemaItemCollection(attributes)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_contentType() {
        result := ComCall(34, this, "int*", &contentType := 0, "HRESULT")
        return contentType
    }

    /**
     * 
     * @returns {ISchemaModelGroup} 
     */
    get_contentModel() {
        result := ComCall(35, this, "ptr*", &contentModel := 0, "HRESULT")
        return ISchemaModelGroup(contentModel)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_prohibitedSubstitutions() {
        result := ComCall(36, this, "int*", &prohibited := 0, "HRESULT")
        return prohibited
    }
}
