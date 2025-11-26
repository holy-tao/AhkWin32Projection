#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaStringCollection.ahk
#Include .\ISchemaIdentityConstraint.ahk
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
     * @type {BSTR} 
     */
    selector {
        get => this.get_selector()
    }

    /**
     * @type {ISchemaStringCollection} 
     */
    fields {
        get => this.get_fields()
    }

    /**
     * @type {ISchemaIdentityConstraint} 
     */
    referencedKey {
        get => this.get_referencedKey()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_selector() {
        selector := BSTR()
        result := ComCall(14, this, "ptr", selector, "HRESULT")
        return selector
    }

    /**
     * 
     * @returns {ISchemaStringCollection} 
     */
    get_fields() {
        result := ComCall(15, this, "ptr*", &fields := 0, "HRESULT")
        return ISchemaStringCollection(fields)
    }

    /**
     * 
     * @returns {ISchemaIdentityConstraint} 
     */
    get_referencedKey() {
        result := ComCall(16, this, "ptr*", &key := 0, "HRESULT")
        return ISchemaIdentityConstraint(key)
    }
}
