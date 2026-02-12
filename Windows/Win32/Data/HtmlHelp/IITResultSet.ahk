#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface in run-time applications to initialize, build, and obtain information about result sets.
 * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nn-infotech-iitresultset
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
        result := ComCall(3, this, "int", lColumnIndex, "int", ColumnPriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Void>} lpvHeap 
     * @param {Pointer<PFNCOLHEAPFREE>} pfnColHeapFree_ 
     * @returns {HRESULT} 
     */
    SetColumnHeap(lColumnIndex, lpvHeap, pfnColHeapFree_) {
        lpvHeapMarshal := lpvHeap is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "int", lColumnIndex, lpvHeapMarshal, lpvHeap, "ptr", pfnColHeapFree_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} PropID 
     * @returns {HRESULT} 
     */
    SetKeyProp(PropID) {
        result := ComCall(5, this, "uint", PropID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Integer} PropID Property ID associated with column.
     * @param {Integer} dwDefaultData 
     * @param {Integer} Priority_ Download priority of column (PRIORITY_LOW, PRIORITY_NORMAL, or PRIORITY_HIGH).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add(PropID, dwDefaultData, Priority_) {
        result := ComCall(6, this, "uint", PropID, "uint", dwDefaultData, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Integer} PropID Property ID associated with column.
     * @param {PWSTR} lpszwDefault 
     * @param {Integer} Priority_ Download priority of column (PRIORITY_LOW, PRIORITY_NORMAL, or PRIORITY_HIGH).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add1(PropID, lpszwDefault, Priority_) {
        lpszwDefault := lpszwDefault is String ? StrPtr(lpszwDefault) : lpszwDefault

        result := ComCall(7, this, "uint", PropID, "ptr", lpszwDefault, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a column to the result set. (overload 3/3)
     * @remarks
     * This method is used to add a column for pointer properties.
     * @param {Integer} PropID Property ID associated with column.
     * @param {Pointer<Void>} lpvDefaultData Buffer containing default value of data.
     * @param {Integer} cbData Buffer size.
     * @param {Integer} Priority_ Download priority of column (PRIORITY_LOW, PRIORITY_NORMAL, or PRIORITY_HIGH).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add2(PropID, lpvDefaultData, cbData, Priority_) {
        lpvDefaultDataMarshal := lpvDefaultData is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", PropID, lpvDefaultDataMarshal, lpvDefaultData, "uint", cbData, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-iitresultset-add(propid_lpvoid_dword_priority)
     */
    Add3(lpvHdr) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, lpvHdrMarshal, lpvHdr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-so-append
     */
    Append(lpvHdr, lpvData) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, lpvHdrMarshal, lpvHdr, lpvDataMarshal, lpvData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer<Void>} lpvData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set(lRowIndex, lColumnIndex, lpvData, cbData) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "int", lRowIndex, "int", lColumnIndex, lpvDataMarshal, lpvData, "uint", cbData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {PWSTR} lpwStr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set1(lRowIndex, lColumnIndex, lpwStr) {
        lpwStr := lpwStr is String ? StrPtr(lpwStr) : lpwStr

        result := ComCall(12, this, "int", lRowIndex, "int", lColumnIndex, "ptr", lpwStr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @param {Integer} lRowIndex 
     * @param {Integer} lColumnIndex 
     * @param {Pointer} dwData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set2(lRowIndex, lColumnIndex, dwData) {
        result := ComCall(13, this, "int", lRowIndex, "int", lColumnIndex, "ptr", dwData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Set Large Data (Native Client OLE DB provider)
     * @param {Integer} lRowIndex 
     * @param {Pointer<Void>} lpvHdr 
     * @param {Pointer<Void>} lpvData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/set-large-data-ole-db
     */
    Set3(lRowIndex, lpvHdr, lpvData) {
        lpvHdrMarshal := lpvHdr is VarRef ? "ptr" : "ptr"
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(14, this, "int", lRowIndex, lpvHdrMarshal, lpvHdr, lpvDataMarshal, lpvData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Describes the four steps to take to copy and paste a formula from one cell into another using CTRL+C and CTRL+V.
     * @param {IITResultSet} pRSCopy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/copy-and-paste-a-formula-from-one-cell-into-another
     */
    Copy(pRSCopy) {
        result := ComCall(15, this, "ptr", pRSCopy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(16, this, "ptr", pResSrc, "int", lRowSrcFirst, "int", cSrcRows, lRowFirstDestMarshal, lRowFirstDest, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-iitresultset-get
     */
    Get(lRowIndex, lColumnIndex, Prop) {
        result := ComCall(17, this, "int", lRowIndex, "int", lColumnIndex, "ptr", Prop, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} KeyPropID 
     * @returns {HRESULT} 
     */
    GetKeyProp(KeyPropID) {
        KeyPropIDMarshal := KeyPropID is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, KeyPropIDMarshal, KeyPropID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(19, this, "int", lColumnIndex, ColumnPriorityMarshal, ColumnPriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/infotech/nf-infotech-iitresultset-getrowcount
     */
    GetRowCount(lNumberOfRows) {
        lNumberOfRowsMarshal := lNumberOfRows is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, lNumberOfRowsMarshal, lNumberOfRows, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lNumberOfColumns 
     * @returns {HRESULT} 
     */
    GetColumnCount(lNumberOfColumns) {
        lNumberOfColumnsMarshal := lNumberOfColumns is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, lNumberOfColumnsMarshal, lNumberOfColumns, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(22, this, "int", lColumnIndex, PropIDMarshal, PropID, dwTypeMarshal, dwType, lpvDefaultValueMarshal, lpvDefaultValue, cbSizeMarshal, cbSize, ColumnPriorityMarshal, ColumnPriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(23, this, "int", lColumnIndex, PropIDMarshal, PropID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(24, this, "uint", PropID, lColumnIndexMarshal, lColumnIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearRows() {
        result := ComCall(26, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ws2tcpip/nf-ws2tcpip-freeaddrinfoex
     */
    Free() {
        result := ComCall(27, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsCompleted() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel() {
        result := ComCall(29, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @param {BOOL} fPause 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause(fPause) {
        result := ComCall(30, this, "int", fPause, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<COLUMNSTATUS>} lpColStatus 
     * @returns {HRESULT} 
     */
    GetColumnStatus(lpColStatus) {
        result := ComCall(32, this, "ptr", lpColStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
