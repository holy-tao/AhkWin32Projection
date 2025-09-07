#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a snapshot of job status.
 * @see https://learn.microsoft.com/windows/win32/api/xpsprint/ns-xpsprint-xps_job_status
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class XPS_JOB_STATUS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The spooler job ID that is assigned to the print job.  If no job ID has yet been assigned, <i>jobId</i> will be 0.
     * @type {Integer}
     */
    jobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The zero-based index of the most recently processed document in the print job;  0 is the first document, 1 is the next, and so on. If no documents have been processed, <i>currentDocument</i> will have a value of -1.
     * @type {Integer}
     */
    currentDocument {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The zero-based index of the most recently processed page in the current document; 0 is the first page, 1 is the next, and so on. If no pages have been processed, <i>currentPage</i> will have a value of -1.
     * @type {Integer}
     */
    currentPage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A running total of the number of pages that have been processed by the print job. At the beginning of the job, this value is  0. As each page in each document is processed by the job, this value increases monotonically.
     * @type {Integer}
     */
    currentPageTotal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/api/xpsprint/ne-xpsprint-xps_job_completion">XPS_JOB_COMPLETION</a> value that indicates the completion status of the job.  This value will change when the event passed in the <b>completionEvent</b> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/xpsprint/nf-xpsprint-startxpsprintjob">StartXpsPrintJob</a> is signaled at the end of a job. If the print job fails, this value will be <b>XPS_JOB_FAILED</b>,  with <i>jobStatus</i> containing the error code of the failure.
     * @type {Integer}
     */
    completion {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The error state of the job.  If the job finishes without an error, this value will be <b>S_OK</b>. If an error causes the print job to exit, this value will be the error code of the failure.
     * @type {Integer}
     */
    jobStatus {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
