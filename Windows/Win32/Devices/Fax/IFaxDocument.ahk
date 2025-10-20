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
     * 
     * @param {Pointer<BSTR>} pbstrBody 
     * @returns {HRESULT} 
     */
    get_Body(pbstrBody) {
        result := ComCall(7, this, "ptr", pbstrBody, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrBody 
     * @returns {HRESULT} 
     */
    put_Body(bstrBody) {
        bstrBody := bstrBody is String ? BSTR.Alloc(bstrBody).Value : bstrBody

        result := ComCall(8, this, "ptr", bstrBody, "int")
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
        result := ComCall(9, this, "ptr", ppFaxSender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxRecipients>} ppFaxRecipients 
     * @returns {HRESULT} 
     */
    get_Recipients(ppFaxRecipients) {
        result := ComCall(10, this, "ptr", ppFaxRecipients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCoverPage 
     * @returns {HRESULT} 
     */
    get_CoverPage(pbstrCoverPage) {
        result := ComCall(11, this, "ptr", pbstrCoverPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCoverPage 
     * @returns {HRESULT} 
     */
    put_CoverPage(bstrCoverPage) {
        bstrCoverPage := bstrCoverPage is String ? BSTR.Alloc(bstrCoverPage).Value : bstrCoverPage

        result := ComCall(12, this, "ptr", bstrCoverPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubject 
     * @returns {HRESULT} 
     */
    get_Subject(pbstrSubject) {
        result := ComCall(13, this, "ptr", pbstrSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(14, this, "ptr", bstrSubject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNote 
     * @returns {HRESULT} 
     */
    get_Note(pbstrNote) {
        result := ComCall(15, this, "ptr", pbstrNote, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrNote 
     * @returns {HRESULT} 
     */
    put_Note(bstrNote) {
        bstrNote := bstrNote is String ? BSTR.Alloc(bstrNote).Value : bstrNote

        result := ComCall(16, this, "ptr", bstrNote, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdateScheduleTime 
     * @returns {HRESULT} 
     */
    get_ScheduleTime(pdateScheduleTime) {
        result := ComCall(17, this, "double*", pdateScheduleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dateScheduleTime 
     * @returns {HRESULT} 
     */
    put_ScheduleTime(dateScheduleTime) {
        result := ComCall(18, this, "double", dateScheduleTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrReceiptAddress 
     * @returns {HRESULT} 
     */
    get_ReceiptAddress(pbstrReceiptAddress) {
        result := ComCall(19, this, "ptr", pbstrReceiptAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrReceiptAddress 
     * @returns {HRESULT} 
     */
    put_ReceiptAddress(bstrReceiptAddress) {
        bstrReceiptAddress := bstrReceiptAddress is String ? BSTR.Alloc(bstrReceiptAddress).Value : bstrReceiptAddress

        result := ComCall(20, this, "ptr", bstrReceiptAddress, "int")
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
        result := ComCall(21, this, "ptr", pbstrDocumentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDocumentName 
     * @returns {HRESULT} 
     */
    put_DocumentName(bstrDocumentName) {
        bstrDocumentName := bstrDocumentName is String ? BSTR.Alloc(bstrDocumentName).Value : bstrDocumentName

        result := ComCall(22, this, "ptr", bstrDocumentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCallHandle 
     * @returns {HRESULT} 
     */
    get_CallHandle(plCallHandle) {
        result := ComCall(23, this, "int*", plCallHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCallHandle 
     * @returns {HRESULT} 
     */
    put_CallHandle(lCallHandle) {
        result := ComCall(24, this, "int", lCallHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCoverPageType 
     * @returns {HRESULT} 
     */
    get_CoverPageType(pCoverPageType) {
        result := ComCall(25, this, "int*", pCoverPageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CoverPageType 
     * @returns {HRESULT} 
     */
    put_CoverPageType(CoverPageType) {
        result := ComCall(26, this, "int", CoverPageType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pScheduleType 
     * @returns {HRESULT} 
     */
    get_ScheduleType(pScheduleType) {
        result := ComCall(27, this, "int*", pScheduleType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ScheduleType 
     * @returns {HRESULT} 
     */
    put_ScheduleType(ScheduleType) {
        result := ComCall(28, this, "int", ScheduleType, "int")
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
        result := ComCall(29, this, "int*", pReceiptType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ReceiptType 
     * @returns {HRESULT} 
     */
    put_ReceiptType(ReceiptType) {
        result := ComCall(30, this, "int", ReceiptType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseGrouping 
     * @returns {HRESULT} 
     */
    get_GroupBroadcastReceipts(pbUseGrouping) {
        result := ComCall(31, this, "ptr", pbUseGrouping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseGrouping 
     * @returns {HRESULT} 
     */
    put_GroupBroadcastReceipts(bUseGrouping) {
        result := ComCall(32, this, "short", bUseGrouping, "int")
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
        result := ComCall(33, this, "int*", pPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     */
    put_Priority(Priority) {
        result := ComCall(34, this, "int", Priority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppTapiConnection 
     * @returns {HRESULT} 
     */
    get_TapiConnection(ppTapiConnection) {
        result := ComCall(35, this, "ptr", ppTapiConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pTapiConnection 
     * @returns {HRESULT} 
     */
    putref_TapiConnection(pTapiConnection) {
        result := ComCall(36, this, "ptr", pTapiConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxServerName 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @returns {HRESULT} 
     */
    Submit(bstrFaxServerName, pvFaxOutgoingJobIDs) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        result := ComCall(37, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFaxServer>} pFaxServer 
     * @param {Pointer<VARIANT>} pvFaxOutgoingJobIDs 
     * @returns {HRESULT} 
     */
    ConnectedSubmit(pFaxServer, pvFaxOutgoingJobIDs) {
        result := ComCall(38, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbAttachFax 
     * @returns {HRESULT} 
     */
    get_AttachFaxToReceipt(pbAttachFax) {
        result := ComCall(39, this, "ptr", pbAttachFax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bAttachFax 
     * @returns {HRESULT} 
     */
    put_AttachFaxToReceipt(bAttachFax) {
        result := ComCall(40, this, "short", bAttachFax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
