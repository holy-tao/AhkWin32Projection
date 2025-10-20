#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface in run-time applications to initialize, build, and obtain information about result sets.
 * @see https://docs.microsoft.com/windows/win32/api//infotech/nn-infotech-iitresultset
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class IITResultSet extends IUnknown{
    /**
     * The interface identifier for IITResultSet
     * @type {Guid}
     */
    static IID => Guid("{3bb91d41-998b-11d0-a850-00aa006c7d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Integer} ColumnPriority 
     * @returns {HRESULT} 
     */
    SetColumnPriority(lColumnIndex, ColumnPriority) {
        result := ComCall(3, this, "int", lColumnIndex, "int", ColumnPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Void>} lpvHeap 
     * @param {Pointer<PFNCOLHEAPFREE>} pfnColHeapFree 
     * @returns {HRESULT} 
     */
    SetColumnHeap(lColumnIndex, lpvHeap, pfnColHeapFree) {
        result := ComCall(4, this, "int", lColumnIndex, "ptr", lpvHeap, "ptr", pfnColHeapFree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @returns {HRESULT} 
     */
    SetKeyProp(PropID) {
        result := ComCall(5, this, "uint", PropID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Integer} dwDefaultData 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    Add(PropID, dwDefaultData, Priority) {
        result := ComCall(6, this, "uint", PropID, "uint", dwDefaultData, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {PWSTR} lpszwDefault 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    Add(PropID, lpszwDefault, Priority) {
        lpszwDefault := lpszwDefault is String ? StrPtr(lpszwDefault) : lpszwDefault

        result := ComCall(7, this, "uint", PropID, "ptr", lpszwDefault, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Void>} lpvDefaultData 
     * @param {Integer} cbData 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    Add(PropID, lpvDefaultData, cbData, Priority) {
        result := ComCall(8, this, "uint", PropID, "ptr", lpvDefaultData, "uint", cbData, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHdr 
     * @returns {HRESULT} 
     */
    Add(lpvHdr) {
        result := ComCall(9, this, "ptr", lpvHdr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} 
     */
    Append(lpvHdr, lpvData) {
        result := ComCall(10, this, "ptr", lpvHdr, "ptr", lpvData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    Set(lRowIndex, lColumnIndex, lpvData, cbData) {
        result := ComCall(11, this, "int", lRowIndex, "int", lColumnIndex, "ptr", lpvData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {PWSTR} lpwStr 
     * @returns {HRESULT} 
     */
    Set(lRowIndex, lColumnIndex, lpwStr) {
        lpwStr := lpwStr is String ? StrPtr(lpwStr) : lpwStr

        result := ComCall(12, this, "int", lRowIndex, "int", lColumnIndex, "ptr", lpwStr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer} dwData 
     * @returns {HRESULT} 
     */
    Set(lRowIndex, lColumnIndex, dwData) {
        result := ComCall(13, this, "int", lRowIndex, "int", lColumnIndex, "ptr", dwData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} 
     */
    Set(lRowIndex, lpvHdr, lpvData) {
        result := ComCall(14, this, "int", lRowIndex, "ptr", lpvHdr, "ptr", lpvData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IITResultSet>} pRSCopy 
     * @returns {HRESULT} 
     */
    Copy(pRSCopy) {
        result := ComCall(15, this, "ptr", pRSCopy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IITResultSet>} pResSrc 
     * @param {Integer} lRowSrcFirst 
     * @param {Integer} cSrcRows 
     * @param {Pointer<Int32>} lRowFirstDest 
     * @returns {HRESULT} 
     */
    AppendRows(pResSrc, lRowSrcFirst, cSrcRows, lRowFirstDest) {
        result := ComCall(16, this, "ptr", pResSrc, "int", lRowSrcFirst, "int", cSrcRows, "int*", lRowFirstDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<CProperty>} Prop 
     * @returns {HRESULT} 
     */
    Get(lRowIndex, lColumnIndex, Prop) {
        result := ComCall(17, this, "int", lRowIndex, "int", lColumnIndex, "ptr", Prop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} KeyPropID 
     * @returns {HRESULT} 
     */
    GetKeyProp(KeyPropID) {
        result := ComCall(18, this, "uint*", KeyPropID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Int32>} ColumnPriority 
     * @returns {HRESULT} 
     */
    GetColumnPriority(lColumnIndex, ColumnPriority) {
        result := ComCall(19, this, "int", lColumnIndex, "int*", ColumnPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lNumberOfRows 
     * @returns {HRESULT} 
     */
    GetRowCount(lNumberOfRows) {
        result := ComCall(20, this, "int*", lNumberOfRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lNumberOfColumns 
     * @returns {HRESULT} 
     */
    GetColumnCount(lNumberOfColumns) {
        result := ComCall(21, this, "int*", lNumberOfColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<UInt32>} PropID 
     * @param {Pointer<UInt32>} dwType 
     * @param {Pointer<Void>} lpvDefaultValue 
     * @param {Pointer<UInt32>} cbSize 
     * @param {Pointer<Int32>} ColumnPriority 
     * @returns {HRESULT} 
     */
    GetColumn(lColumnIndex, PropID, dwType, lpvDefaultValue, cbSize, ColumnPriority) {
        result := ComCall(22, this, "int", lColumnIndex, "uint*", PropID, "uint*", dwType, "ptr", lpvDefaultValue, "uint*", cbSize, "int*", ColumnPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<UInt32>} PropID 
     * @returns {HRESULT} 
     */
    GetColumn(lColumnIndex, PropID) {
        result := ComCall(23, this, "int", lColumnIndex, "uint*", PropID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Int32>} lColumnIndex 
     * @returns {HRESULT} 
     */
    GetColumnFromPropID(PropID, lColumnIndex) {
        result := ComCall(24, this, "uint", PropID, "int*", lColumnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearRows() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Free() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsCompleted() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(29, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fPause 
     * @returns {HRESULT} 
     */
    Pause(fPause) {
        result := ComCall(30, this, "int", fPause, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRowFirst 
     * @param {Integer} cRows 
     * @param {Pointer<ROWSTATUS>} lpRowStatus 
     * @returns {HRESULT} 
     */
    GetRowStatus(lRowFirst, cRows, lpRowStatus) {
        result := ComCall(31, this, "int", lRowFirst, "int", cRows, "ptr", lpRowStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLUMNSTATUS>} lpColStatus 
     * @returns {HRESULT} 
     */
    GetColumnStatus(lpColStatus) {
        result := ComCall(32, this, "ptr", lpColStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
