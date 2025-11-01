#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IAlterTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlterTable
     * @type {Guid}
     */
    static IID => Guid("{0c733aa5-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AlterColumn", "AlterTable"]

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pColumnId 
     * @param {Integer} dwColumnDescFlags 
     * @param {Pointer<DBCOLUMNDESC>} pColumnDesc 
     * @returns {HRESULT} 
     */
    AlterColumn(pTableId, pColumnId, dwColumnDescFlags, pColumnDesc) {
        result := ComCall(3, this, "ptr", pTableId, "ptr", pColumnId, "uint", dwColumnDescFlags, "ptr", pColumnDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pNewTableId 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    AlterTable(pTableId, pNewTableId, cPropertySets, rgPropertySets) {
        result := ComCall(4, this, "ptr", pTableId, "ptr", pNewTableId, "uint", cPropertySets, "ptr", rgPropertySets, "HRESULT")
        return result
    }
}
