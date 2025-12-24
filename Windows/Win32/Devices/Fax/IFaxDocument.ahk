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
     * @type {BSTR} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * @type {IFaxSender} 
     */
    Sender {
        get => this.get_Sender()
    }

    /**
     * @type {IFaxRecipients} 
     */
    Recipients {
        get => this.get_Recipients()
    }

    /**
     * @type {BSTR} 
     */
    CoverPage {
        get => this.get_CoverPage()
        set => this.put_CoverPage(value)
    }

    /**
     * @type {BSTR} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * @type {BSTR} 
     */
    Note {
        get => this.get_Note()
        set => this.put_Note(value)
    }

    /**
     * @type {Float} 
     */
    ScheduleTime {
        get => this.get_ScheduleTime()
        set => this.put_ScheduleTime(value)
    }

    /**
     * @type {BSTR} 
     */
    ReceiptAddress {
        get => this.get_ReceiptAddress()
        set => this.put_ReceiptAddress(value)
    }

    /**
     * @type {BSTR} 
     */
    DocumentName {
        get => this.get_DocumentName()
        set => this.put_DocumentName(value)
    }

    /**
     * @type {Integer} 
     */
    CallHandle {
        get => this.get_CallHandle()
        set => this.put_CallHandle(value)
    }

    /**
     * @type {Integer} 
     */
    CoverPageType {
        get => this.get_CoverPageType()
        set => this.put_CoverPageType(value)
    }

    /**
     * @type {Integer} 
     */
    ScheduleType {
        get => this.get_ScheduleType()
        set => this.put_ScheduleType(value)
    }

    /**
     * @type {Integer} 
     */
    ReceiptType {
        get => this.get_ReceiptType()
        set => this.put_ReceiptType(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    GroupBroadcastReceipts {
        get => this.get_GroupBroadcastReceipts()
        set => this.put_GroupBroadcastReceipts(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {IDispatch} 
     */
    TapiConnection {
        get => this.get_TapiConnection()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AttachFaxToReceipt {
        get => this.get_AttachFaxToReceipt()
        set => this.put_AttachFaxToReceipt(value)
    }

    /**
     * The IFaxDocument::get_Body property provides the path to the file that comprises the body of a fax. The body of a fax consists of the fax pages other than the cover page.
     * @remarks
     * 
     * Examples of documents that you can send as a fax body are a text file (.txt), a Microsoft Word document (.doc), or a Microsoft Excel spreadsheet (.xls). When you send a fax from a client computer, the body has to be associated with an application that is installed on that computer, and the application has to support the <b>PrintTo</b> verb; otherwise, the fax will fail.
     * 
     * Either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-bodies-vb">Bodies</a> property or the <b>IFaxDocument::get_Body</b> property must be <b>NULL</b>. You must use <b>Bodies</b> if you will be submitting with either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-connectedsubmit2-vb">ConnectedSubmit2</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-submit2-vb">Submit2</a> (both available only in Windows Vista or later). You must use <b>IFaxDocument::get_Body</b> if you will be submitting with either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-connectedsubmit">ConnectedSubmit</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-submit-vb">IFaxDocument::Submit</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_body
     */
    get_Body() {
        pbstrBody := BSTR()
        result := ComCall(7, this, "ptr", pbstrBody, "HRESULT")
        return pbstrBody
    }

    /**
     * The IFaxDocument::get_Body property provides the path to the file that comprises the body of a fax. The body of a fax consists of the fax pages other than the cover page.
     * @remarks
     * 
     * Examples of documents that you can send as a fax body are a text file (.txt), a Microsoft Word document (.doc), or a Microsoft Excel spreadsheet (.xls). When you send a fax from a client computer, the body has to be associated with an application that is installed on that computer, and the application has to support the <b>PrintTo</b> verb; otherwise, the fax will fail.
     * 
     * Either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-bodies-vb">Bodies</a> property or the <b>IFaxDocument::get_Body</b> property must be <b>NULL</b>. You must use <b>Bodies</b> if you will be submitting with either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-connectedsubmit2-vb">ConnectedSubmit2</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument2-submit2-vb">Submit2</a> (both available only in Windows Vista or later). You must use <b>IFaxDocument::get_Body</b> if you will be submitting with either <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-connectedsubmit">ConnectedSubmit</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-submit-vb">IFaxDocument::Submit</a>.
     * 
     * 
     * @param {BSTR} bstrBody 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_body
     */
    put_Body(bstrBody) {
        bstrBody := bstrBody is String ? BSTR.Alloc(bstrBody).Value : bstrBody

        result := ComCall(8, this, "ptr", bstrBody, "HRESULT")
        return result
    }

    /**
     * Retrieves an object containing information about the sender of the fax document.
     * @returns {IFaxSender} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_sender
     */
    get_Sender() {
        result := ComCall(9, this, "ptr*", &ppFaxSender := 0, "HRESULT")
        return IFaxSender(ppFaxSender)
    }

    /**
     * The IFaxDocument::get_Recipients property retrieves a collection of one or more recipients for the fax document.
     * @returns {IFaxRecipients} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_recipients
     */
    get_Recipients() {
        result := ComCall(10, this, "ptr*", &ppFaxRecipients := 0, "HRESULT")
        return IFaxRecipients(ppFaxRecipients)
    }

    /**
     * The IFaxDocument::get_CoverPage property is a null-terminated string that contains the name of the cover page template file (.cov) to associate with the fax document.
     * @remarks
     * 
     * To specify a server-based cover page file, you must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-coverpagetype-vb">IFaxDocument::get_CoverPageType</a> property to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum">fcptSERVER</a>.
     * 
     *                 
     * 
     * To specify a local or personal cover page file, you must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-coverpagetype-vb">IFaxDocument::get_CoverPageType</a> property to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum">fcptLOCAL</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_coverpage
     */
    get_CoverPage() {
        pbstrCoverPage := BSTR()
        result := ComCall(11, this, "ptr", pbstrCoverPage, "HRESULT")
        return pbstrCoverPage
    }

    /**
     * The IFaxDocument::get_CoverPage property is a null-terminated string that contains the name of the cover page template file (.cov) to associate with the fax document.
     * @remarks
     * 
     * To specify a server-based cover page file, you must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-coverpagetype-vb">IFaxDocument::get_CoverPageType</a> property to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum">fcptSERVER</a>.
     * 
     *                 
     * 
     * To specify a local or personal cover page file, you must set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-coverpagetype-vb">IFaxDocument::get_CoverPageType</a> property to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum">fcptLOCAL</a>.
     * 
     * 
     * @param {BSTR} bstrCoverPage 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_coverpage
     */
    put_CoverPage(bstrCoverPage) {
        bstrCoverPage := bstrCoverPage is String ? BSTR.Alloc(bstrCoverPage).Value : bstrCoverPage

        result := ComCall(12, this, "ptr", bstrCoverPage, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_Subject property is a null-terminated string that contains the contents of the subject field on the cover page of the fax.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_subject
     */
    get_Subject() {
        pbstrSubject := BSTR()
        result := ComCall(13, this, "ptr", pbstrSubject, "HRESULT")
        return pbstrSubject
    }

    /**
     * The IFaxDocument::get_Subject property is a null-terminated string that contains the contents of the subject field on the cover page of the fax.
     * @param {BSTR} bstrSubject 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_subject
     */
    put_Subject(bstrSubject) {
        bstrSubject := bstrSubject is String ? BSTR.Alloc(bstrSubject).Value : bstrSubject

        result := ComCall(14, this, "ptr", bstrSubject, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_Note property is a null-terminated string that contains the contents of the note field on the cover page of the fax.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_note
     */
    get_Note() {
        pbstrNote := BSTR()
        result := ComCall(15, this, "ptr", pbstrNote, "HRESULT")
        return pbstrNote
    }

    /**
     * The IFaxDocument::get_Note property is a null-terminated string that contains the contents of the note field on the cover page of the fax.
     * @param {BSTR} bstrNote 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_note
     */
    put_Note(bstrNote) {
        bstrNote := bstrNote is String ? BSTR.Alloc(bstrNote).Value : bstrNote

        result := ComCall(16, this, "ptr", bstrNote, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_ScheduleTime property indicates the time to submit the fax for processing to the fax service.
     * @remarks
     * 
     * If the time specified has passed, the fax service sends the fax as soon as a device is available. By default, <b>IFaxDocument::get_ScheduleTime</b> is set to zero, meaning that no time is specified.
     * 
     * Note that the fax service ignores this parameter unless you set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-scheduletype-vb">IFaxDocument::get_ScheduleType</a> property to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_schedule_type_enum">fstSpecific_TIME</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>IFaxDocument::get_ScheduleTime</b> property must include the date and time for submitting the fax.</div>
     * <div> </div>
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_scheduletime
     */
    get_ScheduleTime() {
        result := ComCall(17, this, "double*", &pdateScheduleTime := 0, "HRESULT")
        return pdateScheduleTime
    }

    /**
     * The IFaxDocument::get_ScheduleTime property indicates the time to submit the fax for processing to the fax service.
     * @remarks
     * 
     * If the time specified has passed, the fax service sends the fax as soon as a device is available. By default, <b>IFaxDocument::get_ScheduleTime</b> is set to zero, meaning that no time is specified.
     * 
     * Note that the fax service ignores this parameter unless you set the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-scheduletype-vb">IFaxDocument::get_ScheduleType</a> property to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_schedule_type_enum">fstSpecific_TIME</a>.
     * 
     * <div class="alert"><b>Note</b>  The value of the <b>IFaxDocument::get_ScheduleTime</b> property must include the date and time for submitting the fax.</div>
     * <div> </div>
     * 
     * 
     * @param {Float} dateScheduleTime 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_scheduletime
     */
    put_ScheduleTime(dateScheduleTime) {
        result := ComCall(18, this, "double", dateScheduleTime, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_ReceiptAddress property is a null-terminated string that indicates the email address to which the fax service should send a delivery receipt when the fax job reaches a final state.
     * @remarks
     * 
     * This property has meaning only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-receipttype-vb">ReceiptType</a> property for the document is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtMail</a>, indicating that the delivery receipt will be sent by email.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_receiptaddress
     */
    get_ReceiptAddress() {
        pbstrReceiptAddress := BSTR()
        result := ComCall(19, this, "ptr", pbstrReceiptAddress, "HRESULT")
        return pbstrReceiptAddress
    }

    /**
     * The IFaxDocument::get_ReceiptAddress property is a null-terminated string that indicates the email address to which the fax service should send a delivery receipt when the fax job reaches a final state.
     * @remarks
     * 
     * This property has meaning only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-receipttype-vb">ReceiptType</a> property for the document is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtMail</a>, indicating that the delivery receipt will be sent by email.
     * 
     * 
     * @param {BSTR} bstrReceiptAddress 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_receiptaddress
     */
    put_ReceiptAddress(bstrReceiptAddress) {
        bstrReceiptAddress := bstrReceiptAddress is String ? BSTR.Alloc(bstrReceiptAddress).Value : bstrReceiptAddress

        result := ComCall(20, this, "ptr", bstrReceiptAddress, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_DocumentName property is a null-terminated string that contains the user-friendly name to display for the fax document. The value is for display purposes only.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_documentname
     */
    get_DocumentName() {
        pbstrDocumentName := BSTR()
        result := ComCall(21, this, "ptr", pbstrDocumentName, "HRESULT")
        return pbstrDocumentName
    }

    /**
     * The IFaxDocument::get_DocumentName property is a null-terminated string that contains the user-friendly name to display for the fax document. The value is for display purposes only.
     * @param {BSTR} bstrDocumentName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_documentname
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
     * The IFaxDocument::get_CoverPageType property is a value from an enumeration that indicates whether a specified cover page template file (.cov) is a server-based cover page file or a local-computer-based cover page file.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_CoverPageType</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum">fcptNONE</a>, indicating that no file is used.
     * 
     * Provide the name of the cover page in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-coverpage-vb">IFaxDocument::get_CoverPage</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_coverpagetype
     */
    get_CoverPageType() {
        result := ComCall(25, this, "int*", &pCoverPageType := 0, "HRESULT")
        return pCoverPageType
    }

    /**
     * The IFaxDocument::get_CoverPageType property is a value from an enumeration that indicates whether a specified cover page template file (.cov) is a server-based cover page file or a local-computer-based cover page file.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_CoverPageType</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_coverpage_type_enum">fcptNONE</a>, indicating that no file is used.
     * 
     * Provide the name of the cover page in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-coverpage-vb">IFaxDocument::get_CoverPage</a> property.
     * 
     * 
     * @param {Integer} CoverPageType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_coverpagetype
     */
    put_CoverPageType(CoverPageType) {
        result := ComCall(26, this, "int", CoverPageType, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_ScheduleType property indicates when to schedule the fax job; for example, you can specify that the fax service send the fax immediately, at a specified time, or during a predefined discount period.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_ScheduleType</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_schedule_type_enum">fstNOW</a>, indicating that the fax will be sent as soon as the device is available.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_scheduletype
     */
    get_ScheduleType() {
        result := ComCall(27, this, "int*", &pScheduleType := 0, "HRESULT")
        return pScheduleType
    }

    /**
     * The IFaxDocument::get_ScheduleType property indicates when to schedule the fax job; for example, you can specify that the fax service send the fax immediately, at a specified time, or during a predefined discount period.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_ScheduleType</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_schedule_type_enum">fstNOW</a>, indicating that the fax will be sent as soon as the device is available.
     * 
     * 
     * @param {Integer} ScheduleType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_scheduletype
     */
    put_ScheduleType(ScheduleType) {
        result := ComCall(28, this, "int", ScheduleType, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_ReceiptType property specifies the type of delivery receipt to deliver when the fax job reaches a final state.
     * @remarks
     * 
     * The fax service sends a report (a delivery receipt) to the sender of the fax when the fax completes successfully or when the fax transmission fails.
     * 
     * If an email receipt will be sent, an address has to be provided in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-receiptaddress-vb">IFaxDocument::get_ReceiptAddress</a> property. If the receipt type is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtMSGBOX</a>, the message box will appear on the computer from which the document was sent. By default, <b>ReceiptType</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtNONE</a>, indicating that no receipt will be sent.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_receipttype
     */
    get_ReceiptType() {
        result := ComCall(29, this, "int*", &pReceiptType := 0, "HRESULT")
        return pReceiptType
    }

    /**
     * The IFaxDocument::get_ReceiptType property specifies the type of delivery receipt to deliver when the fax job reaches a final state.
     * @remarks
     * 
     * The fax service sends a report (a delivery receipt) to the sender of the fax when the fax completes successfully or when the fax transmission fails.
     * 
     * If an email receipt will be sent, an address has to be provided in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdocument-receiptaddress-vb">IFaxDocument::get_ReceiptAddress</a> property. If the receipt type is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtMSGBOX</a>, the message box will appear on the computer from which the document was sent. By default, <b>ReceiptType</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_receipt_type_enum">frtNONE</a>, indicating that no receipt will be sent.
     * 
     * 
     * @param {Integer} ReceiptType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_receipttype
     */
    put_ReceiptType(ReceiptType) {
        result := ComCall(30, this, "int", ReceiptType, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_GroupBroadcastReceipts property is a Boolean value that indicates whether to send an individual delivery receipt for each recipient of the broadcast, or to send a summary receipt for all the recipients.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_groupbroadcastreceipts
     */
    get_GroupBroadcastReceipts() {
        result := ComCall(31, this, "short*", &pbUseGrouping := 0, "HRESULT")
        return pbUseGrouping
    }

    /**
     * The IFaxDocument::get_GroupBroadcastReceipts property is a Boolean value that indicates whether to send an individual delivery receipt for each recipient of the broadcast, or to send a summary receipt for all the recipients.
     * @param {VARIANT_BOOL} bUseGrouping 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_groupbroadcastreceipts
     */
    put_GroupBroadcastReceipts(bUseGrouping) {
        result := ComCall(32, this, "short", bUseGrouping, "HRESULT")
        return result
    }

    /**
     * The IFaxDocument::get_Priority property specifies the priority to use when sending the fax; for example, normal, low, or high priority.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_Priority</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_priority_type_enum">fptLow</a>, which indicates low priority.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_priority
     */
    get_Priority() {
        result := ComCall(33, this, "int*", &pPriority := 0, "HRESULT")
        return pPriority
    }

    /**
     * The IFaxDocument::get_Priority property specifies the priority to use when sending the fax; for example, normal, low, or high priority.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_Priority</b> is set to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_priority_type_enum">fptLow</a>, which indicates low priority.
     * 
     * 
     * @param {Integer} Priority 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_priority
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
     * The IFaxDocument::Submit method submits a single fax document to the fax service for processing.
     * @param {BSTR} bstrFaxServerName Type: <b>BSTR</b>
     * 
     * <b>BSTR</b> that specifies a fax server. If this parameter is <b>NULL</b> or an empty string, the local fax server is specified.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * <b>VARIANT</b> that specifies a collection of outbound job IDs, one for each recipient of the fax.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-submit
     */
    Submit(bstrFaxServerName) {
        bstrFaxServerName := bstrFaxServerName is String ? BSTR.Alloc(bstrFaxServerName).Value : bstrFaxServerName

        pvFaxOutgoingJobIDs := VARIANT()
        result := ComCall(37, this, "ptr", bstrFaxServerName, "ptr", pvFaxOutgoingJobIDs, "HRESULT")
        return pvFaxOutgoingJobIDs
    }

    /**
     * The IFaxDocument::ConnectedSubmit method submits a single fax document to the connected IFaxServer. The method returns an array of fax job ID strings, one for each recipient of the fax.
     * @param {IFaxServer} pFaxServer Type: <b>IFaxServer*</b>
     * 
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxserver">IFaxServer</a> interface that specifies a connected fax server.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * <b>VARIANT</b> that holds an array of outbound job ID strings, one for each recipient of the fax.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-connectedsubmit
     */
    ConnectedSubmit(pFaxServer) {
        pvFaxOutgoingJobIDs := VARIANT()
        result := ComCall(38, this, "ptr", pFaxServer, "ptr", pvFaxOutgoingJobIDs, "HRESULT")
        return pvFaxOutgoingJobIDs
    }

    /**
     * The IFaxDocument::get_AttachFaxToReceipt property indicates whether to attach a fax to the receipt.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_AttachFaxToReceipt</b> is set to <b>FALSE</b>.
     * 
     * When a fax consisting only of a cover page is sent to multiple recipients, you cannot attach the fax to the receipt because the fax differs for each recipient. If there is a fax body, then the body can be attached to the receipt, even when there are multiple recipients.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-get_attachfaxtoreceipt
     */
    get_AttachFaxToReceipt() {
        result := ComCall(39, this, "short*", &pbAttachFax := 0, "HRESULT")
        return pbAttachFax
    }

    /**
     * The IFaxDocument::get_AttachFaxToReceipt property indicates whether to attach a fax to the receipt.
     * @remarks
     * 
     * By default, <b>IFaxDocument::get_AttachFaxToReceipt</b> is set to <b>FALSE</b>.
     * 
     * When a fax consisting only of a cover page is sent to multiple recipients, you cannot attach the fax to the receipt because the fax differs for each recipient. If there is a fax body, then the body can be attached to the receipt, even when there are multiple recipients.
     * 
     * 
     * @param {VARIANT_BOOL} bAttachFax 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxdocument-put_attachfaxtoreceipt
     */
    put_AttachFaxToReceipt(bAttachFax) {
        result := ComCall(40, this, "short", bAttachFax, "HRESULT")
        return result
    }
}
