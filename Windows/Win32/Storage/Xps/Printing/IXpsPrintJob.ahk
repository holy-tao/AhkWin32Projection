#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\XPS_JOB_STATUS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a print job that is currently in progress.
 * @see https://docs.microsoft.com/windows/win32/api//xpsprint/nn-xpsprint-ixpsprintjob
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-ixpsprintjob-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XPS_JOB_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsprint/nf-xpsprint-ixpsprintjob-getjobstatus
     */
    GetJobStatus() {
        jobStatus := XPS_JOB_STATUS()
        result := ComCall(4, this, "ptr", jobStatus, "HRESULT")
        return jobStatus
    }
}
