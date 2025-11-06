#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetResynch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetResynch
     * @type {Guid}
     */
    static IID => Guid("{0c733a84-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisibleData", "ResynchRows"]

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @returns {Void} 
     */
    GetVisibleData(hRow, hAccessor) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(3, this, "ptr", hRow, "ptr", hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Pointer>} pcRowsResynched 
     * @param {Pointer<Pointer<Pointer>>} prghRowsResynched 
     * @param {Pointer<Pointer<Integer>>} prgRowStatus 
     * @returns {HRESULT} 
     */
    ResynchRows(cRows, rghRows, pcRowsResynched, prghRowsResynched, prgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        pcRowsResynchedMarshal := pcRowsResynched is VarRef ? "ptr*" : "ptr"
        prghRowsResynchedMarshal := prghRowsResynched is VarRef ? "ptr*" : "ptr"
        prgRowStatusMarshal := prgRowStatus is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cRows, rghRowsMarshal, rghRows, pcRowsResynchedMarshal, pcRowsResynched, prghRowsResynchedMarshal, prghRowsResynched, prgRowStatusMarshal, prgRowStatus, "HRESULT")
        return result
    }
}
