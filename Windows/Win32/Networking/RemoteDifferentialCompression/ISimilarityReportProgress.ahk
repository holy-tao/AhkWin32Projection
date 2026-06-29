#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a method for RDC to report the current completion percentage of a similarity operation.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-isimilarityreportprogress
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct ISimilarityReportProgress extends IUnknown {
    /**
     * The interface identifier for ISimilarityReportProgress
     * @type {Guid}
     */
    static IID := Guid("{96236a7a-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityReportProgress
     * @type {Guid}
     */
    static CLSID := Guid("{96236a8d-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimilarityReportProgress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReportProgress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimilarityReportProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports the current completion percentage of a similarity operation in progress.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilarity-copyandswap">ISimilarity::CopyAndSwap</a> method calls the <b>ReportProgress</b>  method to report the progress of the copy-and-swap operation. To receive the progress information, RDC applications must implement this method.
     * 
     * No guarantee is made as to how frequently this method is called, nor that it will be called with any specific values for the <i>percentCompleted</i> parameter. For example, the <i>percentCompleted</i> parameter may not start at zero and may never reach 100, and it may receive the same value more than once. However, each value is guaranteed to be greater than or equal to the previous value.
     * 
     * If the application returns an error code such as <b>E_FAIL</b>, the similarity operation is stopped, and the error code is propagated.
     * @param {Integer} percentCompleted The current completion percentage of the task. The valid range is from 0 through 100.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityreportprogress-reportprogress
     */
    ReportProgress(percentCompleted) {
        result := ComCall(3, this, "uint", percentCompleted, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISimilarityReportProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReportProgress := CallbackCreate(GetMethod(implObj, "ReportProgress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReportProgress)
    }
}
