#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\XPS_JOB_STATUS.ahk" { XPS_JOB_STATUS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a print job that is currently in progress.
 * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nn-xpsprint-ixpsprintjob
 * @namespace Windows.Win32.Storage.Xps.Printing
 */
export default struct IXpsPrintJob extends IUnknown {
    /**
     * The interface identifier for IXpsPrintJob
     * @type {Guid}
     */
    static IID := Guid("{5ab89b06-8194-425f-ab3b-d7a96e350161}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsPrintJob interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancel       : IntPtr
        GetJobStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsPrintJob.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Cancels the print job.
     * @remarks
     * Any spooling or printing that is in progress at the time this method is called will be canceled.
     * 
     * This function is thread-safe and synchronized with the job status of the print job object.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-ixpsprintjob-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus
     */
    GetJobStatus() {
        jobStatus := XPS_JOB_STATUS()
        result := ComCall(4, this, XPS_JOB_STATUS.Ptr, jobStatus, "HRESULT")
        return jobStatus
    }

    Query(iid) {
        if (IXpsPrintJob.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.GetJobStatus := CallbackCreate(GetMethod(implObj, "GetJobStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.GetJobStatus)
    }
}
