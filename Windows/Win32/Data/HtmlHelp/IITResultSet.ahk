#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface in run-time applications to initialize, build, and obtain information about result sets.
 * @see https://learn.microsoft.com/windows/win32/api/infotech/nn-infotech-iitresultset
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
     * @param {Integer} _Priority 
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
     * @param {Integer} _Priority 
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
     * @param {Integer} _Priority 
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
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbData 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setabortproc
     */
    Set(lRowIndex, lColumnIndex, lpvData, cbData) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "int", lRowIndex, "int", lColumnIndex, lpvDataMarshal, lpvData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {PWSTR} lpwStr 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setabortproc
     */
    Set1(lRowIndex, lColumnIndex, lpwStr) {
        lpwStr := lpwStr is String ? StrPtr(lpwStr) : lpwStr

        result := ComCall(12, this, "int", lRowIndex, "int", lColumnIndex, "ptr", lpwStr, "HRESULT")
        return result
    }

    /**
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer} dwData 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setabortproc
     */
    Set2(lRowIndex, lColumnIndex, dwData) {
        result := ComCall(13, this, "int", lRowIndex, "int", lColumnIndex, "ptr", dwData, "HRESULT")
        return result
    }

    /**
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * @param {Integer} lRowIndex 
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setabortproc
     */
    Set3(lRowIndex, lpvHdr, lpvData) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(14, this, "int", lRowIndex, lpvHdrMarshal, lpvHdr, lpvDataMarshal, lpvData, "HRESULT")
        return result
    }

    /**
     * Copies the specified accelerator table. This function is used to obtain the accelerator-table data that corresponds to an accelerator-table handle, or to determine the size of the accelerator-table data. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winuser.h header defines CopyAcceleratorTable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {IITResultSet} pRSCopy 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * If 
     *       <i>lpAccelDst</i> is <b>NULL</b>, the return value specifies the number of accelerator-table entries in the original table. Otherwise, it specifies the number of accelerator-table entries that were copied.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-copyacceleratortablew
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
     * @param {Pointer<Integer>} ColumnPriority 
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
     * @param {Pointer<Integer>} ColumnPriority 
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
     * The FreeAddrInfoEx function (ws2tcpip.h) frees address information that the GetAddrInfoEx function dynamically allocates in addrinfoex structures.
     * @remarks
     * The 
     * <b>FreeAddrInfoEx</b> function frees <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-addrinfoexw">addrinfoex</a> structures dynamically allocated by the  <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> function. The <b>FreeAddrInfoEx</b> function frees the initial 
     * <b>addrinfoex</b> structure pointed to in the <i>pAddrInfo</i> parameter, including any buffers to which structure members point, then continues freeing any 
     * <b>addrinfoex</b> structures linked by the <b>ai_next</b> member of the <b>addrinfoex</b> structure. The 
     * <b>FreeAddrInfoEx</b> function continues freeing linked structures until a <b>NULL</b> <b>ai_next</b> member is encountered.
     * 
     * When UNICODE or _UNICODE is defined, <b>FreeAddrInfoEx</b> is defined to <b>FreeAddrInfoExW</b>, the Unicode version of the function, and <b>ADDRINFOEX</b> is defined to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-addrinfoexw">addrinfoexW</a> structure. When UNICODE or _UNICODE is not defined, <b>FreeAddrInfoEx</b> is defined to <b>FreeAddrInfoExA</b>, the ANSI version of the function, and <b>ADDRINFOEX</b> is defined to the <b>addrinfoexA</b> structure. 
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: The <b>FreeAddrInfoExW</b> function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @returns {HRESULT} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-freeaddrinfoex
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
     * Use the Cancel-Session packet to terminate the upload session with the BITS server.
     * @remarks
     * This packet cancels an upload job if it is sent before the last fragment is sent. Cancel-Session has no effect on a file whose last fragment has already been sent. When the BITS server receives the last fragment, it writes the file to its final destination and, in the case of an upload-reply, posts the file to the server application. In the upload-reply case, the Cancel-Session packet cancels the reply portion of an upload-reply job.
     * 
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * The BITS client sends this packet when the user cancels the job.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/cancel-session
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
