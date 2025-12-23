#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The JOB\_INFO\_1 structure specifies print-job information such as the job-identifier value, the name of the printer for which the job is spooled, the name of the machine that created the print job, the name of the user that owns the print job, and so on.
 * @remarks
 * Port monitors that do not support TrueEndOfJob will set the job as JOB\_STATUS\_PRINTED right after the job is submitted to the printer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/job-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class JOB_INFO_1W extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A job identifier.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the printer for which the job is spooled.
     * @type {PWSTR}
     */
    pPrinterName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the machine that created the print job.
     * @type {PWSTR}
     */
    pMachineName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the user that owns the print job.
     * @type {PWSTR}
     */
    pUserName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the print job (for example, "MS-WORD: Review.doc").
     * @type {PWSTR}
     */
    pDocument {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a null-terminated string that specifies the type of data used to record the print job.
     * @type {PWSTR}
     */
    pDatatype {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a null-terminated string that specifies the status of the print job. This member should be checked prior to *Status* and, if *pStatus* is **NULL**, the status is defined by the contents of the Status member.
     * @type {PWSTR}
     */
    pStatus {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The job status. The value of this member can be zero or a combination of one or more of the following values. A value of zero indicates that the print queue was paused after the document finished spooling.
     * 
     * 
     * 
     * | Value                           | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
     * |---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | JOB\_STATUS\_BLOCKED\_DEVQ      | The driver cannot print the job.                                                                                                                                                                                                                                                                                                                                                                                                                                            |
     * | JOB\_STATUS\_COMPLETE           | **Windows XP and later:** Job is sent to the printer, but the job may not be printed yet.<br/> See Remarks for more information.<br/>                                                                                                                                                                                                                                                                                                                           |
     * | JOB\_STATUS\_DELETED            | Job has been deleted.                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * | JOB\_STATUS\_DELETING           | Job is being deleted.                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
     * | JOB\_STATUS\_ERROR              | An error is associated with the job.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
     * | JOB\_STATUS\_OFFLINE            | Printer is offline.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
     * | JOB\_STATUS\_PAPEROUT           | Printer is out of paper.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
     * | JOB\_STATUS\_PAUSED             | Job is paused.                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
     * | JOB\_STATUS\_PRINTED            | Job has printed.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
     * | JOB\_STATUS\_PRINTING           | Job is printing.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
     * | JOB\_STATUS\_RESTART            | Job has been restarted.                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
     * | JOB\_STATUS\_RETAINED           | **Windows Vista and later:** Job has been retained in the print queue and cannot be deleted. This can be caused by the following:<br/> 1) The job was manually retained by a call to SetJob and the spooler is waiting for the job to be released.<br/> 2) The job has not finished printing and must finish printing before it can be automatically deleted.<br/> See [**SetJob**](setjob.md) for more information about print job commands.<br/> |
     * | JOB\_STATUS\_SPOOLING           | Job is spooling.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
     * | JOB\_STATUS\_USER\_INTERVENTION | Printer has an error that requires the user to do something.                                                                                                                                                                                                                                                                                                                                                                                                                |
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The job priority. This member can be one of the following values or in the range between 1 through 99 (MIN\_PRIORITY through MAX\_PRIORITY).
     * 
     * 
     * 
     * | Value         | Meaning           |
     * |---------------|-------------------|
     * | MIN\_PRIORITY | Minimum priority. |
     * | MAX\_PRIORITY | Maximum priority. |
     * | DEF\_PRIORITY | Default priority. |
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The job's position in the print queue.
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The total number of pages that the document contains. This value may be zero if the print job does not contain page delimiting information.
     * @type {Integer}
     */
    TotalPages {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The number of pages that have printed. This value may be zero if the print job does not contain page delimiting information.
     * @type {Integer}
     */
    PagesPrinted {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A [**SYSTEMTIME**](/windows/desktop/api/minwinbase/ns-minwinbase-systemtime) structure that specifies the time that this document was spooled.
     * 
     * This time value is in Universal Time Coordinate (UTC) format. You should convert it to a local time value before displaying it. You can use the [**FileTimeToLocalFileTime**](/windows/desktop/api/fileapi/nf-fileapi-filetimetolocalfiletime) function to perform the conversion.
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(76, this)
            return this.__Submitted
        }
    }
}
