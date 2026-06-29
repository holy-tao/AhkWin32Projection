#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FAX_PRIORITY_TYPE_ENUM.ahk" { FAX_PRIORITY_TYPE_ENUM }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxRecipient.ahk" { IFaxRecipient }
#Import ".\IFaxSender.ahk" { IFaxSender }

/**
 * The IFaxOutgoingMessage interface describes an object that is used by a fax client application to retrieve information about a fax message in the archive of outbound faxes.
 * @remarks
 * A default implementation of <b>IFaxOutgoingMessage</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingmessage">FaxOutgoingMessage</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutgoingmessage
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutgoingMessage extends IDispatch {
    /**
     * The interface identifier for IFaxOutgoingMessage
     * @type {Guid}
     */
    static IID := Guid("{f0ea35de-caa5-4a7c-82c7-2b60ba5f2be2}")

    /**
     * The class identifier for FaxOutgoingMessage
     * @type {Guid}
     */
    static CLSID := Guid("{91b4a378-4ad8-4aef-a4dc-97d96e939a3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutgoingMessage interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SubmissionId          : IntPtr
        get_Id                    : IntPtr
        get_Subject               : IntPtr
        get_DocumentName          : IntPtr
        get_Retries               : IntPtr
        get_Pages                 : IntPtr
        get_Size                  : IntPtr
        get_OriginalScheduledTime : IntPtr
        get_SubmissionTime        : IntPtr
        get_Priority              : IntPtr
        get_Sender                : IntPtr
        get_Recipient             : IntPtr
        get_DeviceName            : IntPtr
        get_TransmissionStart     : IntPtr
        get_TransmissionEnd       : IntPtr
        get_CSID                  : IntPtr
        get_TSID                  : IntPtr
        CopyTiff                  : IntPtr
        Delete                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutgoingMessage.Vtbl()
        }
        super.__New(implObj, flags)
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
    Retries {
        get => this.get_Retries()
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
     * @type {FAX_PRIORITY_TYPE_ENUM} 
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
     * @type {BSTR} 
     */
    DeviceName {
        get => this.get_DeviceName()
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
     * The IFaxOutgoingMessage::get_SubmissionId property is a null-terminated string that contains the unique identifier assigned to the fax message during the submission process.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_submissionid
     */
    get_SubmissionId() {
        pbstrSubmissionId := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrSubmissionId, "HRESULT")
        return pbstrSubmissionId
    }

    /**
     * The IFaxOutgoingMessage::get_Id property is a null-terminated string that contains a unique identifier for the outbound fax message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_id
     */
    get_Id() {
        pbstrId := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * The IFaxOutgoingMessage::get_Subject property is a null-terminated string that contains the contents of the subject field on the cover page of the fax.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * The IFaxOutgoingMessage::get_DocumentName property is a null-terminated string that contains the user-friendly name to display for the fax message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_documentname
     */
    get_DocumentName() {
        pbstrDocumentName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrDocumentName, "HRESULT")
        return pbstrDocumentName
    }

    /**
     * The IFaxOutgoingMessage::get_Retries property is a value that indicates the number of times that the fax service attempted to transmit an outgoing fax after the initial transmission attempt failed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_retries
     */
    get_Retries() {
        result := ComCall(11, this, "int*", &plRetries := 0, "HRESULT")
        return plRetries
    }

    /**
     * The IFaxOutgoingMessage::get_Pages property is a number that indicates the total number of pages in the outbound fax message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_pages
     */
    get_Pages() {
        result := ComCall(12, this, "int*", &plPages := 0, "HRESULT")
        return plPages
    }

    /**
     * The Size property is a value that indicates the size of the Tagged Image File Format Class F (TIFF Class F) file associated with the outbound fax message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_size
     */
    get_Size() {
        result := ComCall(13, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * The IFaxOutgoingMessage::get_OriginalScheduledTime property specifies the time that the fax message was originally scheduled for transmission.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_originalscheduledtime
     */
    get_OriginalScheduledTime() {
        result := ComCall(14, this, "double*", &pdateOriginalScheduledTime := 0, "HRESULT")
        return pdateOriginalScheduledTime
    }

    /**
     * The IFaxOutgoingMessage::get_SubmissionTime property indicates the time that the outbound fax message was submitted for processing.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_submissiontime
     */
    get_SubmissionTime() {
        result := ComCall(15, this, "double*", &pdateSubmissionTime := 0, "HRESULT")
        return pdateSubmissionTime
    }

    /**
     * The IFaxOutgoingMessage::get_Priority property specifies the priority used when sending the fax; for example, normal, low, or high priority.
     * @returns {FAX_PRIORITY_TYPE_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_priority
     */
    get_Priority() {
        result := ComCall(16, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * The IFaxOutgoingMessage::get_Sender property retrieves an interface containing information about the sender of the fax message.
     * @returns {IFaxSender} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_sender
     */
    get_Sender() {
        result := ComCall(17, this, "ptr*", &ppFaxSender := 0, "HRESULT")
        return IFaxSender(ppFaxSender)
    }

    /**
     * The IFaxOutgoingMessage::get_Recipient property retrieves an interface containing information about the recipient of the fax message.
     * @returns {IFaxRecipient} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_recipient
     */
    get_Recipient() {
        result := ComCall(18, this, "ptr*", &ppFaxRecipient := 0, "HRESULT")
        return IFaxRecipient(ppFaxRecipient)
    }

    /**
     * The IFaxOutgoingMessage::get_DeviceName property is a null-terminated string that contains the name of the device on which the fax message was transmitted.
     * @remarks
     * This method returns the name of the fax device rather than the device ID. This is useful because an administrator may remove the device ID after completion of the fax job and before the client's query of the archive of fax messages.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_devicename
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * The IFaxOutgoingMessage::get_TransmissionStart property indicates the time that the fax outbound message began transmitting.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_transmissionstart
     */
    get_TransmissionStart() {
        result := ComCall(20, this, "double*", &pdateTransmissionStart := 0, "HRESULT")
        return pdateTransmissionStart
    }

    /**
     * The IFaxOutgoingMessage::get_TransmissionEnd property indicates the time that the fax outbound message completed transmission.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_transmissionend
     */
    get_TransmissionEnd() {
        result := ComCall(21, this, "double*", &pdateTransmissionEnd := 0, "HRESULT")
        return pdateTransmissionEnd
    }

    /**
     * The IFaxOutgoingMessage::get_CSID property is a null-terminated string that contains the called station identifier (CSID) for the fax message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_csid
     */
    get_CSID() {
        pbstrCSID := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pbstrCSID, "HRESULT")
        return pbstrCSID
    }

    /**
     * The IFaxOutgoingMessage::get_TSID property is a null-terminated string that contains the transmitting station identifier (TSID) associated with the fax outbound message.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-get_tsid
     */
    get_TSID() {
        pbstrTSID := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pbstrTSID, "HRESULT")
        return pbstrTSID
    }

    /**
     * The IFaxOutgoingMessage::CopyTiff method copies the Tagged Image File Format Class F (TIFF Class F) file associated with the outbound fax message, to a file on the local computer.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> or <b>farMANAGE_OUT_ARCHIVE</b> access right.
     * 
     * With the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access right, users will be able to use this method only for their own faxes. With the <b>farMANAGE_OUT_ARCHIVE</b> access right, users will be able to use this method for all faxes on the server.
     * @param {BSTR} bstrTiffPath Type: <b>BSTR</b>
     * 
     * Null-terminated string that contains a fully qualified path and file name on the local computer. This is the file on the local computer to which the fax service will copy the TIFF Class F file associated with the outbound fax message.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-copytiff
     */
    CopyTiff(bstrTiffPath) {
        bstrTiffPath := bstrTiffPath is String ? BSTR.Alloc(bstrTiffPath).Value : bstrTiffPath

        result := ComCall(24, this, BSTR, bstrTiffPath, "HRESULT")
        return result
    }

    /**
     * The IFaxOutgoingMessage::Delete method deletes the fax message from the outbound archive.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> or <b>farMANAGE_OUT_ARCHIVE</b> access right.
     * 
     * With the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access right, users will be able to use this method only for their own faxes. With the <b>farMANAGE_OUT_ARCHIVE</b> access right, users will be able to use this method for all faxes on the server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingmessage-delete
     */
    Delete() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxOutgoingMessage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SubmissionId := CallbackCreate(GetMethod(implObj, "get_SubmissionId"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Subject := CallbackCreate(GetMethod(implObj, "get_Subject"), flags, 2)
        this.vtbl.get_DocumentName := CallbackCreate(GetMethod(implObj, "get_DocumentName"), flags, 2)
        this.vtbl.get_Retries := CallbackCreate(GetMethod(implObj, "get_Retries"), flags, 2)
        this.vtbl.get_Pages := CallbackCreate(GetMethod(implObj, "get_Pages"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_OriginalScheduledTime := CallbackCreate(GetMethod(implObj, "get_OriginalScheduledTime"), flags, 2)
        this.vtbl.get_SubmissionTime := CallbackCreate(GetMethod(implObj, "get_SubmissionTime"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.get_Sender := CallbackCreate(GetMethod(implObj, "get_Sender"), flags, 2)
        this.vtbl.get_Recipient := CallbackCreate(GetMethod(implObj, "get_Recipient"), flags, 2)
        this.vtbl.get_DeviceName := CallbackCreate(GetMethod(implObj, "get_DeviceName"), flags, 2)
        this.vtbl.get_TransmissionStart := CallbackCreate(GetMethod(implObj, "get_TransmissionStart"), flags, 2)
        this.vtbl.get_TransmissionEnd := CallbackCreate(GetMethod(implObj, "get_TransmissionEnd"), flags, 2)
        this.vtbl.get_CSID := CallbackCreate(GetMethod(implObj, "get_CSID"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.CopyTiff := CallbackCreate(GetMethod(implObj, "CopyTiff"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SubmissionId)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Subject)
        CallbackFree(this.vtbl.get_DocumentName)
        CallbackFree(this.vtbl.get_Retries)
        CallbackFree(this.vtbl.get_Pages)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_OriginalScheduledTime)
        CallbackFree(this.vtbl.get_SubmissionTime)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.get_Sender)
        CallbackFree(this.vtbl.get_Recipient)
        CallbackFree(this.vtbl.get_DeviceName)
        CallbackFree(this.vtbl.get_TransmissionStart)
        CallbackFree(this.vtbl.get_TransmissionEnd)
        CallbackFree(this.vtbl.get_CSID)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.CopyTiff)
        CallbackFree(this.vtbl.Delete)
    }
}
