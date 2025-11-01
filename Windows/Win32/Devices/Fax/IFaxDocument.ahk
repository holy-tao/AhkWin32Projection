#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

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
     * @param {Pointer<BSTR>} pbstrBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_body
     */
    get_Body(pbstrBody) {
        result := ComCall(7, this, "ptr", pbstrBody, "HRESULT")
        return result
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
     * @param {Pointer<IFaxSender>} ppFaxSender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_sender
     */
    get_Sender(ppFaxSender) {
        result := ComCall(9, this, "ptr*", ppFaxSender, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxRecipients>} ppFaxRecipients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_recipients
     */
    get_Recipients(ppFaxRecipients) {
        result := ComCall(10, this, "ptr*", ppFaxRecipients, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCoverPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_coverpage
     */
    get_CoverPage(pbstrCoverPage) {
        result := ComCall(11, this, "ptr", pbstrCoverPage, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_subject
     */
    get_Subject(pbstrSubject) {
        result := ComCall(13, this, "ptr", pbstrSubject, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrNote 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_note
     */
    get_Note(pbstrNote) {
        result := ComCall(15, this, "ptr", pbstrNote, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pdateScheduleTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_scheduletime
     */
    get_ScheduleTime(pdateScheduleTime) {
        result := ComCall(17, this, "double*", pdateScheduleTime, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrReceiptAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_receiptaddress
     */
    get_ReceiptAddress(pbstrReceiptAddress) {
        result := ComCall(19, this, "ptr", pbstrReceiptAddress, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrDocumentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_documentname
     */
    get_DocumentName(pbstrDocumentName) {
        result := ComCall(21, this, "ptr", pbstrDocumentName, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plCallHandle 
     * @returns {HRESULT} 
     */
    get_CallHandle(plCallHandle) {
        result := ComCall(23, this, "int*", plCallHandle, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pCoverPageType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_coverpagetype
     */
    get_CoverPageType(pCoverPageType) {
        result := ComCall(25, this, "int*", pCoverPageType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pScheduleType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_scheduletype
     */
    get_ScheduleType(pScheduleType) {
        result := ComCall(27, this, "int*", pScheduleType, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pReceiptType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_receipttype
     */
    get_ReceiptType(pReceiptType) {
        result := ComCall(29, this, "int*", pReceiptType, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbUseGrouping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_groupbroadcastreceipts
     */
    get_GroupBroadcastReceipts(pbUseGrouping) {
        result := ComCall(31, this, "ptr", pbUseGrouping, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_priority
     */
    get_Priority(pPriority) {
        result := ComCall(33, this, "int*", pPriority, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} ppTapiConnection 
     * @returns {HRESULT} 
     */
    get_TapiConnection(ppTapiConnection) {
        result := ComCall(35, this, "ptr*", ppTapiConnection, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-submit
     */
    Submit(bstrFaxServerName, pvFaxOutgoingJobIDs) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        result := ComCall(37, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFaxServer} pFaxServer 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-connectedsubmit
     */
    ConnectedSubmit(pFaxServer, pvFaxOutgoingJobIDs) {
        result := ComCall(38, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbAttachFax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdocument-get_attachfaxtoreceipt
     */
    get_AttachFaxToReceipt(pbAttachFax) {
        result := ComCall(39, this, "ptr", pbAttachFax, "HRESULT")
        return result
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
