#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetChange extends IUnknown{
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
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Pointer<UInt32>} rgRowStatus 
     * @returns {HRESULT} 
     */
    DeleteRows(hReserved, cRows, rghRows, rgRowStatus) {
        result := ComCall(3, this, "ptr", hReserved, "ptr", cRows, "ptr*", rghRows, "uint*", rgRowStatus, "int")
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
    SetData(hRow, hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(4, this, "ptr", hRow, "ptr", hAccessor, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<UIntPtr>} phRow 
     * @returns {HRESULT} 
     */
    InsertRow(hReserved, hAccessor, pData, phRow) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(5, this, "ptr", hReserved, "ptr", hAccessor, "ptr", pData, "ptr*", phRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
