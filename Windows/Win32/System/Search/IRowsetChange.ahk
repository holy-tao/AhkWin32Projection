#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetChange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetChange
     * @type {Guid}
     */
    static IID => Guid("{0c733a05-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteRows", "SetData", "InsertRow"]

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    DeleteRows(hReserved, cRows, rghRows, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    SetData(hRow, hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", hRow, "ptr", hAccessor, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<Pointer>} phRow 
     * @returns {HRESULT} 
     */
    InsertRow(hReserved, hAccessor, pData, phRow) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"
        phRowMarshal := phRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", hReserved, "ptr", hAccessor, pDataMarshal, pData, phRowMarshal, phRow, "HRESULT")
        return result
    }
}
