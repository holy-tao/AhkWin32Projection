#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingJob interface describes an object that is used by a fax client application to retrieve information about an outgoing fax job in a fax server's queue.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutgoingJob</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob">FaxOutgoingJob</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingjob
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingJob extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingJob
     * @type {Guid}
     */
    static IID => Guid("{6356daad-6614-4583-bf7a-3ad67bbfc71c}")

    /**
     * The class identifier for FaxOutgoingJob
     * @type {Guid}
     */
    static CLSID => Guid("{71bb429c-0ef9-4915-bec5-a5d897a3e924}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Subject", "get_DocumentName", "get_Pages", "get_Size", "get_SubmissionId", "get_Id", "get_OriginalScheduledTime", "get_SubmissionTime", "get_ReceiptType", "get_Priority", "get_Sender", "get_Recipient", "get_CurrentPage", "get_DeviceId", "get_Status", "get_ExtendedStatusCode", "get_ExtendedStatus", "get_AvailableOperations", "get_Retries", "get_ScheduledTime", "get_TransmissionStart", "get_TransmissionEnd", "get_CSID", "get_TSID", "get_GroupBroadcastReceipts", "Pause", "Resume", "Restart", "CopyTiff", "Refresh", "Cancel"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_subject
     */
    get_Subject(pbstrSubject) {
        result := ComCall(7, this, "ptr", pbstrSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDocumentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_documentname
     */
    get_DocumentName(pbstrDocumentName) {
        result := ComCall(8, this, "ptr", pbstrDocumentName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_pages
     */
    get_Pages(plPages) {
        result := ComCall(9, this, "int*", plPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_size
     */
    get_Size(plSize) {
        result := ComCall(10, this, "int*", plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubmissionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_submissionid
     */
    get_SubmissionId(pbstrSubmissionId) {
        result := ComCall(11, this, "ptr", pbstrSubmissionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_id
     */
    get_Id(pbstrId) {
        result := ComCall(12, this, "ptr", pbstrId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateOriginalScheduledTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_originalscheduledtime
     */
    get_OriginalScheduledTime(pdateOriginalScheduledTime) {
        result := ComCall(13, this, "double*", pdateOriginalScheduledTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateSubmissionTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_submissiontime
     */
    get_SubmissionTime(pdateSubmissionTime) {
        result := ComCall(14, this, "double*", pdateSubmissionTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pReceiptType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_receipttype
     */
    get_ReceiptType(pReceiptType) {
        result := ComCall(15, this, "int*", pReceiptType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_priority
     */
    get_Priority(pPriority) {
        result := ComCall(16, this, "int*", pPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSender>} ppFaxSender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_sender
     */
    get_Sender(ppFaxSender) {
        result := ComCall(17, this, "ptr*", ppFaxSender, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxRecipient>} ppFaxRecipient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_recipient
     */
    get_Recipient(ppFaxRecipient) {
        result := ComCall(18, this, "ptr*", ppFaxRecipient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCurrentPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_currentpage
     */
    get_CurrentPage(plCurrentPage) {
        result := ComCall(19, this, "int*", plCurrentPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_deviceid
     */
    get_DeviceId(plDeviceId) {
        result := ComCall(20, this, "int*", plDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_status
     */
    get_Status(pStatus) {
        result := ComCall(21, this, "int*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pExtendedStatusCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode(pExtendedStatusCode) {
        result := ComCall(22, this, "int*", pExtendedStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtendedStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_extendedstatus
     */
    get_ExtendedStatus(pbstrExtendedStatus) {
        result := ComCall(23, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAvailableOperations 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_availableoperations
     */
    get_AvailableOperations(pAvailableOperations) {
        result := ComCall(24, this, "int*", pAvailableOperations, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(25, this, "int*", plRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateScheduledTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_scheduledtime
     */
    get_ScheduledTime(pdateScheduledTime) {
        result := ComCall(26, this, "double*", pdateScheduledTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_transmissionstart
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(27, this, "double*", pdateTransmissionStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_transmissionend
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(28, this, "double*", pdateTransmissionEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_csid
     */
    get_CSID(pbstrCSID) {
        result := ComCall(29, this, "ptr", pbstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_tsid
     */
    get_TSID(pbstrTSID) {
        result := ComCall(30, this, "ptr", pbstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbGroupBroadcastReceipts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_groupbroadcastreceipts
     */
    get_GroupBroadcastReceipts(pbGroupBroadcastReceipts) {
        result := ComCall(31, this, "ptr", pbGroupBroadcastReceipts, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-pause
     */
    Pause() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-resume
     */
    Resume() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-restart
     */
    Restart() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTiffPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(35, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-refresh
     */
    Refresh() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-cancel
     */
    Cancel() {
        result := ComCall(37, this, "HRESULT")
        return result
    }
}
