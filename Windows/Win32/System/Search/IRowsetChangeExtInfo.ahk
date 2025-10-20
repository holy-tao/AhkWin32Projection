#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetChangeExtInfo extends IUnknown{
    /**
     * The interface identifier for IRowsetChangeExtInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a8f-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} hRow 
     * @param {Pointer<UIntPtr>} phRowOriginal 
     * @returns {HRESULT} 
     */
    GetOriginalRow(hReserved, hRow, phRowOriginal) {
        result := ComCall(3, this, "ptr", hReserved, "ptr", hRow, "ptr*", phRowOriginal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} hRow 
     * @param {Integer} cColumnOrdinals 
     * @param {Pointer<UInt32>} rgiOrdinals 
     * @param {Pointer<UInt32>} rgColumnStatus 
     * @returns {HRESULT} 
     */
    GetPendingColumns(hReserved, hRow, cColumnOrdinals, rgiOrdinals, rgColumnStatus) {
        result := ComCall(4, this, "ptr", hReserved, "ptr", hRow, "uint", cColumnOrdinals, "uint*", rgiOrdinals, "uint*", rgColumnStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
