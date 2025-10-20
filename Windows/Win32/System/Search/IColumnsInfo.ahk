#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnsInfo extends IUnknown{
    /**
     * The interface identifier for IColumnsInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a11-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UIntPtr>} pcColumns 
     * @param {Pointer<DBCOLUMNINFO>} prgInfo 
     * @param {Pointer<UInt16>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    GetColumnInfo(pcColumns, prgInfo, ppStringsBuffer) {
        result := ComCall(3, this, "ptr*", pcColumns, "ptr", prgInfo, "ushort*", ppStringsBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cColumnIDs 
     * @param {Pointer<DBID>} rgColumnIDs 
     * @param {Pointer<UIntPtr>} rgColumns 
     * @returns {HRESULT} 
     */
    MapColumnIDs(cColumnIDs, rgColumnIDs, rgColumns) {
        result := ComCall(4, this, "ptr", cColumnIDs, "ptr", rgColumnIDs, "ptr*", rgColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
