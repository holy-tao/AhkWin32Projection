#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRowset.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetLocate extends IRowset{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compare", "GetRowsAt", "GetRowsByBookmark", "Hash"]

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {Pointer} hReserved 
     * @param {Pointer} cbBookmark1 
     * @param {Pointer<Integer>} pBookmark1 
     * @param {Pointer} cbBookmark2 
     * @param {Pointer<Integer>} pBookmark2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/compareaddresses
     */
    Compare(hReserved, cbBookmark1, pBookmark1, cbBookmark2, pBookmark2) {
        pBookmark1Marshal := pBookmark1 is VarRef ? "char*" : "ptr"
        pBookmark2Marshal := pBookmark2 is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", hReserved, "ptr", cbBookmark1, pBookmark1Marshal, pBookmark1, "ptr", cbBookmark2, pBookmark2Marshal, pBookmark2, "uint*", &pComparison := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pComparison
    }

    /**
     * 
     * @param {Pointer} hReserved1 
     * @param {Pointer} hReserved2 
     * @param {Pointer} cbBookmark 
     * @param {Pointer<Integer>} pBookmark 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetRowsAt(hReserved1, hReserved2, cbBookmark, pBookmark, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        pBookmarkMarshal := pBookmark is VarRef ? "char*" : "ptr"
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", hReserved1, "ptr", hReserved2, "ptr", cbBookmark, pBookmarkMarshal, pBookmark, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rgcbBookmarks 
     * @param {Pointer<Pointer<Integer>>} rgpBookmarks 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    GetRowsByBookmark(hReserved, cRows, rgcbBookmarks, rgpBookmarks, rghRows, rgRowStatus) {
        rgcbBookmarksMarshal := rgcbBookmarks is VarRef ? "ptr*" : "ptr"
        rgpBookmarksMarshal := rgpBookmarks is VarRef ? "ptr*" : "ptr"
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", hReserved, "ptr", cRows, rgcbBookmarksMarshal, rgcbBookmarks, rgpBookmarksMarshal, rgpBookmarks, rghRowsMarshal, rghRows, rgRowStatusMarshal, rgRowStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Hash Warning Event Class
     * @param {Pointer} hReserved 
     * @param {Pointer} cBookmarks 
     * @param {Pointer<Pointer>} rgcbBookmarks 
     * @param {Pointer<Pointer<Integer>>} rgpBookmarks 
     * @param {Pointer<Pointer>} rgHashedValues 
     * @param {Pointer<Integer>} rgBookmarkStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/event-classes/hash-warning-event-class
     */
    Hash(hReserved, cBookmarks, rgcbBookmarks, rgpBookmarks, rgHashedValues, rgBookmarkStatus) {
        rgcbBookmarksMarshal := rgcbBookmarks is VarRef ? "ptr*" : "ptr"
        rgpBookmarksMarshal := rgpBookmarks is VarRef ? "ptr*" : "ptr"
        rgHashedValuesMarshal := rgHashedValues is VarRef ? "ptr*" : "ptr"
        rgBookmarkStatusMarshal := rgBookmarkStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", hReserved, "ptr", cBookmarks, rgcbBookmarksMarshal, rgcbBookmarks, rgpBookmarksMarshal, rgpBookmarks, rgHashedValuesMarshal, rgHashedValues, rgBookmarkStatusMarshal, rgBookmarkStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
