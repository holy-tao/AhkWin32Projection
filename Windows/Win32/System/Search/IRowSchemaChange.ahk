#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowChange.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowSchemaChange extends IRowChange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowSchemaChange
     * @type {Guid}
     */
    static IID => Guid("{0c733aae-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteColumns", "AddColumns"]

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBID>} rgColumnIDs 
     * @param {Pointer<Integer>} rgdwStatus 
     * @returns {HRESULT} 
     */
    DeleteColumns(cColumns, rgColumnIDs, rgdwStatus) {
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", cColumns, "ptr", rgColumnIDs, rgdwStatusMarshal, rgdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBCOLUMNINFO>} rgNewColumnInfo 
     * @param {Pointer<DBCOLUMNACCESS>} rgColumns 
     * @returns {HRESULT} 
     */
    AddColumns(cColumns, rgNewColumnInfo, rgColumns) {
        result := ComCall(5, this, "ptr", cColumns, "ptr", rgNewColumnInfo, "ptr", rgColumns, "HRESULT")
        return result
    }
}
