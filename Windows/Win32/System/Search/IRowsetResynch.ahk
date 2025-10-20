#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetResynch extends IUnknown{
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
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    GetVisibleData(hRow, hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(3, this, "ptr", hRow, "ptr", hAccessor, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Pointer<UIntPtr>} pcRowsResynched 
     * @param {Pointer<UIntPtr>} prghRowsResynched 
     * @param {Pointer<UInt32>} prgRowStatus 
     * @returns {HRESULT} 
     */
    ResynchRows(cRows, rghRows, pcRowsResynched, prghRowsResynched, prgRowStatus) {
        result := ComCall(4, this, "ptr", cRows, "ptr*", rghRows, "ptr*", pcRowsResynched, "ptr*", prghRowsResynched, "uint*", prgRowStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
