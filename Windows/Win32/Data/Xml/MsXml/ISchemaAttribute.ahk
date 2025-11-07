#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaType.ahk
#Include .\ISchemaComplexType.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaAttribute extends ISchemaItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaAttribute
     * @type {Guid}
     */
    static IID => Guid("{50ea08b6-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_type", "get_scope", "get_defaultValue", "get_fixedValue", "get_use", "get_isReference"]

    /**
     * 
     * @returns {ISchemaType} 
     */
    get_type() {
        result := ComCall(14, this, "ptr*", &type := 0, "HRESULT")
        return ISchemaType(type)
    }

    /**
     * 
     * @returns {ISchemaComplexType} 
     */
    get_scope() {
        result := ComCall(15, this, "ptr*", &scope := 0, "HRESULT")
        return ISchemaComplexType(scope)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_defaultValue() {
        defaultValue := BSTR()
        result := ComCall(16, this, "ptr", defaultValue, "HRESULT")
        return defaultValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_fixedValue() {
        fixedValue := BSTR()
        result := ComCall(17, this, "ptr", fixedValue, "HRESULT")
        return fixedValue
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_use() {
        result := ComCall(18, this, "int*", &use := 0, "HRESULT")
        return use
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isReference() {
        result := ComCall(19, this, "short*", &reference := 0, "HRESULT")
        return reference
    }
}
