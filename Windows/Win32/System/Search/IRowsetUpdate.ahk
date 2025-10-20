#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowsetChange.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetUpdate extends IRowsetChange{
    /**
     * The interface identifier for IRowsetUpdate
     * @type {Guid}
     */
    static IID => Guid("{0c733a6d-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    GetOriginalData(hRow, hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(6, this, "ptr", hRow, "ptr", hAccessor, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Integer} dwRowStatus 
     * @param {Pointer<UIntPtr>} pcPendingRows 
     * @param {Pointer<UIntPtr>} prgPendingRows 
     * @param {Pointer<UInt32>} prgPendingStatus 
     * @returns {HRESULT} 
     */
    GetPendingRows(hReserved, dwRowStatus, pcPendingRows, prgPendingRows, prgPendingStatus) {
        result := ComCall(7, this, "ptr", hReserved, "uint", dwRowStatus, "ptr*", pcPendingRows, "ptr*", prgPendingRows, "uint*", prgPendingStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Pointer<UInt32>} rgPendingStatus 
     * @returns {HRESULT} 
     */
    GetRowStatus(hReserved, cRows, rghRows, rgPendingStatus) {
        result := ComCall(8, this, "ptr", hReserved, "ptr", cRows, "ptr*", rghRows, "uint*", rgPendingStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Pointer<UIntPtr>} pcRowsUndone 
     * @param {Pointer<UIntPtr>} prgRowsUndone 
     * @param {Pointer<UInt32>} prgRowStatus 
     * @returns {HRESULT} 
     */
    Undo(hReserved, cRows, rghRows, pcRowsUndone, prgRowsUndone, prgRowStatus) {
        result := ComCall(9, this, "ptr", hReserved, "ptr", cRows, "ptr*", rghRows, "ptr*", pcRowsUndone, "ptr*", prgRowsUndone, "uint*", prgRowStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Pointer<UIntPtr>} pcRows 
     * @param {Pointer<UIntPtr>} prgRows 
     * @param {Pointer<UInt32>} prgRowStatus 
     * @returns {HRESULT} 
     */
    Update(hReserved, cRows, rghRows, pcRows, prgRows, prgRowStatus) {
        result := ComCall(10, this, "ptr", hReserved, "ptr", cRows, "ptr*", rghRows, "ptr*", pcRows, "ptr*", prgRows, "uint*", prgRowStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
