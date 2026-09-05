#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the completion status of a print job.
 * @see https://learn.microsoft.com/windows/win32/api/xpsprint/ne-xpsprint-xps_job_completion
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
class XPS_JOB_COMPLETION extends Win32Enum {

    /**
     * The print  job is running.
     * Native name: XPS_JOB_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static IN_PROGRESS => 0

    /**
     * The print job finished without an error.
     * Native name: XPS_JOB_COMPLETED
     * @type {Integer (Int32)}
     */
    static COMPLETED => 1

    /**
     * The print job was cancelled by a call to <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-ixpsprintjob-cancel">IXpsPrintJob::Cancel</a>, or cancelled while it was being processed by the  print spooler.
     * Native name: XPS_JOB_CANCELLED
     * @type {Integer (Int32)}
     */
    static CANCELLED => 2

    /**
     * The print job failed. The <b>jobStatus</b> member of <a href="https://docs.microsoft.com/windows/win32/api/xpsprint/ns-xpsprint-xps_job_status">XPS_JOB_STATUS</a> contains the error code of the failure.
     * Native name: XPS_JOB_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 3
}
