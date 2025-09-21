#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The JOB\_INFO\_2 structure describes a full set of values associated with a job.
 * @remarks
 * Port monitors that do not support TrueEndOfJob will set the job as JOB\_STATUS\_PRINTED right after the job is submitted to the printer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/job-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class JOB_INFO_2A extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * A job identifier value.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the printer for which the job is spooled.
     * @type {Pointer<Byte>}
     */
    pPrinterName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the machine that created the print job.
     * @type {Pointer<Byte>}
     */
    pMachineName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the user who owns the print job.
     * @type {Pointer<Byte>}
     */
    pUserName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the print job (for example, "MS-WORD: Review.doc").
     * @type {Pointer<Byte>}
     */
    pDocument {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the user who should be notified when the job has been printed or when an error occurs while printing the job.
     * @type {Pointer<Byte>}
     */
    pNotifyName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a null-terminated string that specifies the type of data used to record the print job.
     * @type {Pointer<Byte>}
     */
    pDatatype {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the print processor that should be used to print the job.
     * @type {Pointer<Byte>}
     */
    pPrintProcessor {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a null-terminated string that specifies print-processor parameters.
     * @type {Pointer<Byte>}
     */
    pParameters {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the printer driver that should be used to process the print job.
     * @type {Pointer<Byte>}
     */
    pDriverName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that contains device-initialization and environment data for the printer driver.
     * @type {Pointer<DEVMODEA>}
     */
    pDevMode {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to a null-terminated string that specifies the status of the print job. This member should be checked prior to **Status** and, if **pStatus** is **NULL**, the status is defined by the contents of the Status member.
     * @type {Pointer<Byte>}
     */
    pStatus {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The value of this member is **NULL**. Retrieval and setting of document security descriptors is not supported in this release.
     * @type {Pointer<Void>}
     */
    pSecurityDescriptor {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The job status. This member can be one or more of the following values.
     * 
     * | Value                           | Meaning                                                      |
     * |---------------------------------|--------------------------------------------------------------|
     * | JOB\_STATUS\_BLOCKED\_DEVQ      | The driver cannot print the job.                             |
     * | JOB\_STATUS\_DELETED            | Job has been deleted.                                        |
     * | JOB\_STATUS\_DELETING           | Job is being deleted.                                        |
     * | JOB\_STATUS\_ERROR              | An error is associated with the job.                         |
     * | JOB\_STATUS\_OFFLINE            | Printer is offline.                                          |
     * | JOB\_STATUS\_PAPEROUT           | Printer is out of paper.                                     |
     * | JOB\_STATUS\_PAUSED             | Job is paused.                                               |
     * | JOB\_STATUS\_PRINTED            | Job has printed.                                             |
     * | JOB\_STATUS\_PRINTING           | Job is printing.                                             |
     * | JOB\_STATUS\_RESTART            | Job has been restarted.                                      |
     * | JOB\_STATUS\_SPOOLING           | Job is spooling.                                             |
     * | JOB\_STATUS\_USER\_INTERVENTION | Printer has an error that requires the user to do something. |
     * 
     * 
     * 
     *  
     * 
     * In Windows XP and later versions of Windows, the following values can also be used:
     * 
     * | Value                 | Meaning                                                                                       |
     * |-----------------------|-----------------------------------------------------------------------------------------------|
     * | JOB\_STATUS\_COMPLETE | The job is sent to the printer, but may not be printed yet. See Remarks for more information. |
     * | JOB\_STATUS\_RETAINED | The job has been retained in the print queue following printing.                              |
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
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
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * The job's position in the print queue.
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The earliest time that the job can be printed.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * The latest time that the job can be printed.
     * @type {Integer}
     */
    UntilTime {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The number of pages required for the job. This value may be zero if the print job does not contain page delimiting information.
     * @type {Integer}
     */
    TotalPages {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * The size, in bytes, of the job.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * A [**SYSTEMTIME**](/windows/desktop/api/minwinbase/ns-minwinbase-systemtime) structure that specifies the time when the job was submitted.
     * 
     * This time value is in Universal Time Coordinate (UTC) format. You should convert it to a local time value before displaying it. You can use the [**FileTimeToLocalFileTime**](/windows/desktop/api/fileapi/nf-fileapi-filetimetolocalfiletime) function to perform the conversion.
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(this.ptr + 136)
            return this.__Submitted
        }
    }

    /**
     * The total time, in milliseconds, that has elapsed since the job began printing.
     * @type {Integer}
     */
    Time {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * The number of pages that have printed. This value may be zero if the print job does not contain page delimiting information.
     * @type {Integer}
     */
    PagesPrinted {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }
}
