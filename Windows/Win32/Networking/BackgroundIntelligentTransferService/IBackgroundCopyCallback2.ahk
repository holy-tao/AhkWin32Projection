#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBackgroundCopyJob.ahk" { IBackgroundCopyJob }
#Import ".\IBackgroundCopyCallback.ahk" { IBackgroundCopyCallback }
#Import ".\IBackgroundCopyFile.ahk" { IBackgroundCopyFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notification that a file has completed downloading.
 * @remarks
 * For more details on implementing this interface, see the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nn-bits3_0-ibackgroundcopycallback2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyCallback2 extends IBackgroundCopyCallback {
    /**
     * The interface identifier for IBackgroundCopyCallback2
     * @type {Guid}
     */
    static IID := Guid("{659cdeac-489e-11d9-a9cd-000d56965251}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyCallback2 interfaces
    */
    struct Vtbl extends IBackgroundCopyCallback.Vtbl {
        FileTransferred : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyCallback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * BITS calls your implementation of the FileTransferred method when BITS successfully finishes transferring a file.
     * @remarks
     * Typically, you would not use this callback unless you want to validate the contents of the file that was downloaded. Validating the file may be important to you if you are downloading content that could be served to peers. 
     * 
     * To get the name of the temporary file that contains the downloaded content, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-gettemporaryname">IBackgroundCopyFile3::GetTemporaryName</a> method. After verifying the content, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate">IBackgroundCopyFile3::SetValidationState</a> method to indicate to BITS if the contents of the file is valid. If you set the validation state to <b>FALSE</b> and the content is from the origin server, the job moves to the error state. 
     * 
     * If the content is from a peer, BITS downloads the file from the origin server. The callback is called again after the file transfer from the origin server completes.
     * 
     * <b>BITS 3.0:  </b>The callback is not called again after the file transfer from the origin server completes.
     * 
     * For a job, <b>FileTransferred</b> callbacks are serialized. BITS will not dispatch a callback for the next file in the job until the current callback returns successfully.
     * 
     * <b>FileTransferred</b> callbacks are dispatched before <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-jobtransferred">JobTransferred</a> and <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-joberror">JobError</a> callbacks.
     * 
     * The <b>FileTransferred</b> callback is for download jobs or the reply portion of an upload-reply job.
     * @param {IBackgroundCopyJob} pJob Contains job-related information. Do not release <i>pJob</i>; BITS releases the interface when this method returns.
     * @param {IBackgroundCopyFile} pFile Contains file-related information. Do not release <i>pFile</i>; BITS releases the interface when this method returns.
     * @returns {HRESULT} This method should return <b>S_OK</b>; otherwise,  if negative, BITS continues to call this method until <b>S_OK</b> is returned. For performance reasons, you should limit the number  of times you return a value other than <b>S_OK</b> to a few times. As an alternative to returning an error code, consider always returning <b>S_OK</b> and handling the error internally. The interval at which this method is called is arbitrary.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred
     */
    FileTransferred(pJob, pFile) {
        result := ComCall(6, this, "ptr", pJob, "ptr", pFile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBackgroundCopyCallback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FileTransferred := CallbackCreate(GetMethod(implObj, "FileTransferred"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FileTransferred)
    }
}
