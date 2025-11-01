#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IColumnsInfo.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnsInfo2 extends IColumnsInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColumnsInfo2
     * @type {Guid}
     */
    static IID => Guid("{0c733ab8-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRestrictedColumnInfo"]

    /**
     * 
     * @param {Pointer} cColumnIDMasks 
     * @param {Pointer<DBID>} rgColumnIDMasks 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer>} pcColumns 
     * @param {Pointer<Pointer<DBID>>} prgColumnIDs 
     * @param {Pointer<Pointer<DBCOLUMNINFO>>} prgColumnInfo 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    GetRestrictedColumnInfo(cColumnIDMasks, rgColumnIDMasks, dwFlags, pcColumns, prgColumnIDs, prgColumnInfo, ppStringsBuffer) {
        pcColumnsMarshal := pcColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cColumnIDMasks, "ptr", rgColumnIDMasks, "uint", dwFlags, pcColumnsMarshal, pcColumns, "ptr*", prgColumnIDs, "ptr*", prgColumnInfo, "ptr*", ppStringsBuffer, "HRESULT")
        return result
    }
}
