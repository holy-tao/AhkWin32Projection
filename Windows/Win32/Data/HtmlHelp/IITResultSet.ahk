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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetColumnPriority", "SetColumnHeap", "SetKeyProp", "Add", "Add1", "Add2", "Add3", "Append", "Set", "Set1", "Set2", "Set3", "Copy", "AppendRows", "Get", "GetKeyProp", "GetColumnPriority", "GetRowCount", "GetColumnCount", "GetColumn", "GetColumn1", "GetColumnFromPropID", "Clear", "ClearRows", "Free", "IsCompleted", "Cancel", "Pause", "GetRowStatus", "GetColumnStatus"]

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Integer} ColumnPriority 
     * @returns {HRESULT} 
     */
    SetColumnPriority(lColumnIndex, ColumnPriority) {
        result := ComCall(3, this, "int", lColumnIndex, "int", ColumnPriority, "HRESULT")
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
        lpvHeapMarshal := lpvHeap is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "int", lColumnIndex, lpvHeapMarshal, lpvHeap, "ptr", pfnColHeapFree, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @returns {HRESULT} 
     */
    SetKeyProp(PropID) {
        result := ComCall(5, this, "uint", PropID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Integer} dwDefaultData 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add(PropID, dwDefaultData, Priority) {
        result := ComCall(6, this, "uint", PropID, "uint", dwDefaultData, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {PWSTR} lpszwDefault 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add1(PropID, lpszwDefault, Priority) {
        lpszwDefault := lpszwDefault is String ? StrPtr(lpszwDefault) : lpszwDefault

        result := ComCall(7, this, "uint", PropID, "ptr", lpszwDefault, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Void>} lpvDefaultData 
     * @param {Integer} cbData 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add2(PropID, lpvDefaultData, cbData, Priority) {
        lpvDefaultDataMarshal := lpvDefaultData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", PropID, lpvDefaultDataMarshal, lpvDefaultData, "uint", cbData, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHdr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add3(lpvHdr) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, lpvHdrMarshal, lpvHdr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} 
     */
    Append(lpvHdr, lpvData) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, lpvHdrMarshal, lpvHdr, lpvDataMarshal, lpvData, "HRESULT")
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
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "int", lRowIndex, "int", lColumnIndex, lpvDataMarshal, lpvData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {PWSTR} lpwStr 
     * @returns {HRESULT} 
     */
    Set1(lRowIndex, lColumnIndex, lpwStr) {
        lpwStr := lpwStr is String ? StrPtr(lpwStr) : lpwStr

        result := ComCall(12, this, "int", lRowIndex, "int", lColumnIndex, "ptr", lpwStr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer} dwData 
     * @returns {HRESULT} 
     */
    Set2(lRowIndex, lColumnIndex, dwData) {
        result := ComCall(13, this, "int", lRowIndex, "int", lColumnIndex, "ptr", dwData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} 
     */
    Set3(lRowIndex, lpvHdr, lpvData) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(14, this, "int", lRowIndex, lpvHdrMarshal, lpvHdr, lpvDataMarshal, lpvData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IITResultSet} pRSCopy 
     * @returns {HRESULT} 
     */
    Copy(pRSCopy) {
        result := ComCall(15, this, "ptr", pRSCopy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IITResultSet} pResSrc 
     * @param {Integer} lRowSrcFirst 
     * @param {Integer} cSrcRows 
     * @param {Pointer<Integer>} lRowFirstDest 
     * @returns {HRESULT} 
     */
    AppendRows(pResSrc, lRowSrcFirst, cSrcRows, lRowFirstDest) {
        lRowFirstDestMarshal := lRowFirstDest is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "ptr", pResSrc, "int", lRowSrcFirst, "int", cSrcRows, lRowFirstDestMarshal, lRowFirstDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<CProperty>} Prop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-get
     */
    Get(lRowIndex, lColumnIndex, Prop) {
        result := ComCall(17, this, "int", lRowIndex, "int", lColumnIndex, "ptr", Prop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} KeyPropID 
     * @returns {HRESULT} 
     */
    GetKeyProp(KeyPropID) {
        KeyPropIDMarshal := KeyPropID is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, KeyPropIDMarshal, KeyPropID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Integer>} ColumnPriority 
     * @returns {HRESULT} 
     */
    GetColumnPriority(lColumnIndex, ColumnPriority) {
        ColumnPriorityMarshal := ColumnPriority is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "int", lColumnIndex, ColumnPriorityMarshal, ColumnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lNumberOfRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-getrowcount
     */
    GetRowCount(lNumberOfRows) {
        lNumberOfRowsMarshal := lNumberOfRows is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, lNumberOfRowsMarshal, lNumberOfRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lNumberOfColumns 
     * @returns {HRESULT} 
     */
    GetColumnCount(lNumberOfColumns) {
        lNumberOfColumnsMarshal := lNumberOfColumns is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, lNumberOfColumnsMarshal, lNumberOfColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Integer>} PropID 
     * @param {Pointer<Integer>} dwType 
     * @param {Pointer<Pointer<Void>>} lpvDefaultValue 
     * @param {Pointer<Integer>} cbSize 
     * @param {Pointer<Integer>} ColumnPriority 
     * @returns {HRESULT} 
     */
    GetColumn(lColumnIndex, PropID, dwType, lpvDefaultValue, cbSize, ColumnPriority) {
        PropIDMarshal := PropID is VarRef ? "uint*" : "ptr"
        dwTypeMarshal := dwType is VarRef ? "uint*" : "ptr"
        cbSizeMarshal := cbSize is VarRef ? "uint*" : "ptr"
        ColumnPriorityMarshal := ColumnPriority is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "int", lColumnIndex, PropIDMarshal, PropID, dwTypeMarshal, dwType, "ptr*", lpvDefaultValue, cbSizeMarshal, cbSize, ColumnPriorityMarshal, ColumnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Integer>} PropID 
     * @returns {HRESULT} 
     */
    GetColumn1(lColumnIndex, PropID) {
        PropIDMarshal := PropID is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "int", lColumnIndex, PropIDMarshal, PropID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @param {Pointer<Integer>} lColumnIndex 
     * @returns {HRESULT} 
     */
    GetColumnFromPropID(PropID, lColumnIndex) {
        lColumnIndexMarshal := lColumnIndex is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "uint", PropID, lColumnIndexMarshal, lColumnIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearRows() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Free() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsCompleted() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fPause 
     * @returns {HRESULT} 
     */
    Pause(fPause) {
        result := ComCall(30, this, "int", fPause, "HRESULT")
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
        result := ComCall(31, this, "int", lRowFirst, "int", cRows, "ptr", lpRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLUMNSTATUS>} lpColStatus 
     * @returns {HRESULT} 
     */
    GetColumnStatus(lpColStatus) {
        result := ComCall(32, this, "ptr", lpColStatus, "HRESULT")
        return result
    }
}
