#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbBlocked 
     * @returns {HRESULT} 
     */
    get_Blocked(pbBlocked) {
        result := ComCall(7, this, "ptr", pbBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, "short", bBlocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxIncomingJobs>} pFaxIncomingJobs 
     * @returns {HRESULT} 
     */
    GetJobs(pFaxIncomingJobs) {
        result := ComCall(11, this, "ptr", pFaxIncomingJobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxIncomingJob>} pFaxIncomingJob 
     * @returns {HRESULT} 
     */
    GetJob(bstrJobId, pFaxIncomingJob) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(12, this, "ptr", bstrJobId, "ptr", pFaxIncomingJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
