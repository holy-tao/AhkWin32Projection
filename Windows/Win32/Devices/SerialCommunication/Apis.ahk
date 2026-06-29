#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\HCOMDB.ahk" { HCOMDB }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */

;@region Functions
/**
 * ComDBOpen returns a handle to the COM port database.
 * @remarks
 * To close the COM port database, call <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbclose">ComDBClose</a> and supply the handle that was returned by <b>ComDBOpen</b>.
 * 
 * <b>ComDBOpen</b> is called from user mode.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/ff546481(v=vs.85)">Opening and Closing the COM Port Database</a>.
 * @param {Pointer<HCOMDB>} PHComDB Pointer, if the routine succeeds, to a handle to the COM port database. Otherwise, the routine sets <i>*PHComDB</i> to <b>HCOMDB_INVALID_HANDLE_VALUE</b>. <i>PHComDB</i> must be non-NULL.
 * @returns {Integer} <b>ComDBOpen</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The COM port database was successfully opened.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not open the database. To get extended error information, call <b>GetLastError</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbopen
 */
export ComDBOpen(PHComDB) {
    result := DllCall("MSPORTS.dll\ComDBOpen", HCOMDB.Ptr, PHComDB, Int32)
    return result
}

/**
 * ComDBClose closes a handle to the COM port database.
 * @remarks
 * To open the COM port database, call <b>ComDBOpen</b>.
 * 
 * <b>ComDBOpen</b> is called from user mode.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/ff546481(v=vs.85)">Opening and Closing the COM Port Database</a>.
 * @param {HCOMDB} _HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
 * @returns {Integer} <b>ComDBClose</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The COM port database was closed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified COM port database handle is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbclose
 */
export ComDBClose(_HComDB) {
    result := DllCall("MSPORTS.dll\ComDBClose", HCOMDB, _HComDB, Int32)
    return result
}

/**
 * ComDBGetCurrentPortUsage returns information about the COM port numbers that are currently logged as &quot;in use&quot; in the COM port database.
 * @remarks
 * By setting <i>Buffer</i> to <b>NULL</b> and <i>MaxPortsReported</i> to a valid pointer, a caller can determine the current COM port database size, which is the number of COM port numbers that are currently arbitrated in the database. In this case, the routine sets *<i>MaxPortsReported</i> to the database size. <i>ReportType</i> is not used. 
 * 
 * If <i>Buffer</i> is non-<b>NULL</b> and <i>ReportType</i> is valid, the routine does the following:
 * 
 * <ul>
 * <li>
 * If <i>ReportType</i> is CDB_REPORT_BITS, the routine returns a bit array that specifies port number usage. Each bit in the output buffer corresponds to a port number. Using a zero-based index, bit zero of byte zero at <i>Buffer</i> corresponds to COM1, bit 1 corresponds to COM2, and so on. A bit value of 1 indicates that the port number is in use and a value of zero indicates the port number is not in use. The number of port numbers for which the routine returns usage information is the minimum of the current database size and the number of bits in the buffer (<i>BufferSize</i>*8). If <i>MaxPortsReported</i> is non-<b>NULL</b>, the routine also sets *<i>MaxPortsReported</i> to the number of port numbers for which the routine returns usage information. If BufferSize is zero, no port usage information is returned and *<i>MaxPortsReported</i> is set to zero.
 * 
 * </li>
 * <li>
 * If <i>ReportType</i> is CDB_REPORT_BYTES, the routine returns a byte array that specifies port number usage. Each byte in the returned information corresponds to a different port number. Using a zero-based index, byte zero at <i>Buffer</i> corresponds to COM1, byte 1 corresponds to COM2, and so on. A byte value of 1 indicates the port number is in use and a value of zero indicates the port number is not in use. The number of port numbers for which the routine returns usage information is the minimum of the current database size and <i>BufferSize</i>. The routine does not set *<i>MaxPortsReported</i>. If <i>BufferSize</i> is zero, no port usage information is returned.
 * 
 * </li>
 * </ul>
 * <b>ComDBGetCurrentPortUsage</b> runs in user mode.
 * @param {HCOMDB} _HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
 * @param {Integer} _Buffer Pointer to a caller-allocated buffer in which the routine returns information about COM port number. See the Remarks section for more information.
 * @param {Integer} BufferSize Specifies the size, in bytes, of a caller-allocated buffer at <i>Buffer</i>.
 * @param {Integer} ReportType Specifies one of the following flags.
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * CDB_REPORT_BITS
 * 
 * </td>
 * <td>
 * The routine returns a bit array at <i>Buffer</i> that specifies port number usage.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * CDB_REPORT_BYTES
 * 
 * </td>
 * <td>
 * The routine returns a byte array at <i>Buffer</i> that specifies port number usage.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} MaxPortsReported Pointer to the value that the routine uses to return the number of ports for which the routine returns information at <i>Buffer</i>. See the Remarks section for more information.
 * @returns {Integer} <b>ComDBGetCurrentPortUsage</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine successfully returned port number usage information.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the following is true: The specified handle to the COM port database is not valid. Both <i>Buffer</i> and <i>MaxPortsReports</i> are <b>NULL</b>. <i>ReportType</i> is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_CONNECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not access the database. To get extended error information, call <b>GetLastError</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbgetcurrentportusage
 */
export ComDBGetCurrentPortUsage(_HComDB, _Buffer, BufferSize, ReportType, MaxPortsReported) {
    MaxPortsReportedMarshal := MaxPortsReported is VarRef ? "uint*" : "ptr"

    result := DllCall("MSPORTS.dll\ComDBGetCurrentPortUsage", HCOMDB, _HComDB, "ptr", _Buffer, "uint", BufferSize, "uint", ReportType, MaxPortsReportedMarshal, MaxPortsReported, Int32)
    return result
}

/**
 * ComDBClaimNextFreePort returns the lowest COM port number that is not already in use.
 * @remarks
 * <i>Claiming</i> a COM port number in the COM port database logs the port number as "in use". Note that the database does not contain information about the caller or device that claims a port number.
 * 
 * <b>ComDBClaimNextFreePort</b> runs in user mode.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/ff546481(v=vs.85)">Obtaining and Releasing a COM Port Number</a>.
 * @param {HCOMDB} _HComDB Handle to the COM port database that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
 * @param {Pointer<Integer>} ComNumber Pointer to the COM port number that the routine returns to the caller. This pointer must be non-NULL. A port number is an integer that ranges from 1 to COMDB_MAX_PORTS_ARBITRATED.
 * @returns {Integer} <b>ComDBClaimNextFreePort</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine successfully returned a COM port number.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not write to the database.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified COM port database handle is not valid. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_LOG_SPACE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The database cannot arbitrate any more port numbers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_CONNECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not access the database. To get extended error information, call <b>GetLastError</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_Xxx</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred; call <b>GetLastError</b> to get extended error information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbclaimnextfreeport
 */
export ComDBClaimNextFreePort(_HComDB, ComNumber) {
    ComNumberMarshal := ComNumber is VarRef ? "uint*" : "ptr"

    result := DllCall("MSPORTS.dll\ComDBClaimNextFreePort", HCOMDB, _HComDB, ComNumberMarshal, ComNumber, Int32)
    return result
}

/**
 * ComDBClaimPort logs an unused COM port number as &quot;in use&quot; in the COM port database.
 * @remarks
 * <i>Claiming</i> a COM port number in the COM port database logs the port number as "in use". Note that the database does not contain information about the caller or device that claims a port number.
 * 
 * <b>ComDBClaimPort</b> runs in user mode.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/ff546481(v=vs.85)">Obtaining and Releasing a COM Port Number</a>.
 * @param {HCOMDB} _HComDB Handle to the COM port database that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
 * @param {Integer} ComNumber Specifies which COM port number the caller attempts to claim. A port number is an integer that can range from 1 to COMDB_MAX_PORTS_ARBITRATED.
 * @param {BOOL} ForceClaim Reserved for internal use only.
 * @param {Pointer<BOOL>} Forced Reserved for internal use only.
 * @returns {Integer} <b>ComDBClaimPort</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The COM port number was not in use and is now logged as "in use".
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not write to the database.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the following is true: The specified handle to the COM port database is not valid. The specified port number is greater than COMDB_MAX_PORTS_ARBITRATED.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_CONNECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not access the database. To get extended error information, call <b>GetLastError</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SHARING_VIOLATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified port number is already in use.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_Xxx</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An internal error occurred; call <b>GetLastError</b> to get extended error information.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbclaimport
 */
export ComDBClaimPort(_HComDB, ComNumber, ForceClaim, Forced) {
    ForcedMarshal := Forced is VarRef ? "int*" : "ptr"

    result := DllCall("MSPORTS.dll\ComDBClaimPort", HCOMDB, _HComDB, "uint", ComNumber, BOOL, ForceClaim, ForcedMarshal, Forced, Int32)
    return result
}

/**
 * ComDBReleasePort releases a COM port number in the COM port database.
 * @remarks
 * <i>Releasing</i> a COM port number means to log the port number as "not in use".
 * 
 * <b>ComDBReleasePort</b> runs in user mode.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/ff546481(v=vs.85)">Obtaining and Releasing a COM Port Number</a>.
 * @param {HCOMDB} _HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
 * @param {Integer} ComNumber Specifies the COM port number to release. A port number is an integer that ranges from one to COMDB_MAX_PORTS_ARBITRATED.
 * @returns {Integer} <b>ComDBReleasePort</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The COM port number was released.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not write to the database.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the following is true: The specified handle to the COM port database is not valid. The specified port number is not in the COM port database.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_CONNECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not access the database. To get extended error information, call <b>GetLastError</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbreleaseport
 */
export ComDBReleasePort(_HComDB, ComNumber) {
    result := DllCall("MSPORTS.dll\ComDBReleasePort", HCOMDB, _HComDB, "uint", ComNumber, Int32)
    return result
}

/**
 * ComDBResizeDatabase resizes the COM port database.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbgetcurrentportusage">ComDBGetCurrentPortUsage</a> to obtain the current database size.
 * 
 * <b>ComDBResizeDatabase</b> runs in user mode.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/ff546481(v=vs.85)">Resizing the COM Port Database</a>.
 * @param {HCOMDB} _HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
 * @param {Integer} NewSize Specifies a new size for the COM port database, where the database size is the number of port numbers currently arbitrated in the database. This value must be an integer multiple of 1024, must be greater than the current size, and must be less than or equal to COMDB_MAX_PORTS_ARBITRATED.
 * @returns {Integer} <b>ComDBResizeDatabase</b> returns one of the following status values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The database was successfully resized.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_LENGTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>NewSize</i> is less than or equal to the current database size, or it is greater than COMDB_MAX_PORTS_ARBITRATED.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANTWRITE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not write to the database.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the following is true: The specified handle to the COM port database is not valid. <i>NewSize</i> is not a multiple of 1024.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_CONNECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The routine could not access the database. To get extended error information, call <b>GetLastError</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msports/nf-msports-comdbresizedatabase
 */
export ComDBResizeDatabase(_HComDB, NewSize) {
    result := DllCall("MSPORTS.dll\ComDBResizeDatabase", HCOMDB, _HComDB, "uint", NewSize, Int32)
    return result
}

;@endregion Functions
