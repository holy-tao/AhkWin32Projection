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
     * 
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     */
    get_Subject(pbstrSubject) {
        result := ComCall(7, this, "ptr", pbstrSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDocumentName 
     * @returns {HRESULT} 
     */
    get_DocumentName(pbstrDocumentName) {
        result := ComCall(8, this, "ptr", pbstrDocumentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPages 
     * @returns {HRESULT} 
     */
    get_Pages(plPages) {
        result := ComCall(9, this, "int*", plPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSize 
     * @returns {HRESULT} 
     */
    get_Size(plSize) {
        result := ComCall(10, this, "int*", plSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubmissionId 
     * @returns {HRESULT} 
     */
    get_SubmissionId(pbstrSubmissionId) {
        result := ComCall(11, this, "ptr", pbstrSubmissionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     */
    get_Id(pbstrId) {
        result := ComCall(12, this, "ptr", pbstrId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateOriginalScheduledTime 
     * @returns {HRESULT} 
     */
    get_OriginalScheduledTime(pdateOriginalScheduledTime) {
        result := ComCall(13, this, "double*", pdateOriginalScheduledTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateSubmissionTime 
     * @returns {HRESULT} 
     */
    get_SubmissionTime(pdateSubmissionTime) {
        result := ComCall(14, this, "double*", pdateSubmissionTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pReceiptType 
     * @returns {HRESULT} 
     */
    get_ReceiptType(pReceiptType) {
        result := ComCall(15, this, "int*", pReceiptType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPriority 
     * @returns {HRESULT} 
     */
    get_Priority(pPriority) {
        result := ComCall(16, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSender>} ppFaxSender 
     * @returns {HRESULT} 
     */
    get_Sender(ppFaxSender) {
        result := ComCall(17, this, "ptr", ppFaxSender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxRecipient>} ppFaxRecipient 
     * @returns {HRESULT} 
     */
    get_Recipient(ppFaxRecipient) {
        result := ComCall(18, this, "ptr", ppFaxRecipient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCurrentPage 
     * @returns {HRESULT} 
     */
    get_CurrentPage(plCurrentPage) {
        result := ComCall(19, this, "int*", plCurrentPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDeviceId 
     * @returns {HRESULT} 
     */
    get_DeviceId(plDeviceId) {
        result := ComCall(20, this, "int*", plDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(21, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pExtendedStatusCode 
     * @returns {HRESULT} 
     */
    get_ExtendedStatusCode(pExtendedStatusCode) {
        result := ComCall(22, this, "int*", pExtendedStatusCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtendedStatus 
     * @returns {HRESULT} 
     */
    get_ExtendedStatus(pbstrExtendedStatus) {
        result := ComCall(23, this, "ptr", pbstrExtendedStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAvailableOperations 
     * @returns {HRESULT} 
     */
    get_AvailableOperations(pAvailableOperations) {
        result := ComCall(24, this, "int*", pAvailableOperations, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRetries 
     * @returns {HRESULT} 
     */
    get_Retries(plRetries) {
        result := ComCall(25, this, "int*", plRetries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateScheduledTime 
     * @returns {HRESULT} 
     */
    get_ScheduledTime(pdateScheduledTime) {
        result := ComCall(26, this, "double*", pdateScheduledTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateTransmissionStart 
     * @returns {HRESULT} 
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(27, this, "double*", pdateTransmissionStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(28, this, "double*", pdateTransmissionEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     */
    get_CSID(pbstrCSID) {
        result := ComCall(29, this, "ptr", pbstrCSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     */
    get_TSID(pbstrTSID) {
        result := ComCall(30, this, "ptr", pbstrTSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbGroupBroadcastReceipts 
     * @returns {HRESULT} 
     */
    get_GroupBroadcastReceipts(pbGroupBroadcastReceipts) {
        result := ComCall(31, this, "ptr", pbGroupBroadcastReceipts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(33, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Restart() {
        result := ComCall(34, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrTiffPath 
     * @returns {HRESULT} 
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(35, this, "ptr", bstrTiffPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(36, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
