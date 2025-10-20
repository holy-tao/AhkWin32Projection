#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} abstract 
     * @returns {HRESULT} 
     */
    get_isAbstract(abstract) {
        result := ComCall(31, this, "ptr", abstract, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaAny>} anyAttribute 
     * @returns {HRESULT} 
     */
    get_anyAttribute(anyAttribute) {
        result := ComCall(32, this, "ptr*", anyAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} attributes 
     * @returns {HRESULT} 
     */
    get_attributes(attributes) {
        result := ComCall(33, this, "ptr*", attributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} contentType 
     * @returns {HRESULT} 
     */
    get_contentType(contentType) {
        result := ComCall(34, this, "int*", contentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaModelGroup>} contentModel 
     * @returns {HRESULT} 
     */
    get_contentModel(contentModel) {
        result := ComCall(35, this, "ptr*", contentModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prohibited 
     * @returns {HRESULT} 
     */
    get_prohibitedSubstitutions(prohibited) {
        result := ComCall(36, this, "int*", prohibited, "HRESULT")
        return result
    }
}
