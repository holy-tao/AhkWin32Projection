#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxIncomingJobs.ahk
#Include .\IFaxIncomingJob.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to retrieve the inbound fax jobs (FaxIncomingJobs object) in the job queue for a particular fax account.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountincomingqueue
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountIncomingQueue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountIncomingQueue
     * @type {Guid}
     */
    static IID => Guid("{dd142d92-0186-4a95-a090-cbc3eadba6b4}")

    /**
     * The class identifier for FaxAccountIncomingQueue
     * @type {Guid}
     */
    static CLSID => Guid("{9bcf6094-b4da-45f4-b8d6-ddeb2186652c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJobs", "GetJob"]

    /**
     * Returns the collection of inbound fax jobs in the queue for the current fax account.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_LOW</a> access rights.
     * 
     * If the setting "All incoming faxes are viewable by everyone" is true (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-incomingfaxesarepublic-vb">IncomingFaxesArePublic</a>) or if the current user has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> access rights, then the set returned includes all the messages present in the fax server incoming queue.
     * @returns {IFaxIncomingJobs} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjobs">IFaxIncomingJobs</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjobs">FaxIncomingJobs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(7, this, "ptr*", &pFaxIncomingJobs := 0, "HRESULT")
        return IFaxIncomingJobs(pFaxIncomingJobs)
    }

    /**
     * Returns an incoming fax job in the job queue of the current fax account according to the job's ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_LOW</a> access rights.
     * 
     * If the setting "All incoming faxes are viewable by everyone" is true (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-incomingfaxesarepublic-vb">IncomingFaxesArePublic</a>) or if the current user has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> access rights, then the set returned includes all the messages present in the fax server incoming queue.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Specifies the job ID.
     * @returns {IFaxIncomingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjob">IFaxIncomingJob</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob">FaxIncomingJob</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, "ptr", bstrJobId, "ptr*", &pFaxIncomingJob := 0, "HRESULT")
        return IFaxIncomingJob(pFaxIncomingJob)
    }
}
