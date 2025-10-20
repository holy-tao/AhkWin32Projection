#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaType.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaComplexType extends ISchemaType{
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
     * 
     * @param {Pointer<VARIANT_BOOL>} abstract 
     * @returns {HRESULT} 
     */
    get_isAbstract(abstract) {
        result := ComCall(31, this, "ptr", abstract, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaAny>} anyAttribute 
     * @returns {HRESULT} 
     */
    get_anyAttribute(anyAttribute) {
        result := ComCall(32, this, "ptr", anyAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} attributes 
     * @returns {HRESULT} 
     */
    get_attributes(attributes) {
        result := ComCall(33, this, "ptr", attributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} contentType 
     * @returns {HRESULT} 
     */
    get_contentType(contentType) {
        result := ComCall(34, this, "int*", contentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaModelGroup>} contentModel 
     * @returns {HRESULT} 
     */
    get_contentModel(contentModel) {
        result := ComCall(35, this, "ptr", contentModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} prohibited 
     * @returns {HRESULT} 
     */
    get_prohibitedSubstitutions(prohibited) {
        result := ComCall(36, this, "int*", prohibited, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
