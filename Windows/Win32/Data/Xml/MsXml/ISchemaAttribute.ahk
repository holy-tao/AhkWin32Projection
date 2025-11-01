#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<ISchemaType>} type 
     * @returns {HRESULT} 
     */
    get_type(type) {
        result := ComCall(14, this, "ptr*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaComplexType>} scope 
     * @returns {HRESULT} 
     */
    get_scope(scope) {
        result := ComCall(15, this, "ptr*", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} defaultValue 
     * @returns {HRESULT} 
     */
    get_defaultValue(defaultValue) {
        result := ComCall(16, this, "ptr", defaultValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} fixedValue 
     * @returns {HRESULT} 
     */
    get_fixedValue(fixedValue) {
        result := ComCall(17, this, "ptr", fixedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} use 
     * @returns {HRESULT} 
     */
    get_use(use) {
        result := ComCall(18, this, "int*", use, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} reference 
     * @returns {HRESULT} 
     */
    get_isReference(reference) {
        result := ComCall(19, this, "ptr", reference, "HRESULT")
        return result
    }
}
