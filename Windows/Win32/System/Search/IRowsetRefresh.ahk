#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetRefresh extends IUnknown{
    /**
     * The interface identifier for IRowsetRefresh
     * @type {Guid}
     */
    static IID => Guid("{0c733aa9-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {BOOL} fOverWrite 
     * @param {Pointer<UIntPtr>} pcRowsRefreshed 
     * @param {Pointer<UIntPtr>} prghRowsRefreshed 
     * @param {Pointer<UInt32>} prgRowStatus 
     * @returns {HRESULT} 
     */
    RefreshVisibleData(hChapter, cRows, rghRows, fOverWrite, pcRowsRefreshed, prghRowsRefreshed, prgRowStatus) {
        result := ComCall(3, this, "ptr", hChapter, "ptr", cRows, "ptr*", rghRows, "int", fOverWrite, "ptr*", pcRowsRefreshed, "ptr*", prghRowsRefreshed, "uint*", prgRowStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    GetLastVisibleData(hRow, hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(4, this, "ptr", hRow, "ptr", hAccessor, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
