#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxSender.ahk
#Include .\IFaxRecipients.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * The IFaxDocument interface defines a messaging object used by a fax client application to compose a fax document and submit it to the fax service for processing.
 * @remarks
 * 
 * A default implementation of <b>IFaxDocument</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxdocument2">IFaxDocument2</a> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument">FaxDocument</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdocument
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDocument extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxDocument
     * @type {Guid}
     */
    static IID => Guid("{b207a246-09e3-4a4e-a7dc-fea31d29458f}")

    /**
     * The class identifier for FaxDocument
     * @type {Guid}
     */
    static CLSID => Guid("{0f3f9f91-c838-415e-a4f3-3e828ca445e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Body", "put_Body", "get_Sender", "get_Recipients", "get_CoverPage", "put_CoverPage", "get_Subject", "put_Subject", "get_Note", "put_Note", "get_ScheduleTime", "put_ScheduleTime", "get_ReceiptAddress", "put_ReceiptAddress", "get_DocumentName", "put_DocumentName", "get_CallHandle", "put_CallHandle", "get_CoverPageType", "put_CoverPageType", "get_ScheduleType", "put_ScheduleType", "get_ReceiptType", "put_ReceiptType", "get_GroupBroadcastReceipts", "put_GroupBroadcastReceipts", "get_Priority", "put_Priority", "get_TapiConnection", "putref_TapiConnection", "Submit", "ConnectedSubmit", "get_AttachFaxToReceipt", "put_AttachFaxToReceipt"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_body
     */
    get_Body() {
        pbstrBody := BSTR()
        result := ComCall(7, this, "ptr", pbstrBody, "HRESULT")
        return pbstrBody
    }

    /**
     * 
     * @param {BSTR} bstrBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_body
     */
    put_Body(bstrBody) {
        bstrBody := bstrBody is String ? BSTR.Alloc(bstrBody).Value : bstrBody

        result := ComCall(8, this, "ptr", bstrBody, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFaxSender} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_sender
     */
    get_Sender() {
        result := ComCall(9, this, "ptr*", &ppFaxSender := 0, "HRESULT")
        return IFaxSender(ppFaxSender)
    }

    /**
     * 
     * @returns {IFaxRecipients} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_recipients
     */
    get_Recipients() {
        result := ComCall(10, this, "ptr*", &ppFaxRecipients := 0, "HRESULT")
        return IFaxRecipients(ppFaxRecipients)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_coverpage
     */
    get_CoverPage() {
        pbstrCoverPage := BSTR()
        result := ComCall(11, this, "ptr", pbstrCoverPage, "HRESULT")
        return pbstrCoverPage
    }

    /**
     * 
     * @param {BSTR} bstrCoverPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_coverpage
     */
    put_CoverPage(bstrCoverPage) {
        bstrCoverPage := bstrCoverPage is String ? BSTR.Alloc(bstrCoverPage).Value : bstrCoverPage

        result := ComCall(12, this, "ptr", bstrCoverPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(13, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * 
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_subject
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(14, this, "ptr", bstrSubject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_note
     */
    get_Note() {
        pbstrNote := BSTR()
        result := ComCall(15, this, "ptr", pbstrNote, "HRESULT")
        return pbstrNote
    }

    /**
     * 
     * @param {BSTR} bstrNote 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_note
     */
    put_Note(bstrNote) {
        bstrNote := bstrNote is String ? BSTR.Alloc(bstrNote).Value : bstrNote

        result := ComCall(16, this, "ptr", bstrNote, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_scheduletime
     */
    get_ScheduleTime() {
        result := ComCall(17, this, "double*", &pdateScheduleTime := 0, "HRESULT")
        return pdateScheduleTime
    }

    /**
     * 
     * @param {Float} dateScheduleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_scheduletime
     */
    put_ScheduleTime(dateScheduleTime) {
        result := ComCall(18, this, "double", dateScheduleTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR()
        result := ComCall(19, this, "ptr", pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * 
     * @param {BSTR} bstrReceiptAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_receiptaddress
     */
    put_ReceiptAddress(bstrReceiptAddress) {
        bstrReceiptAddress := bstrReceiptAddress is String ? BSTR.Alloc(bstrReceiptAddress).Value : bstrReceiptAddress

        result := ComCall(20, this, "ptr", bstrReceiptAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_documentname
     */
    get_DocumentName() {
        pbstrDocumentName := BSTR()
        result := ComCall(21, this, "ptr", pbstrDocumentName, "HRESULT")
        return pbstrDocumentName
    }

    /**
     * 
     * @param {BSTR} bstrDocumentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_documentname
     */
    put_DocumentName(bstrDocumentName) {
        bstrDocumentName := bstrDocumentName is String ? BSTR.Alloc(bstrDocumentName).Value : bstrDocumentName

        result := ComCall(22, this, "ptr", bstrDocumentName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CallHandle() {
        result := ComCall(23, this, "int*", &plCallHandle := 0, "HRESULT")
        return plCallHandle
    }

    /**
     * 
     * @param {Integer} lCallHandle 
     * @returns {HRESULT} 
     */
    put_CallHandle(lCallHandle) {
        result := ComCall(24, this, "int", lCallHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_coverpagetype
     */
    get_CoverPageType() {
        result := ComCall(25, this, "int*", &pCoverPageType := 0, "HRESULT")
        return pCoverPageType
    }

    /**
     * 
     * @param {Integer} CoverPageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_coverpagetype
     */
    put_CoverPageType(CoverPageType) {
        result := ComCall(26, this, "int", CoverPageType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_scheduletype
     */
    get_ScheduleType() {
        result := ComCall(27, this, "int*", &pScheduleType := 0, "HRESULT")
        return pScheduleType
    }

    /**
     * 
     * @param {Integer} ScheduleType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_scheduletype
     */
    put_ScheduleType(ScheduleType) {
        result := ComCall(28, this, "int", ScheduleType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_receipttype
     */
    get_ReceiptType() {
        result := ComCall(29, this, "int*", &pReceiptType := 0, "HRESULT")
        return pReceiptType
    }

    /**
     * 
     * @param {Integer} ReceiptType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_receipttype
     */
    put_ReceiptType(ReceiptType) {
        result := ComCall(30, this, "int", ReceiptType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_groupbroadcastreceipts
     */
    get_GroupBroadcastReceipts() {
        result := ComCall(31, this, "short*", &pbUseGrouping := 0, "HRESULT")
        return pbUseGrouping
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseGrouping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_groupbroadcastreceipts
     */
    put_GroupBroadcastReceipts(bUseGrouping) {
        result := ComCall(32, this, "short", bUseGrouping, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_priority
     */
    get_Priority() {
        result := ComCall(33, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_priority
     */
    put_Priority(Priority) {
        result := ComCall(34, this, "int", Priority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_TapiConnection() {
        result := ComCall(35, this, "ptr*", &ppTapiConnection := 0, "HRESULT")
        return IDispatch(ppTapiConnection)
    }

    /**
     * 
     * @param {IDispatch} pTapiConnection 
     * @returns {HRESULT} 
     */
    putref_TapiConnection(pTapiConnection) {
        result := ComCall(36, this, "ptr", pTapiConnection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxServerName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-submit
     */
    Submit(bstrFaxServerName) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        pvFaxOutgoingJobIDs := VARIANT()
        result := ComCall(37, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, "HRESULT")
        return pvFaxOutgoingJobIDs
    }

    /**
     * 
     * @param {IFaxServer} pFaxServer 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-connectedsubmit
     */
    ConnectedSubmit(pFaxServer) {
        pvFaxOutgoingJobIDs := VARIANT()
        result := ComCall(38, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, "HRESULT")
        return pvFaxOutgoingJobIDs
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_attachfaxtoreceipt
     */
    get_AttachFaxToReceipt() {
        result := ComCall(39, this, "short*", &pbAttachFax := 0, "HRESULT")
        return pbAttachFax
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAttachFax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-put_attachfaxtoreceipt
     */
    put_AttachFaxToReceipt(bAttachFax) {
        result := ComCall(40, this, "short", bAttachFax, "HRESULT")
        return result
    }
}
