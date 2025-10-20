#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowset.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetLocate extends IRowset{
    /**
     * The interface identifier for IRowsetLocate
     * @type {Guid}
     */
    static IID => Guid("{0c733a7d-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cbBookmark1 
     * @param {Pointer<Byte>} pBookmark1 
     * @param {Pointer} cbBookmark2 
     * @param {Pointer<Byte>} pBookmark2 
     * @param {Pointer<UInt32>} pComparison 
     * @returns {HRESULT} 
     */
    Compare(hReserved, cbBookmark1, pBookmark1, cbBookmark2, pBookmark2, pComparison) {
        result := ComCall(8, this, "ptr", hReserved, "ptr", cbBookmark1, "char*", pBookmark1, "ptr", cbBookmark2, "char*", pBookmark2, "uint*", pComparison, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved1 
     * @param {Pointer} hReserved2 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Byte>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} pcRowsObtained 
     * @param {Pointer<UIntPtr>} prghRows 
     * @returns {HRESULT} 
     */
    GetRowsAt(hReserved1, hReserved2, cbBookmark, pBookmark, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        result := ComCall(9, this, "ptr", hReserved1, "ptr", hReserved2, "ptr", cbBookmark, "char*", pBookmark, "ptr", lRowsOffset, "ptr", cRows, "ptr*", pcRowsObtained, "ptr*", prghRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<UIntPtr>} rgcbBookmarks 
     * @param {Pointer<Byte>} rgpBookmarks 
     * @param {Pointer<UIntPtr>} rghRows 
     * @param {Pointer<UInt32>} rgRowStatus 
     * @returns {HRESULT} 
     */
    GetRowsByBookmark(hReserved, cRows, rgcbBookmarks, rgpBookmarks, rghRows, rgRowStatus) {
        result := ComCall(10, this, "ptr", hReserved, "ptr", cRows, "ptr*", rgcbBookmarks, "char*", rgpBookmarks, "ptr*", rghRows, "uint*", rgRowStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cBookmarks 
     * @param {Pointer<UIntPtr>} rgcbBookmarks 
     * @param {Pointer<Byte>} rgpBookmarks 
     * @param {Pointer<UIntPtr>} rgHashedValues 
     * @param {Pointer<UInt32>} rgBookmarkStatus 
     * @returns {HRESULT} 
     */
    Hash(hReserved, cBookmarks, rgcbBookmarks, rgpBookmarks, rgHashedValues, rgBookmarkStatus) {
        result := ComCall(11, this, "ptr", hReserved, "ptr", cBookmarks, "ptr*", rgcbBookmarks, "char*", rgpBookmarks, "ptr*", rgHashedValues, "uint*", rgBookmarkStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
