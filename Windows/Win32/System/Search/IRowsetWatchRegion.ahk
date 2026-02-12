#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetWatchAll.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetWatchRegion extends IRowsetWatchAll{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetWatchRegion
     * @type {Guid}
     */
    static IID => Guid("{0c733a45-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWatchRegion", "ChangeWatchMode", "DeleteWatchRegion", "GetWatchRegionInfo", "Refresh", "ShrinkWatchRegion"]

    /**
     * 
     * @param {Integer} dwWatchMode 
     * @returns {Pointer} 
     */
    CreateWatchRegion(dwWatchMode) {
        result := ComCall(6, this, "uint", dwWatchMode, "ptr*", &phRegion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phRegion
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Integer} dwWatchMode 
     * @returns {HRESULT} 
     */
    ChangeWatchMode(hRegion, dwWatchMode) {
        result := ComCall(7, this, "ptr", hRegion, "uint", dwWatchMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @returns {HRESULT} 
     */
    DeleteWatchRegion(hRegion) {
        result := ComCall(8, this, "ptr", hRegion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Pointer<Integer>} pdwWatchMode 
     * @param {Pointer<Pointer>} phChapter 
     * @param {Pointer<Pointer>} pcbBookmark 
     * @param {Pointer<Pointer<Integer>>} ppBookmark 
     * @param {Pointer<Pointer>} pcRows 
     * @returns {HRESULT} 
     */
    GetWatchRegionInfo(hRegion, pdwWatchMode, phChapter, pcbBookmark, ppBookmark, pcRows) {
        pdwWatchModeMarshal := pdwWatchMode is VarRef ? "uint*" : "ptr"
        phChapterMarshal := phChapter is VarRef ? "ptr*" : "ptr"
        pcbBookmarkMarshal := pcbBookmark is VarRef ? "ptr*" : "ptr"
        ppBookmarkMarshal := ppBookmark is VarRef ? "ptr*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hRegion, pdwWatchModeMarshal, pdwWatchMode, phChapterMarshal, phChapter, pcbBookmarkMarshal, pcbBookmark, ppBookmarkMarshal, ppBookmark, pcRowsMarshal, pcRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Refresh Method (RDS)
     * @remarks
     * You must set the [Connect](./connect-property-rds.md), [Server](./server-property-rds.md), and [SQL](./sql-property.md) properties before you use the **Refresh** method. All data-bound controls on the form associated with an **RDS.DataControl** object will reflect the new set of records. Any pre-existing [Recordset](../ado-api/recordset-object-ado.md) object is released, and any unsaved changes are discarded. The **Refresh** method automatically makes the first record the current record.  
     *   
     *  It is a good idea to call the **Refresh** method periodically when you work with data. If you retrieve data, and then leave it on a client computer for a while, it is likely to become out of date. It is possible that any changes that you make will fail, because someone else might have changed the record and submitted changes before you.
     * @param {Pointer<Pointer>} pcChangesObtained 
     * @returns {Pointer<DBROWWATCHCHANGE>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/refresh-method-rds
     */
    Refresh(pcChangesObtained) {
        pcChangesObtainedMarshal := pcChangesObtained is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pcChangesObtainedMarshal, pcChangesObtained, "ptr*", &prgChanges := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prgChanges
    }

    /**
     * 
     * @param {Pointer} hRegion 
     * @param {Pointer} hChapter 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} cRows 
     * @returns {HRESULT} 
     */
    ShrinkWatchRegion(hRegion, hChapter, cbBookmark, pBookmark, cRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, "ptr", hRegion, "ptr", hChapter, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", cRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
