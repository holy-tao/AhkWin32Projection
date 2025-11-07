#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxSender.ahk
#Include .\IFaxRecipient.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_submissionid
     */
    get_SubmissionId() {
        pbstrSubmissionId := BSTR()
        result := ComCall(7, this, "ptr", pbstrSubmissionId, "HRESULT")
        return pbstrSubmissionId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_id
     */
    get_Id() {
        pbstrId := BSTR()
        result := ComCall(8, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(9, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_documentname
     */
    get_DocumentName() {
        pbstrDocumentName := BSTR()
        result := ComCall(10, this, "ptr", pbstrDocumentName, "HRESULT")
        return pbstrDocumentName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_retries
     */
    get_Retries() {
        result := ComCall(11, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_pages
     */
    get_Pages() {
        result := ComCall(12, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_size
     */
    get_Size() {
        result := ComCall(13, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_originalscheduledtime
     */
    get_OriginalScheduledTime() {
        result := ComCall(14, this, "double*", &pdateOriginalScheduledTime := 0, "HRESULT")
        return pdateOriginalScheduledTime
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_submissiontime
     */
    get_SubmissionTime() {
        result := ComCall(15, this, "double*", &pdateSubmissionTime := 0, "HRESULT")
        return pdateSubmissionTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_priority
     */
    get_Priority() {
        result := ComCall(16, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * 
     * @returns {IFaxSender} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_sender
     */
    get_Sender() {
        result := ComCall(17, this, "ptr*", &ppFaxSender := 0, "HRESULT")
        return IFaxSender(ppFaxSender)
    }

    /**
     * 
     * @returns {IFaxRecipient} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_recipient
     */
    get_Recipient() {
        result := ComCall(18, this, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(19, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(20, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(21, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR()
        result := ComCall(22, this, "ptr", pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR()
        result := ComCall(23, this, "ptr", pbstrTSID, "HRESULT")
        return pbstrTSID
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
