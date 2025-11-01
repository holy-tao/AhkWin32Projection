#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISchemaItem.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaIdentityConstraint extends ISchemaItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaIdentityConstraint
     * @type {Guid}
     */
    static IID => Guid("{50ea08bd-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_selector", "get_fields", "get_referencedKey"]

    /**
     * 
     * @param {Pointer<BSTR>} selector 
     * @returns {HRESULT} 
     */
    get_selector(selector) {
        result := ComCall(14, this, "ptr", selector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaStringCollection>} fields 
     * @returns {HRESULT} 
     */
    get_fields(fields) {
        result := ComCall(15, this, "ptr*", fields, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISchemaIdentityConstraint>} key 
     * @returns {HRESULT} 
     */
    get_referencedKey(key) {
        result := ComCall(16, this, "ptr*", key, "HRESULT")
        return result
    }
}
