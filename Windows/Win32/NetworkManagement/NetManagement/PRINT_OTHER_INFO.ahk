#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a print job.
 * @remarks
 * 
 * Additional variable-length data follows the 
 * <b>PRINT_OTHER_INFO</b> structure in the alert message buffer. The information is in the form of contiguous null-terminated character strings, as follows.
 * 
 * 
 * <table>
 * <tr>
 * <th>String</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>computername</td>
 * <td>The computer that submitted the print job.</td>
 * </tr>
 * <tr>
 * <td>username</td>
 * <td>The user who submitted the print job.</td>
 * </tr>
 * <tr>
 * <td>queuename</td>
 * <td>The print queue to which the job was submitted.</td>
 * </tr>
 * <tr>
 * <td>destination</td>
 * <td>The printer destination (device) to which the print job was routed.</td>
 * </tr>
 * <tr>
 * <td>status</td>
 * <td>The status of the print job.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The calling application must allocate and free the memory for all structures and variable-length data in an alert message buffer.
 * 
 * See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraiseex">NetAlertRaiseEx</a> for a code sample that demonstrates how to raise a print alert.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//lmalert/ns-lmalert-print_other_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class PRINT_OTHER_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The identification number of the print job.
     * @type {Integer}
     */
    alrtpr_jobid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A bitmask describing the status of the print job. 
     * 
     * 
     * 
     * 
     * You can obtain the overall status of the job by checking PRJOB_QSTATUS (bits 0 and 1). 
     * 
     * Possible values for the print job status are listed in the <i>Lmalert.h</i> header file.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_QS_QUEUED"></a><a id="prjob_qs_queued"></a><dl>
     * <dt><b>PRJOB_QS_QUEUED</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The print job is in the queue waiting to be scheduled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_QS_PAUSED"></a><a id="prjob_qs_paused"></a><dl>
     * <dt><b>PRJOB_QS_PAUSED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The print job is in the queue, but it has been paused. (When a job is paused, it cannot be scheduled.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_QS_SPOOLING"></a><a id="prjob_qs_spooling"></a><dl>
     * <dt><b>PRJOB_QS_SPOOLING</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The print job is in the process of being spooled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_QS_PRINTING"></a><a id="prjob_qs_printing"></a><dl>
     * <dt><b>PRJOB_QS_PRINTING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job is currently printing.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the print job is in the PRJOB_QS_PRINTING state, you can check bits 2 through 8 for the device's status (PRJOB_DEVSTATUS). Bit 15 is also meaningful.
     * 
     * Possible values for the device's status are listed in the <i>Lmalert.h</i> header file.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_COMPLETE"></a><a id="prjob_complete"></a><dl>
     * <dt><b>PRJOB_COMPLETE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job has completed printing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_INTERV"></a><a id="prjob_interv"></a><dl>
     * <dt><b>PRJOB_INTERV</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination printer requires an operator's intervention.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_ERROR"></a><a id="prjob_error"></a><dl>
     * <dt><b>PRJOB_ERROR</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an error at the destination printer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_DESTOFFLINE"></a><a id="prjob_destoffline"></a><dl>
     * <dt><b>PRJOB_DESTOFFLINE</b></dt>
     * <dt>0x20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination printer is offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_DESTPAUSED"></a><a id="prjob_destpaused"></a><dl>
     * <dt><b>PRJOB_DESTPAUSED</b></dt>
     * <dt>0x40</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination printer is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_NOTIFY"></a><a id="prjob_notify"></a><dl>
     * <dt><b>PRJOB_NOTIFY</b></dt>
     * <dt>0x80</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A printing alert should be raised.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_DESTNOPAPER"></a><a id="prjob_destnopaper"></a><dl>
     * <dt><b>PRJOB_DESTNOPAPER</b></dt>
     * <dt>0x100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination printer is out of paper.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PRJOB_DELETED"></a><a id="prjob_deleted"></a><dl>
     * <dt><b>PRJOB_DELETED</b></dt>
     * <dt>0x8000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The printing job is being deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    alrtpr_status {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time at which the print job was submitted. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT.
     * @type {Integer}
     */
    alrtpr_submitted {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the print job.
     * @type {Integer}
     */
    alrtpr_size {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
