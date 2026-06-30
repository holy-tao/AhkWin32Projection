#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\COLUMNSTATUS.ahk
#Include .\CProperty.ahk
#Include .\ROWSTATUS.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\PRIORITY.ahk

/**
 * Use this interface in run-time applications to initialize, build, and obtain information about result sets.
 * @see https://learn.microsoft.com/windows/win32/api/infotech/nn-infotech-iitresultset
 * @namespace Windows.Win32.Data.HtmlHelp
 */
class IITResultSet extends IUnknown {

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
     * @param {PRIORITY} ColumnPriority 
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
     * @param {Pointer<PFNCOLHEAPFREE>} _pfnColHeapFree 
     * @returns {HRESULT} 
     */
    SetColumnHeap(lColumnIndex, lpvHeap, _pfnColHeapFree) {
        lpvHeapMarshal := lpvHeap is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "int", lColumnIndex, lpvHeapMarshal, lpvHeap, "ptr", _pfnColHeapFree, "HRESULT")
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
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Integer} PropID Property ID associated with column.
     * @param {Integer} dwDefaultData 
     * @param {PRIORITY} _Priority Download priority of column (PRIORITY_LOW, PRIORITY_NORMAL, or PRIORITY_HIGH).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The column was successfully added. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add(PropID, dwDefaultData, _Priority) {
        result := ComCall(6, this, "uint", PropID, "uint", dwDefaultData, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Integer} PropID Property ID associated with column.
     * @param {PWSTR} lpszwDefault 
     * @param {PRIORITY} _Priority Download priority of column (PRIORITY_LOW, PRIORITY_NORMAL, or PRIORITY_HIGH).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The column was successfully added. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add1(PropID, lpszwDefault, _Priority) {
        lpszwDefault := lpszwDefault is String ? StrPtr(lpszwDefault) : lpszwDefault

        result := ComCall(7, this, "uint", PropID, "ptr", lpszwDefault, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Integer} PropID Property ID associated with column.
     * @param {Pointer<Void>} lpvDefaultData Buffer containing default value of data.
     * @param {Integer} cbData Buffer size.
     * @param {PRIORITY} _Priority Download priority of column (PRIORITY_LOW, PRIORITY_NORMAL, or PRIORITY_HIGH).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The column was successfully added. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add2(PropID, lpvDefaultData, cbData, _Priority) {
        lpvDefaultDataMarshal := lpvDefaultData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", PropID, lpvDefaultDataMarshal, lpvDefaultData, "uint", cbData, "int", _Priority, "HRESULT")
        return result
    }

    /**
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Pointer<Void>} lpvHdr 
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The column was successfully added. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add3(lpvHdr) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, lpvHdrMarshal, lpvHdr, "HRESULT")
        return result
    }

    /**
     * Append geometry-shader-output data to an existing stream.
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} | Item                                                                                                                             | Description                                                                                                                                            |
     * |----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="StreamDataType"></span><span id="streamdatatype"></span><span id="STREAMDATATYPE"></span>**StreamDataType**<br/> | A data input description. This description must match the stream-object template parameter called [DataType](dx-graphics-hlsl-so-type.md).<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * None
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-so-append
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
     * Gets the property in the specified row and column and fills the given property object.
     * @param {Integer} lRowIndex Row where property belongs.
     * @param {Integer} lColumnIndex 
     * @param {Pointer<CProperty>} Prop Column where property belongs.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The row was successfully retrieved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The row or column does not exist in the row set.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
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
     * @param {Pointer<PRIORITY>} ColumnPriority 
     * @returns {HRESULT} 
     */
    GetColumnPriority(lColumnIndex, ColumnPriority) {
        ColumnPriorityMarshal := ColumnPriority is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, "int", lColumnIndex, ColumnPriorityMarshal, ColumnPriority, "HRESULT")
        return result
    }

    /**
     * Gets the number of rows in a result set.
     * @param {Pointer<Integer>} lNumberOfRows Number of rows.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of rows was successfully retrieved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
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
     * @param {Pointer<PRIORITY>} ColumnPriority 
     * @returns {HRESULT} 
     */
    GetColumn(lColumnIndex, PropID, dwType, lpvDefaultValue, cbSize, ColumnPriority) {
        PropIDMarshal := PropID is VarRef ? "uint*" : "ptr"
        dwTypeMarshal := dwType is VarRef ? "uint*" : "ptr"
        lpvDefaultValueMarshal := lpvDefaultValue is VarRef ? "ptr*" : "ptr"
        cbSizeMarshal := cbSize is VarRef ? "uint*" : "ptr"
        ColumnPriorityMarshal := ColumnPriority is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "int", lColumnIndex, PropIDMarshal, PropID, dwTypeMarshal, dwType, lpvDefaultValueMarshal, lpvDefaultValue, cbSizeMarshal, cbSize, ColumnPriorityMarshal, ColumnPriority, "HRESULT")
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
     * Resets the TPM to its factory-default state.
     * @remarks
     * Running this method can help prepare a TPM-equipped computer for recycling.
     * 
     * To clear the TPM but no longer have the TPM owner authorization, you need physical access to the computer. The [**SetPhysicalPresenceRequest**](setphysicalpresencerequest-win32-tpm.md) method includes functionality to help clear the TPM without TPM owner authorization.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * The following table lists some of the common return codes.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                         | Description                                                                                                                                                                          |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                         | The method was successful.<br/>                                                                                                                                                |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl>              | The provided owner authorization value cannot perform the request.<br/>                                                                                                        |
     * | <dl> <dt>**TPM\_E\_DEFEND\_LOCK\_RUNNING**</dt> <dt>2150107139 (0x80280803)</dt> </dl> | The TPM is defending against dictionary attacks and is in a time-out period. For more information, see the [**ResetAuthLockOut**](resetauthlockout-win32-tpm.md) method.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/clear-win32-tpm
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
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @param {BOOL} fPause 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
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
