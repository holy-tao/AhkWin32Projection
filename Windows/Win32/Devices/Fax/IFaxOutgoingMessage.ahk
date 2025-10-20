#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingMessage interface describes an object that is used by a fax client application to retrieve information about a fax message in the archive of outbound faxes.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutgoingMessage</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage">FaxOutgoingMessage</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingmessage
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingMessage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingMessage
     * @type {Guid}
     */
    static IID => Guid("{f0ea35de-caa5-4a7c-82c7-2b60ba5f2be2}")

    /**
     * The class identifier for FaxOutgoingMessage
     * @type {Guid}
     */
    static CLSID => Guid("{91b4a378-4ad8-4aef-a4dc-97d96e939a3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubmissionId", "get_Id", "get_Subject", "get_DocumentName", "get_Retries", "get_Pages", "get_Size", "get_OriginalScheduledTime", "get_SubmissionTime", "get_Priority", "get_Sender", "get_Recipient", "get_DeviceName", "get_TransmissionStart", "get_TransmissionEnd", "get_CSID", "get_TSID", "CopyTiff", "Delete"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubmissionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_submissionid
     */
    get_SubmissionId(pbstrSubmissionId) {
        result := ComCall(7, this, "ptr", pbstrSubmissionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_id
     */
    get_Id(pbstrId) {
        result := ComCall(8, this, "ptr", pbstrId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_subject
     */
    get_Subject(pbstrSubject) {
        result := ComCall(9, this, "ptr", pbstrSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDocumentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_documentname
     */
    get_DocumentName(pbstrDocumentName) {
        result := ComCall(10, this, "ptr", pbstrDocumentName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_retries
     */
    get_Retries(plRetries) {
        result := ComCall(11, this, "int*", plRetries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_pages
     */
    get_Pages(plPages) {
        result := ComCall(12, this, "int*", plPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_size
     */
    get_Size(plSize) {
        result := ComCall(13, this, "int*", plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateOriginalScheduledTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_originalscheduledtime
     */
    get_OriginalScheduledTime(pdateOriginalScheduledTime) {
        result := ComCall(14, this, "double*", pdateOriginalScheduledTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateSubmissionTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_submissiontime
     */
    get_SubmissionTime(pdateSubmissionTime) {
        result := ComCall(15, this, "double*", pdateSubmissionTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_priority
     */
    get_Priority(pPriority) {
        result := ComCall(16, this, "int*", pPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxSender>} ppFaxSender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_sender
     */
    get_Sender(ppFaxSender) {
        result := ComCall(17, this, "ptr*", ppFaxSender, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxRecipient>} ppFaxRecipient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_recipient
     */
    get_Recipient(ppFaxRecipient) {
        result := ComCall(18, this, "ptr*", ppFaxRecipient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_devicename
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(19, this, "ptr", pbstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_transmissionstart
     */
    get_TransmissionStart(pdateTransmissionStart) {
        result := ComCall(20, this, "double*", pdateTransmissionStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdateTransmissionEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_transmissionend
     */
    get_TransmissionEnd(pdateTransmissionEnd) {
        result := ComCall(21, this, "double*", pdateTransmissionEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_csid
     */
    get_CSID(pbstrCSID) {
        result := ComCall(22, this, "ptr", pbstrCSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_tsid
     */
    get_TSID(pbstrTSID) {
        result := ComCall(23, this, "ptr", pbstrTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTiffPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(24, this, "ptr", bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-delete
     */
    Delete() {
        result := ComCall(25, this, "HRESULT")
        return result
    }
}
