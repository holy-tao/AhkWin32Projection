#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxIncomingJobs.ahk
#Include .\IFaxIncomingJob.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxIncomingQueue interface is used by a fax client application to manage the inbound fax jobs (FaxIncomingJobs object) in the job queue. The object also includes a method to block inbound faxes from the fax job queue.
 * @remarks
 * 
  * To create a <b>FaxIncomingQueue</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxfolders-incomingqueue-vb">IFaxFolders::get_IncomingQueue</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingqueue
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingQueue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxIncomingQueue
     * @type {Guid}
     */
    static IID => Guid("{902e64ef-8fd8-4b75-9725-6014df161545}")

    /**
     * The class identifier for FaxIncomingQueue
     * @type {Guid}
     */
    static CLSID => Guid("{69131717-f3f1-40e3-809d-a6cbf7bd85e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Blocked", "put_Blocked", "Refresh", "Save", "GetJobs", "GetJob"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-get_blocked
     */
    get_Blocked() {
        result := ComCall(7, this, "short*", &pbBlocked := 0, "HRESULT")
        return pbBlocked
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-put_blocked
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, "short", bBlocked, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-save
     */
    Save() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFaxIncomingJobs} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(11, this, "ptr*", &pFaxIncomingJobs := 0, "HRESULT")
        return IFaxIncomingJobs(pFaxIncomingJobs)
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @returns {IFaxIncomingJob} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(12, this, "ptr", bstrJobId, "ptr*", &pFaxIncomingJob := 0, "HRESULT")
        return IFaxIncomingJob(pFaxIncomingJob)
    }
}
