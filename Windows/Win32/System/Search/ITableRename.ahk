#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITableRename extends IUnknown{
    /**
     * The interface identifier for ITableRename
     * @type {Guid}
     */
    static IID => Guid("{0c733a77-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pOldColumnId 
     * @param {Pointer<DBID>} pNewColumnId 
     * @returns {HRESULT} 
     */
    RenameColumn(pTableId, pOldColumnId, pNewColumnId) {
        result := ComCall(3, this, "ptr", pTableId, "ptr", pOldColumnId, "ptr", pNewColumnId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pOldTableId 
     * @param {Pointer<DBID>} pOldIndexId 
     * @param {Pointer<DBID>} pNewTableId 
     * @param {Pointer<DBID>} pNewIndexId 
     * @returns {HRESULT} 
     */
    RenameTable(pOldTableId, pOldIndexId, pNewTableId, pNewIndexId) {
        result := ComCall(4, this, "ptr", pOldTableId, "ptr", pOldIndexId, "ptr", pNewTableId, "ptr", pNewIndexId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
