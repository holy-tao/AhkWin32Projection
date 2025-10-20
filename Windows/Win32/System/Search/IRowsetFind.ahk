#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetFind extends IUnknown{
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
     * 
     * @param {Pointer} hChapter 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pFindValue 
     * @param {Integer} CompareOp 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Byte>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} pcRowsObtained 
     * @param {Pointer<UIntPtr>} prghRows 
     * @returns {HRESULT} 
     */
    FindNextRow(hChapter, hAccessor, pFindValue, CompareOp, cbBookmark, pBookmark, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        result := ComCall(3, this, "ptr", hChapter, "ptr", hAccessor, "ptr", pFindValue, "uint", CompareOp, "ptr", cbBookmark, "char*", pBookmark, "ptr", lRowsOffset, "ptr", cRows, "ptr*", pcRowsObtained, "ptr*", prghRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
