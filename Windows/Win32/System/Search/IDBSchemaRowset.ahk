#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBSchemaRowset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBSchemaRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a7b-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRowset", "GetSchemas"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} rguidSchema 
     * @param {Integer} cRestrictions 
     * @param {Pointer<VARIANT>} rgRestrictions 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    GetRowset(pUnkOuter, rguidSchema, cRestrictions, rgRestrictions, riid, cPropertySets, rgPropertySets) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", rguidSchema, "uint", cRestrictions, "ptr", rgRestrictions, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcSchemas 
     * @param {Pointer<Pointer<Guid>>} prgSchemas 
     * @param {Pointer<Pointer<Integer>>} prgRestrictionSupport 
     * @returns {HRESULT} 
     */
    GetSchemas(pcSchemas, prgSchemas, prgRestrictionSupport) {
        pcSchemasMarshal := pcSchemas is VarRef ? "uint*" : "ptr"
        prgSchemasMarshal := prgSchemas is VarRef ? "ptr*" : "ptr"
        prgRestrictionSupportMarshal := prgRestrictionSupport is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcSchemasMarshal, pcSchemas, prgSchemasMarshal, prgSchemas, prgRestrictionSupportMarshal, prgRestrictionSupport, "HRESULT")
        return result
    }
}
