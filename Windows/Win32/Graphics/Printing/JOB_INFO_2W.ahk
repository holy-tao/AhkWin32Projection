#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\Gdi\DEVMODEW.ahk" { DEVMODEW }

/**
 * The JOB\_INFO\_2 structure describes a full set of values associated with a job.
 * @remarks
 * Port monitors that do not support TrueEndOfJob will set the job as JOB\_STATUS\_PRINTED right after the job is submitted to the printer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/job-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct JOB_INFO_2W {
    #StructPack 8

    /**
     * A job identifier value.
     */
    JobId : UInt32

    /**
     * A pointer to a null-terminated string that specifies the name of the printer for which the job is spooled.
     */
    pPrinterName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the name of the machine that created the print job.
     */
    pMachineName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the name of the user who owns the print job.
     */
    pUserName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the name of the print job (for example, "MS-WORD: Review.doc").
     */
    pDocument : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the name of the user who should be notified when the job has been printed or when an error occurs while printing the job.
     */
    pNotifyName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the type of data used to record the print job.
     */
    pDatatype : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the name of the print processor that should be used to print the job.
     */
    pPrintProcessor : PWSTR

    /**
     * A pointer to a null-terminated string that specifies print-processor parameters.
     */
    pParameters : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the name of the printer driver that should be used to process the print job.
     */
    pDriverName : PWSTR

    /**
     * A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that contains device-initialization and environment data for the printer driver.
     */
    pDevMode : DEVMODEW.Ptr

    /**
     * A pointer to a null-terminated string that specifies the status of the print job. This member should be checked prior to **Status** and, if **pStatus** is **NULL**, the status is defined by the contents of the Status member.
     */
    pStatus : PWSTR

    /**
     * The value of this member is **NULL**. Retrieval and setting of document security descriptors is not supported in this release.
     */
    pSecurityDescriptor : PSECURITY_DESCRIPTOR

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
     */
    Status : UInt32

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
     */
    Priority : UInt32

    /**
     * The job's position in the print queue.
     */
    Position : UInt32

    /**
     * The earliest time that the job can be printed.
     */
    StartTime : UInt32

    /**
     * The latest time that the job can be printed.
     */
    UntilTime : UInt32

    /**
     * The number of pages required for the job. This value may be zero if the print job does not contain page delimiting information.
     */
    TotalPages : UInt32

    /**
     * The size, in bytes, of the job.
     */
    Size : UInt32

    /**
     * A [**SYSTEMTIME**](/windows/desktop/api/minwinbase/ns-minwinbase-systemtime) structure that specifies the time when the job was submitted.
     * 
     * This time value is in Universal Time Coordinate (UTC) format. You should convert it to a local time value before displaying it. You can use the [**FileTimeToLocalFileTime**](/windows/desktop/api/fileapi/nf-fileapi-filetimetolocalfiletime) function to perform the conversion.
     */
    Submitted : SYSTEMTIME

    /**
     * The total time, in milliseconds, that has elapsed since the job began printing.
     */
    Time : UInt32

    /**
     * The number of pages that have printed. This value may be zero if the print job does not contain page delimiting information.
     */
    PagesPrinted : UInt32

}
