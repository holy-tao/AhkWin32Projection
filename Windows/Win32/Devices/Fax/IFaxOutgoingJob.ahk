#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxSender.ahk
#Include .\IFaxRecipient.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(7, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_documentname
     */
    get_DocumentName() {
        pbstrDocumentName := BSTR()
        result := ComCall(8, this, "ptr", pbstrDocumentName, "HRESULT")
        return pbstrDocumentName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_pages
     */
    get_Pages() {
        result := ComCall(9, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_size
     */
    get_Size() {
        result := ComCall(10, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_submissionid
     */
    get_SubmissionId() {
        pbstrSubmissionId := BSTR()
        result := ComCall(11, this, "ptr", pbstrSubmissionId, "HRESULT")
        return pbstrSubmissionId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(12, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_originalscheduledtime
     */
    get_OriginalScheduledTime() {
        result := ComCall(13, this, "double*", &pdateOriginalScheduledTime := 0, "HRESULT")
        return pdateOriginalScheduledTime
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_submissiontime
     */
    get_SubmissionTime() {
        result := ComCall(14, this, "double*", &pdateSubmissionTime := 0, "HRESULT")
        return pdateSubmissionTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_receipttype
     */
    get_ReceiptType() {
        result := ComCall(15, this, "int*", &pReceiptType := 0, "HRESULT")
        return pReceiptType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_priority
     */
    get_Priority() {
        result := ComCall(16, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * 
     * @returns {IFaxSender} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_sender
     */
    get_Sender() {
        result := ComCall(17, this, "ptr*", &ppFaxSender := 0, "HRESULT")
        return IFaxSender(ppFaxSender)
    }

    /**
     * 
     * @returns {IFaxRecipient} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_recipient
     */
    get_Recipient() {
        result := ComCall(18, this, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_currentpage
     */
    get_CurrentPage() {
        result := ComCall(19, this, "int*", &plCurrentPage := 0, "HRESULT")
        return plCurrentPage
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(20, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_status
     */
    get_Status() {
        result := ComCall(21, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode() {
        result := ComCall(22, this, "int*", &pExtendedStatusCode := 0, "HRESULT")
        return pExtendedStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_extendedstatus
     */
    get_ExtendedStatus() {
        pbstrExtendedStatus := BSTR()
        result := ComCall(23, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return pbstrExtendedStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_availableoperations
     */
    get_AvailableOperations() {
        result := ComCall(24, this, "int*", &pAvailableOperations := 0, "HRESULT")
        return pAvailableOperations
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_retries
     */
    get_Retries() {
        result := ComCall(25, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_scheduledtime
     */
    get_ScheduledTime() {
        result := ComCall(26, this, "double*", &pdateScheduledTime := 0, "HRESULT")
        return pdateScheduledTime
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(27, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(28, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(29, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(30, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjob-get_groupbroadcastreceipts
     */
    get_GroupBroadcastReceipts() {
        result := ComCall(31, this, "short*", &pbGroupBroadcastReceipts := 0, "HRESULT")
        return pbGroupBroadcastReceipts
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
