#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\XPS_JOB_STATUS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a print job that is currently in progress.
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsprint/nn-xpsprint-ixpsprintjob
 * @namespace Windows.Win32.Storage.Xps.Printing
 * @version v4.0.30319
 */
class IXpsPrintJob extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsPrintJob
     * @type {Guid}
     */
    static IID => Guid("{5ab89b06-8194-425f-ab3b-d7a96e350161}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "GetJobStatus"]

    /**
     * Cancels the print job.
     * @remarks
     * Any spooling or printing that is in progress at the time this method is called will be canceled.
     * 
     * This function is thread-safe and synchronized with the job status of the print job object.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsprint/nf-xpsprint-ixpsprintjob-cancel
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the current status of the print job.
     * @remarks
     * <b>GetJobStatus</b> may be called during the print job processing or after the print job has completed. The values returned in <a href="https://docs.microsoft.com/windows/win32/api/xpsprint/ns-xpsprint-xps_job_status">XPS_JOB_STATUS</a> represent   the current state of the print job at the time <b>GetJobStatus</b> is called, so it is possible to miss intermediate states between calls to this method.
     * 
     * The values of <i>jobStatus.currentDocument</i> and <i>jobStatus.currentPage</i> are guaranteed to progress sequentially: from the first document to the last,  and  from the first page to the last within each document.
     * 
     * The job ID of a print job that has been  sent to the Microsoft XPS Document Writer (MXDW) is zero. If the interface is that of a print job that has been sent to the MXDW,  zero will be returned in <i>jobStatus.jobId</i>.
     * 
     * If no job ID has been assigned to the print job, or the print job is printed without spooling, zero will be returned in <i>jobStatus.jobId</i>.
     * @returns {XPS_JOB_STATUS} The current status of the print job. For information about the data that is returned in this structure, see <a href="https://docs.microsoft.com/windows/win32/api/xpsprint/ns-xpsprint-xps_job_status">XPS_JOB_STATUS</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus
     */
    GetJobStatus() {
        jobStatus := XPS_JOB_STATUS()
        result := ComCall(4, this, "ptr", jobStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return jobStatus
    }
}
