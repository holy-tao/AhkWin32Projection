#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 * @version v4.0.30319
 */
class SerialCommunication {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_BAUD_RATE => 1769476

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_QUEUE_SIZE => 1769480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_LINE_CONTROL => 1769484

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_BREAK_ON => 1769488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_BREAK_OFF => 1769492

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_IMMEDIATE_CHAR => 1769496

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_TIMEOUTS => 1769500

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_TIMEOUTS => 1769504

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_DTR => 1769508

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_CLR_DTR => 1769512

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_RESET_DEVICE => 1769516

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_RTS => 1769520

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_CLR_RTS => 1769524

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_XOFF => 1769528

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_XON => 1769532

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_WAIT_MASK => 1769536

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_WAIT_MASK => 1769540

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_WAIT_ON_MASK => 1769544

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_PURGE => 1769548

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_BAUD_RATE => 1769552

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_LINE_CONTROL => 1769556

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_CHARS => 1769560

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_CHARS => 1769564

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_HANDFLOW => 1769568

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_HANDFLOW => 1769572

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_MODEMSTATUS => 1769576

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_COMMSTATUS => 1769580

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_XOFF_COUNTER => 1769584

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_PROPERTIES => 1769588

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_DTRRTS => 1769592

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_CONFIG_SIZE => 1769600

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_COMMCONFIG => 1769604

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_COMMCONFIG => 1769608

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_STATS => 1769612

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_CLEAR_STATS => 1769616

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_GET_MODEM_CONTROL => 1769620

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_MODEM_CONTROL => 1769624

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_FIFO_CONTROL => 1769628

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_APPLY_DEFAULT_CONFIGURATION => 1769632

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_SET_INTERVAL_TIMER_RESOLUTION => 1769636

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_INTERNAL_DO_WAIT_WAKE => 1769476

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_INTERNAL_CANCEL_WAIT_WAKE => 1769480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_INTERNAL_BASIC_SETTINGS => 1769484

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_SERIAL_INTERNAL_RESTORE_SETTINGS => 1769488

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_RXCHAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_RXFLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_TXEMPTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_CTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_DSR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_RLSD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_BREAK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_ERR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_RING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_PERR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_RX80FULL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_EVENT1 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_EV_EVENT2 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_PURGE_TXABORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_PURGE_RXABORT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_PURGE_TXCLEAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERIAL_PURGE_RXCLEAR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STOP_BIT_1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STOP_BITS_1_5 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STOP_BITS_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NO_PARITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ODD_PARITY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVEN_PARITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MARK_PARITY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SPACE_PARITY => 4

    /**
     * @type {Integer (UInt16)}
     */
    static SERIAL_LSRMST_ESCAPE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static SERIAL_LSRMST_LSR_DATA => 1

    /**
     * @type {Integer (UInt16)}
     */
    static SERIAL_LSRMST_LSR_NODATA => 2

    /**
     * @type {Integer (UInt16)}
     */
    static SERIAL_LSRMST_MST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_INTERNAL_SERENUM_REMOVE_SELF => 3604999

    /**
     * @type {Integer (UInt32)}
     */
    static COMDB_MIN_PORTS_ARBITRATED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static COMDB_MAX_PORTS_ARBITRATED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CDB_REPORT_BITS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CDB_REPORT_BYTES => 1
;@endregion Constants

;@region Methods
    /**
     * ComDBOpen returns a handle to the COM port database.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbopen
     */
    static ComDBOpen(PHComDB) {
        result := DllCall("MSPORTS.dll\ComDBOpen", "ptr", PHComDB, "int")
        return result
    }

    /**
     * ComDBClose closes a handle to the COM port database.
     * @param {HCOMDB} HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbclose
     */
    static ComDBClose(HComDB) {
        HComDB := HComDB is Win32Handle ? NumGet(HComDB, "ptr") : HComDB

        result := DllCall("MSPORTS.dll\ComDBClose", "ptr", HComDB, "int")
        return result
    }

    /**
     * ComDBGetCurrentPortUsage returns information about the COM port numbers that are currently logged as &quot;in use&quot; in the COM port database.
     * @param {HCOMDB} HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
     * @param {Pointer} Buffer Pointer to a caller-allocated buffer in which the routine returns information about COM port number. See the Remarks section for more information.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbgetcurrentportusage
     */
    static ComDBGetCurrentPortUsage(HComDB, Buffer, BufferSize, ReportType, MaxPortsReported) {
        HComDB := HComDB is Win32Handle ? NumGet(HComDB, "ptr") : HComDB

        MaxPortsReportedMarshal := MaxPortsReported is VarRef ? "uint*" : "ptr"

        result := DllCall("MSPORTS.dll\ComDBGetCurrentPortUsage", "ptr", HComDB, "ptr", Buffer, "uint", BufferSize, "uint", ReportType, MaxPortsReportedMarshal, MaxPortsReported, "int")
        return result
    }

    /**
     * ComDBClaimNextFreePort returns the lowest COM port number that is not already in use.
     * @param {HCOMDB} HComDB Handle to the COM port database that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbclaimnextfreeport
     */
    static ComDBClaimNextFreePort(HComDB, ComNumber) {
        HComDB := HComDB is Win32Handle ? NumGet(HComDB, "ptr") : HComDB

        ComNumberMarshal := ComNumber is VarRef ? "uint*" : "ptr"

        result := DllCall("MSPORTS.dll\ComDBClaimNextFreePort", "ptr", HComDB, ComNumberMarshal, ComNumber, "int")
        return result
    }

    /**
     * ComDBClaimPort logs an unused COM port number as &quot;in use&quot; in the COM port database.
     * @param {HCOMDB} HComDB Handle to the COM port database that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbclaimport
     */
    static ComDBClaimPort(HComDB, ComNumber, ForceClaim, Forced) {
        HComDB := HComDB is Win32Handle ? NumGet(HComDB, "ptr") : HComDB

        ForcedMarshal := Forced is VarRef ? "int*" : "ptr"

        result := DllCall("MSPORTS.dll\ComDBClaimPort", "ptr", HComDB, "uint", ComNumber, "int", ForceClaim, ForcedMarshal, Forced, "int")
        return result
    }

    /**
     * ComDBReleasePort releases a COM port number in the COM port database.
     * @param {HCOMDB} HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbreleaseport
     */
    static ComDBReleasePort(HComDB, ComNumber) {
        HComDB := HComDB is Win32Handle ? NumGet(HComDB, "ptr") : HComDB

        result := DllCall("MSPORTS.dll\ComDBReleasePort", "ptr", HComDB, "uint", ComNumber, "int")
        return result
    }

    /**
     * ComDBResizeDatabase resizes the COM port database.
     * @param {HCOMDB} HComDB Handle to the COM port database that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/msports/nf-msports-comdbopen">ComDBOpen</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//msports/nf-msports-comdbresizedatabase
     */
    static ComDBResizeDatabase(HComDB, NewSize) {
        HComDB := HComDB is Win32Handle ? NumGet(HComDB, "ptr") : HComDB

        result := DllCall("MSPORTS.dll\ComDBResizeDatabase", "ptr", HComDB, "uint", NewSize, "int")
        return result
    }

;@endregion Methods
}
