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
 * To create a <b>FaxIncomingQueue</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxfolders-incomingqueue-vb">IFaxFolders::get_IncomingQueue</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nn-faxcomex-ifaxincomingqueue
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
     * @type {VARIANT_BOOL} 
     */
    Blocked {
        get => this.get_Blocked()
        set => this.put_Blocked(value)
    }

    /**
     * The Blocked property is a Boolean value that indicates whether the job queue for incoming faxes is blocked. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the inbound job queue is blocked and the fax service is not answering incoming fax calls. If this property is equal to <b>FALSE</b>, the queue is not blocked.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingqueue-get_blocked
     */
    get_Blocked() {
        result := ComCall(7, this, "short*", &pbBlocked := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbBlocked
    }

    /**
     * The Blocked property is a Boolean value that indicates whether the job queue for incoming faxes is blocked. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the inbound job queue is blocked and the fax service is not answering incoming fax calls. If this property is equal to <b>FALSE</b>, the queue is not blocked.
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingqueue-put_blocked
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, "short", bBlocked, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Refresh method refreshes FaxIncomingQueue object information from the fax server. When the Refresh method is called, any configuration changes made after the last Save method call are lost.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingqueue-refresh
     */
    Refresh() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Save method saves the FaxIncomingQueue object's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingqueue-save
     */
    Save() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetJobs method returns the collection of inbound fax jobs in the queue.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access rights.
     * @returns {IFaxIncomingJobs} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjobs">IFaxIncomingJobs</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjobs">FaxIncomingJobs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(11, this, "ptr*", &pFaxIncomingJobs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxIncomingJobs(pFaxIncomingJobs)
    }

    /**
     * The GetJob method returns an incoming fax job in the job queue according to its ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access rights.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Specifies the job ID.
     * @returns {IFaxIncomingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjob">IFaxIncomingJob</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob">FaxIncomingJob</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/faxcomex/nf-faxcomex-ifaxincomingqueue-getjob
     */
    GetJob(bstrJobId) {
        if(bstrJobId is String) {
            pin := BSTR.Alloc(bstrJobId)
            bstrJobId := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrJobId, "ptr*", &pFaxIncomingJob := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFaxIncomingJob(pFaxIncomingJob)
    }
}
