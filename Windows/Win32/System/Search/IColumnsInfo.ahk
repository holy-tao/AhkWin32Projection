#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnsInfo extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetColumnInfo", "MapColumnIDs"]

    /**
     * 
     * @param {Pointer<Pointer>} pcColumns 
     * @param {Pointer<Pointer<DBCOLUMNINFO>>} prgInfo 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    GetColumnInfo(pcColumns, prgInfo, ppStringsBuffer) {
        pcColumnsMarshal := pcColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcColumnsMarshal, pcColumns, "ptr*", prgInfo, "ptr*", ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cColumnIDs 
     * @param {Pointer<DBID>} rgColumnIDs 
     * @param {Pointer<Pointer>} rgColumns 
     * @returns {HRESULT} 
     */
    MapColumnIDs(cColumnIDs, rgColumnIDs, rgColumns) {
        rgColumnsMarshal := rgColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cColumnIDs, "ptr", rgColumnIDs, rgColumnsMarshal, rgColumns, "HRESULT")
        return result
    }
}
