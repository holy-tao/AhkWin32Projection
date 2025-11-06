#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetRefresh extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RefreshVisibleData", "GetLastVisibleData"]

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {BOOL} fOverWrite 
     * @param {Pointer<Pointer>} pcRowsRefreshed 
     * @param {Pointer<Pointer<Pointer>>} prghRowsRefreshed 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     */
    RefreshVisibleData(hChapter, cRows, rghRows, fOverWrite, pcRowsRefreshed, prghRowsRefreshed, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsRefreshedMarshal := pcRowsRefreshed is VarRef ? "ptr*" : "ptr"
        prghRowsRefreshedMarshal := prghRowsRefreshed is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, "ptr", cRows, rghRowsMarshal, rghRows, "int", fOverWrite, pcRowsRefreshedMarshal, pcRowsRefreshed, prghRowsRefreshedMarshal, prghRowsRefreshed, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @returns {Void} 
     */
    GetLastVisibleData(hRow, hAccessor) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(4, this, "ptr", hRow, "ptr", hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }
}
