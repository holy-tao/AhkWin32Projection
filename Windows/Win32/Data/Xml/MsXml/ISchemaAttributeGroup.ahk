#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaAttributeGroup extends ISchemaItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaAttributeGroup
     * @type {Guid}
     */
    static IID => Guid("{50ea08ba-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_anyAttribute", "get_attributes"]

    /**
     * 
     * @param {Pointer<ISchemaAny>} anyAttribute 
     * @returns {HRESULT} 
     */
    get_anyAttribute(anyAttribute) {
        result := ComCall(14, this, "ptr*", anyAttribute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaItemCollection>} attributes 
     * @returns {HRESULT} 
     */
    get_attributes(attributes) {
        result := ComCall(15, this, "ptr*", attributes, "HRESULT")
        return result
    }
}
