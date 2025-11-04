#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetFind extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetFind
     * @type {Guid}
     */
    static IID => Guid("{0c733a9d-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindNextRow"]

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pFindValue 
     * @param {Integer} CompareOp 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    FindNextRow(hChapter, hAccessor, pFindValue, CompareOp, cbBookmark, pBookmark, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        pFindValueMarshal := pFindValue is VarRef ? "ptr" : "ptr"
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hChapter, "ptr", hAccessor, pFindValueMarshal, pFindValue, "uint", CompareOp, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "HRESULT")
        return result
    }
}
