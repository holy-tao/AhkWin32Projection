#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for RDC to report the current completion percentage of a similarity operation.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-isimilarityreportprogress
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarityReportProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimilarityReportProgress
     * @type {Guid}
     */
    static IID => Guid("{96236a7a-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityReportProgress
     * @type {Guid}
     */
    static CLSID => Guid("{96236a8d-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportProgress"]

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
}
