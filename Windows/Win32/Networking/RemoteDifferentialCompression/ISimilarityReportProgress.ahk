#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for RDC to report the current completion percentage of a similarity operation.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilarityreportprogress
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
     * 
     * @param {Integer} percentCompleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityreportprogress-reportprogress
     */
    ReportProgress(percentCompleted) {
        result := ComCall(3, this, "uint", percentCompleted, "HRESULT")
        return result
    }
}
