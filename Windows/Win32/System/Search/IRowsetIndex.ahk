#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetIndex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetIndex
     * @type {Guid}
     */
    static IID => Guid("{0c733a82-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndexInfo", "Seek", "SetRange"]

    /**
     * 
     * @param {Pointer<Pointer>} pcKeyColumns 
     * @param {Pointer<Pointer<DBINDEXCOLUMNDESC>>} prgIndexColumnDesc 
     * @param {Pointer<Integer>} pcIndexPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgIndexPropertySets 
     * @returns {HRESULT} 
     */
    GetIndexInfo(pcKeyColumns, prgIndexColumnDesc, pcIndexPropertySets, prgIndexPropertySets) {
        result := ComCall(3, this, "ptr*", pcKeyColumns, "ptr*", prgIndexColumnDesc, "uint*", pcIndexPropertySets, "ptr*", prgIndexPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer} cKeyValues 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dwSeekOptions 
     * @returns {HRESULT} 
     */
    Seek(hAccessor, cKeyValues, pData, dwSeekOptions) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(4, this, "ptr", hAccessor, "ptr", cKeyValues, "ptr", pData, "uint", dwSeekOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer} cStartKeyColumns 
     * @param {Pointer<Void>} pStartData 
     * @param {Pointer} cEndKeyColumns 
     * @param {Pointer<Void>} pEndData 
     * @param {Integer} dwRangeOptions 
     * @returns {HRESULT} 
     */
    SetRange(hAccessor, cStartKeyColumns, pStartData, cEndKeyColumns, pEndData, dwRangeOptions) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(5, this, "ptr", hAccessor, "ptr", cStartKeyColumns, "ptr", pStartData, "ptr", cEndKeyColumns, "ptr", pEndData, "uint", dwRangeOptions, "HRESULT")
        return result
    }
}
