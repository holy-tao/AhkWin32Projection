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
     * @type {BSTR} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {BSTR} 
     */
    DocumentName {
        get => this.get_DocumentName()
    }

    /**
     * @type {Integer} 
     */
    Pages {
        get => this.get_Pages()
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {BSTR} 
     */
    SubmissionId {
        get => this.get_SubmissionId()
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Float} 
     */
    OriginalScheduledTime {
        get => this.get_OriginalScheduledTime()
    }

    /**
     * @type {Float} 
     */
    SubmissionTime {
        get => this.get_SubmissionTime()
    }

    /**
     * @type {Integer} 
     */
    ReceiptType {
        get => this.get_ReceiptType()
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
    }

    /**
     * @type {IFaxSender} 
     */
    Sender {
        get => this.get_Sender()
    }

    /**
     * @type {IFaxRecipient} 
     */
    Recipient {
        get => this.get_Recipient()
    }

    /**
     * @type {Integer} 
     */
    CurrentPage {
        get => this.get_CurrentPage()
    }

    /**
     * @type {Integer} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    ExtendedStatusCode {
        get => this.get_ExtendedStatusCode()
    }

    /**
     * @type {BSTR} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
    }

    /**
     * @type {Integer} 
     */
    AvailableOperations {
        get => this.get_AvailableOperations()
    }

    /**
     * @type {Integer} 
     */
    Retries {
        get => this.get_Retries()
    }

    /**
     * @type {Float} 
     */
    ScheduledTime {
        get => this.get_ScheduledTime()
    }

    /**
     * @type {Float} 
     */
    TransmissionStart {
        get => this.get_TransmissionStart()
    }

    /**
     * @type {Float} 
     */
    TransmissionEnd {
        get => this.get_TransmissionEnd()
    }

    /**
     * @type {BSTR} 
     */
    CSID {
        get => this.get_CSID()
    }

    /**
     * @type {BSTR} 
     */
    TSID {
        get => this.get_TSID()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    GroupBroadcastReceipts {
        get => this.get_GroupBroadcastReceipts()
    }

    /**
     * The IFaxOutgoingJob::get_Subject property is a null-terminated string that contains the contents of the subject field on the cover page of the fax.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(7, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * The IFaxOutgoingJob::get_DocumentName property is a null-terminated string that contains the user-friendly name to display for the fax document.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_documentname
     */
    get_DocumentName() {
        pbstrDocumentName := BSTR()
        result := ComCall(8, this, "ptr", pbstrDocumentName, "HRESULT")
        return pbstrDocumentName
    }

    /**
     * The IFaxOutgoingJob::get_Pages property is a number that indicates the total number of pages in the outbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_pages
     */
    get_Pages() {
        result := ComCall(9, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * The IFaxOutgoingJob::get_Size property is a value that indicates the size of the Tagged Image File Format Class F (TIFF Class F) file associated with the outbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_size
     */
    get_Size() {
        result := ComCall(10, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * The IFaxOutgoingJob::get_SubmissionId property is a null-terminated string that contains the unique identifier assigned to the fax job during the submission process.
     * @remarks
     * 
     * All fax jobs created by the same submission process share the same unique submission ID. When you submit a fax to be sent to more than one recipient, separate fax jobs will be created, but as part of the same fax broadcast, they will share the same <b>SubmissionID</b>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_submissionid
     */
    get_SubmissionId() {
        pbstrSubmissionId := BSTR()
        result := ComCall(11, this, "ptr", pbstrSubmissionId, "HRESULT")
        return pbstrSubmissionId
    }

    /**
     * The IFaxOutgoingJob::get_Id property is a null-terminated string that contains a unique identifier for the outbound fax job. You can use the identifier to retrieve the archived fax message after the job completes successfully.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(12, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * The IFaxOutgoingJob::get_OriginalScheduledTime property specifies the time that the fax job was originally scheduled for transmission.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_originalscheduledtime
     */
    get_OriginalScheduledTime() {
        result := ComCall(13, this, "double*", &pdateOriginalScheduledTime := 0, "HRESULT")
        return pdateOriginalScheduledTime
    }

    /**
     * The IFaxOutgoingJob::get_SubmissionTime property indicates the time that the outbound fax job was submitted for processing.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_submissiontime
     */
    get_SubmissionTime() {
        result := ComCall(14, this, "double*", &pdateSubmissionTime := 0, "HRESULT")
        return pdateSubmissionTime
    }

    /**
     * The IFaxOutgoingJob::get_ReceiptType property is a value that specifies the type of delivery receipt to deliver when the fax message reaches a final state. The receipt type can be Simple Mail Transport Protocol (SMTP) mail, a message box, or no receipt.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_receipttype
     */
    get_ReceiptType() {
        result := ComCall(15, this, "int*", &pReceiptType := 0, "HRESULT")
        return pReceiptType
    }

    /**
     * The IFaxOutgoingJob::get_Priority property specifies the priority to use when sending the fax; for example, normal, low, or high priority.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_priority
     */
    get_Priority() {
        result := ComCall(16, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * The IFaxOutgoingJob::get_Sender property retrieves an object containing information about the sender of the fax.
     * @returns {IFaxSender} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_sender
     */
    get_Sender() {
        result := ComCall(17, this, "ptr*", &ppFaxSender := 0, "HRESULT")
        return IFaxSender(ppFaxSender)
    }

    /**
     * The IFaxOutgoingJob::get_Recipient property retrieves an interface to an object containing information about the recipient of the fax job.
     * @returns {IFaxRecipient} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_recipient
     */
    get_Recipient() {
        result := ComCall(18, this, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * The IFaxOutgoingJob::get_CurrentPage property is a number that identifies the page that the fax service is actively transmitting on an outbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_currentpage
     */
    get_CurrentPage() {
        result := ComCall(19, this, "int*", &plCurrentPage := 0, "HRESULT")
        return plCurrentPage
    }

    /**
     * The IFaxOutgoingJob::get_DeviceId property indicates the device ID of the device transmitting the outbound fax job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_deviceid
     */
    get_DeviceId() {
        result := ComCall(20, this, "int*", &plDeviceId := 0, "HRESULT")
        return plDeviceId
    }

    /**
     * The IFaxOutgoingJob::get_Status property is a number that indicates the current status of an outbound fax job in the job queue.
     * @remarks
     * 
     * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_status_enum">FAX_JOB_STATUS_ENUM</a>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_status
     */
    get_Status() {
        result := ComCall(21, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IFaxOutgoingJob::get_ExtendedStatusCode property specifies a code describing the job's extended status.
     * @remarks
     * 
     * If an fax service provider (FSP) provides a proprietary status code, the service loads the code string from the FSP, and passes both the string and the original status code to the client. If the FSP provides a status defined in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a>, the service passes only the status code to the client.
     * 
     * A fax client application should check the extended status string first. If the string is not <b>NULL</b>/empty, it describes the extended status, and the extended status code is the same code that the FSP passed to the fax service. If the string is <b>NULL</b>/Empty, the extended status code is one of those defined in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a>.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_extendedstatuscode
     */
    get_ExtendedStatusCode() {
        result := ComCall(22, this, "int*", &pExtendedStatusCode := 0, "HRESULT")
        return pExtendedStatusCode
    }

    /**
     * The IFaxOutgoingJob::get_ExtendedStatus property is a null-terminated string that describes the job's extended status.
     * @remarks
     * 
     * The <b>IFaxOutgoingJob::get_ExtendedStatus</b> property can have a value only if the fax service provider (FSP) returns a proprietary status code in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob-extendedstatuscode-vb">IFaxOutgoingJob::get_ExtendedStatusCode</a> property. Otherwise, the <b>IFaxOutgoingJob::get_ExtendedStatus</b> property will contain an empty string. Similarly, an FSP may choose not to provide values for the <b>IFaxOutgoingJob::get_ExtendedStatus</b> property, and the property will thus contain an empty string. This is the case for the T.30 FSP provided with the fax service.
     * 
     * If an FSP provides a proprietary status code, the service loads the code string from the FSP, and passes both the string and the original status code to the client. If the FSP provides a status defined in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a>, the service passes only the status code to the client.
     * 
     * A fax client application should check the extended status string first. If the string is not <b>NULL</b>/empty, it describes the extended status, and the extended status code is the same code that the FSP passed to the fax service. If the string is <b>NULL</b>/empty, the extended status code is one of those defined in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_job_extended_status_enum">FAX_JOB_EXTENDED_STATUS_ENUM</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_extendedstatus
     */
    get_ExtendedStatus() {
        pbstrExtendedStatus := BSTR()
        result := ComCall(23, this, "ptr", pbstrExtendedStatus, "HRESULT")
        return pbstrExtendedStatus
    }

    /**
     * The IFaxOutgoingJob::get_AvailableOperations property indicates the combination of valid operations that you can perform on the fax job, given its current status.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_availableoperations
     */
    get_AvailableOperations() {
        result := ComCall(24, this, "int*", &pAvailableOperations := 0, "HRESULT")
        return pAvailableOperations
    }

    /**
     * The IFaxOutgoingJob::get_Retries property is a value that indicates the number of times that the fax service attempted to transmit an outgoing fax after the initial transmission attempt failed.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_retries
     */
    get_Retries() {
        result := ComCall(25, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The IFaxOutgoingJob::get_ScheduledTime property indicates the time to submit the fax for processing to the fax service.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_scheduledtime
     */
    get_ScheduledTime() {
        result := ComCall(26, this, "double*", &pdateScheduledTime := 0, "HRESULT")
        return pdateScheduledTime
    }

    /**
     * The IFaxOutgoingJob::get_TransmissionStart property indicates the time that the fax outbound job began transmitting. This property will have a value only after the transmission has started.
     * @remarks
     * 
     * In the case of a failed fax, this property will be assigned a value of zero. If you try to retrieve the property for a failed fax, you will receive an error.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(27, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * The IFaxOutgoingJob::get_TransmissionEnd property indicates the time that the outbound fax job completed transmission.
     * @remarks
     * 
     * The property is not valid as long as the fax is still being sent by the fax device. It will have a value only after the transmission has ended. In the case of an individual fax, once the transmission has ended, the fax will be moved to the outgoing archive, and you will not be able to retrieve this value. You can instead retrieve the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob-transmissionend-vb">TransmissionEnd</a> property. In the case of a broadcast, each fax of the broadcast remains in the outgoing queue until the entire broadcast has been completed, and you can retrieve the value for the <b>IFaxOutgoingJob::get_TransmissionEnd</b> property.
     * 
     * In the case of a failed fax, this property will be assigned a value of zero. If you try to retrieve the property for a failed fax, you will receive an error.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(28, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * The IFaxOutgoingJob::get_CSID property is a null-terminated string that contains the called station identifier (CSID) associated with the fax outbound job.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(29, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The IFaxOutgoingJob::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) associated with the fax outbound job.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(30, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The IFaxOutgoingJob::get_GroupBroadcastReceipts property is a Boolean value that indicates whether to send an individual delivery receipt for each recipient of the broadcast or to send a summary receipt for all recipients.
     * @remarks
     * 
     * Set the <b>IFaxOutgoingJob::get_GroupBroadcastReceipts</b> property for a document using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-groupbroadcastreceipts-vb">IFaxDocument::put_GroupBroadcastReceipts</a> method.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-get_groupbroadcastreceipts
     */
    get_GroupBroadcastReceipts() {
        result := ComCall(31, this, "short*", &pbGroupBroadcastReceipts := 0, "HRESULT")
        return pbGroupBroadcastReceipts
    }

    /**
     * The IFaxOutgoingJob::Pause method pauses the outbound fax job.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-pause
     */
    Pause() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingJob::Resume method resumes the paused outbound fax job.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-resume
     */
    Resume() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingJob::Restart method restarts the failed outbound fax job. For example, if the fax job has exceeded the number of retries, IFaxOutgoingJob::Restart will restart the fax job.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-restart
     */
    Restart() {
        result := ComCall(34, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingJob::CopyTiff method copies the Tagged Image File Format Class F (TIFF Class F) file associated with the outbound fax job, to a file on the local computer.
     * @param {BSTR} bstrTiffPath Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains a fully qualified path and file name on the local computer. The fax service will copy the TIFF Class F file associated with the outbound fax to the specified file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(35, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * The Refresh method refreshes FaxOutgoingJob object information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-refresh
     */
    Refresh() {
        result := ComCall(36, this, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingJob::Cancel method cancels the outbound fax job.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxoutgoingjob-cancel
     */
    Cancel() {
        result := ComCall(37, this, "HRESULT")
        return result
    }
}
