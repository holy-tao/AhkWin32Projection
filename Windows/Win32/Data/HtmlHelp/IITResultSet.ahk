#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ROWSTATUS.ahk" { ROWSTATUS }
#Import ".\COLUMNSTATUS.ahk" { COLUMNSTATUS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRIORITY.ahk" { PRIORITY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\CProperty.ahk" { CProperty }

/**
 * Use this interface in run-time applications to initialize, build, and obtain information about result sets.
 * @see https://learn.microsoft.com/windows/win32/api/infotech/nn-infotech-iitresultset
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct IITResultSet extends IUnknown {
    /**
     * The interface identifier for IITResultSet
     * @type {Guid}
     */
    static IID := Guid("{3bb91d41-998b-11d0-a850-00aa006c7d01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IITResultSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetColumnPriority   : IntPtr
        SetColumnHeap       : IntPtr
        SetKeyProp          : IntPtr
        Add                 : IntPtr
        Add1                : IntPtr
        Add2                : IntPtr
        Add3                : IntPtr
        Append              : IntPtr
        Set                 : IntPtr
        Set1                : IntPtr
        Set2                : IntPtr
        Set3                : IntPtr
        Copy                : IntPtr
        AppendRows          : IntPtr
        Get                 : IntPtr
        GetKeyProp          : IntPtr
        GetColumnPriority   : IntPtr
        GetRowCount         : IntPtr
        GetColumnCount      : IntPtr
        GetColumn           : IntPtr
        GetColumn1          : IntPtr
        GetColumnFromPropID : IntPtr
        Clear               : IntPtr
        ClearRows           : IntPtr
        Free                : IntPtr
        IsCompleted         : IntPtr
        Cancel              : IntPtr
        Pause               : IntPtr
        GetRowStatus        : IntPtr
        GetColumnStatus     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IITResultSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {PRIORITY} ColumnPriority 
     * @returns {HRESULT} 
     */
    SetColumnPriority(lColumnIndex, ColumnPriority) {
        result := ComCall(3, this, "int", lColumnIndex, PRIORITY, ColumnPriority, "HRESULT")
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
        result := ComCall(6, this, "uint", PropID, "uint", dwDefaultData, PRIORITY, _Priority, "HRESULT")
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

        result := ComCall(7, this, "uint", PropID, "ptr", lpszwDefault, PRIORITY, _Priority, "HRESULT")
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

        result := ComCall(8, this, "uint", PropID, lpvDefaultDataMarshal, lpvDefaultData, "uint", cbData, PRIORITY, _Priority, "HRESULT")
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
        result := ComCall(17, this, "int", lRowIndex, "int", lColumnIndex, CProperty.Ptr, Prop, "HRESULT")
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
        result := ComCall(30, this, BOOL, fPause, "HRESULT")
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
        result := ComCall(31, this, "int", lRowFirst, "int", cRows, ROWSTATUS.Ptr, lpRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLUMNSTATUS>} lpColStatus 
     * @returns {HRESULT} 
     */
    GetColumnStatus(lpColStatus) {
        result := ComCall(32, this, COLUMNSTATUS.Ptr, lpColStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IITResultSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetColumnPriority := CallbackCreate(GetMethod(implObj, "SetColumnPriority"), flags, 3)
        this.vtbl.SetColumnHeap := CallbackCreate(GetMethod(implObj, "SetColumnHeap"), flags, 4)
        this.vtbl.SetKeyProp := CallbackCreate(GetMethod(implObj, "SetKeyProp"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 4)
        this.vtbl.Add1 := CallbackCreate(GetMethod(implObj, "Add1"), flags, 4)
        this.vtbl.Add2 := CallbackCreate(GetMethod(implObj, "Add2"), flags, 5)
        this.vtbl.Add3 := CallbackCreate(GetMethod(implObj, "Add3"), flags, 2)
        this.vtbl.Append := CallbackCreate(GetMethod(implObj, "Append"), flags, 3)
        this.vtbl.Set := CallbackCreate(GetMethod(implObj, "Set"), flags, 5)
        this.vtbl.Set1 := CallbackCreate(GetMethod(implObj, "Set1"), flags, 4)
        this.vtbl.Set2 := CallbackCreate(GetMethod(implObj, "Set2"), flags, 4)
        this.vtbl.Set3 := CallbackCreate(GetMethod(implObj, "Set3"), flags, 4)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 2)
        this.vtbl.AppendRows := CallbackCreate(GetMethod(implObj, "AppendRows"), flags, 5)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 4)
        this.vtbl.GetKeyProp := CallbackCreate(GetMethod(implObj, "GetKeyProp"), flags, 2)
        this.vtbl.GetColumnPriority := CallbackCreate(GetMethod(implObj, "GetColumnPriority"), flags, 3)
        this.vtbl.GetRowCount := CallbackCreate(GetMethod(implObj, "GetRowCount"), flags, 2)
        this.vtbl.GetColumnCount := CallbackCreate(GetMethod(implObj, "GetColumnCount"), flags, 2)
        this.vtbl.GetColumn := CallbackCreate(GetMethod(implObj, "GetColumn"), flags, 7)
        this.vtbl.GetColumn1 := CallbackCreate(GetMethod(implObj, "GetColumn1"), flags, 3)
        this.vtbl.GetColumnFromPropID := CallbackCreate(GetMethod(implObj, "GetColumnFromPropID"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.ClearRows := CallbackCreate(GetMethod(implObj, "ClearRows"), flags, 1)
        this.vtbl.Free := CallbackCreate(GetMethod(implObj, "Free"), flags, 1)
        this.vtbl.IsCompleted := CallbackCreate(GetMethod(implObj, "IsCompleted"), flags, 1)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 2)
        this.vtbl.GetRowStatus := CallbackCreate(GetMethod(implObj, "GetRowStatus"), flags, 4)
        this.vtbl.GetColumnStatus := CallbackCreate(GetMethod(implObj, "GetColumnStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetColumnPriority)
        CallbackFree(this.vtbl.SetColumnHeap)
        CallbackFree(this.vtbl.SetKeyProp)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Add1)
        CallbackFree(this.vtbl.Add2)
        CallbackFree(this.vtbl.Add3)
        CallbackFree(this.vtbl.Append)
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.Set1)
        CallbackFree(this.vtbl.Set2)
        CallbackFree(this.vtbl.Set3)
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.AppendRows)
        CallbackFree(this.vtbl.Get)
        CallbackFree(this.vtbl.GetKeyProp)
        CallbackFree(this.vtbl.GetColumnPriority)
        CallbackFree(this.vtbl.GetRowCount)
        CallbackFree(this.vtbl.GetColumnCount)
        CallbackFree(this.vtbl.GetColumn)
        CallbackFree(this.vtbl.GetColumn1)
        CallbackFree(this.vtbl.GetColumnFromPropID)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.ClearRows)
        CallbackFree(this.vtbl.Free)
        CallbackFree(this.vtbl.IsCompleted)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.GetRowStatus)
        CallbackFree(this.vtbl.GetColumnStatus)
    }
}
